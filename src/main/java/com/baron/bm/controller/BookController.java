package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.support.SimpleCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.SearchResult;
import com.baron.member.service.BookService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class BookController {

	String book_cd1;

	@Autowired
	private BookService bookservice;

	@Autowired
	private RentService rentservice;

	@Autowired
	private RequestService requestservice;

	Calendar cal = Calendar.getInstance();				
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");				
	String nowDate = sdf.format(cal.getTime());

	@RequestMapping("/insertbookForm")
	public String insertbook() throws Exception {
//		bookservice.updateDate();
		return "book/insertbook";
	}

	@RequestMapping("/insertbook")
	public String insertresult(BookModel model) {
		model.setRcv_date(nowDate); 
		model.setQuantity(1);
		model.setIsbn("");
		bookservice.insertBook(model);
		return "book/insertbookresult";
	}

	@RequestMapping("/bookInfo")
	public String bookInfo(String book_cd, Model model, BookModel book) {
		book = bookservice.selectBook(book_cd);
		model.addAttribute("book", book);

		return "book/bookInfo";
	}
 
	@RequestMapping("/searchBook")
	public ModelAndView searchBook(HttpServletRequest request, String keyword, String listType, String datepicker1, String datepicker2, String field,
			ModelAndView mav) throws NullPointerException {

		List<CodeModel> BCodeList = new ArrayList<CodeModel>();
		if (listType == null)  {
			if (field == null){field = "title";}
			List<SearchResult> bookList = bookservice.searchBook(field, keyword);
			mav.addObject("bookList", bookList);
			mav.addObject("listType", "");
		}else{
			if ( datepicker1 == null){				
				Calendar cal = Calendar.getInstance();				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");				
				Date date2 = cal.getTime();
				cal.add(cal.MONTH, -1);
				Date date1 = cal.getTime();
				datepicker1 = sdf.format(date1); 
				datepicker2 = sdf.format(date2);
			}
			List<BookModel> bookList = bookservice.listBook(listType, datepicker1, datepicker2);
			mav.addObject("bookList", bookList);
			mav.addObject("date1", datepicker1);
			mav.addObject("date2", datepicker2);
			mav.addObject("listType", listType);
		} 

		BCodeList = bookservice.selectBCodeList(); 
		mav.addObject("BCodeList", BCodeList);
		 
		
		String permission = "";
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();

			}
		} 
		if (permission.equals("1")) {
			mav.setViewName("book/bookSearchByAdmin");
			return mav;
		} else {
			mav.setViewName("book/bookSearch");
			return mav;
		}
	}
	
		
//	@RequestMapping("/bookList")
//	public String BookList(HttpServletRequest request, String listType, Model model) {
// 
//		List<BookModel> bookList = bookservice.bookList(listType );
//		model.addAttribute("bookList", bookList);
//		
//		String permission = "";
//		for (Cookie cookie : request.getCookies()) {
//			if (cookie.getName().equals("bm_permission")) {
//				permission = cookie.getValue(); 
//			}
//		} 
//		if (permission.equals("1")) {
//			return "book/bookSearchByAdmin";
//
//		} else {
//			return "book/bookList";
//			//return "book/bookSearch";
//		}
//	}


	@RequestMapping("/findBook")
	public String findBook(String keyword, String page, Model model)
			throws Exception {
		List<BookModel> bookList;
		System.out.println(keyword);
		bookList = bookservice.findBook(keyword);

		model.addAttribute("bookList", bookList);

		model.addAttribute("keyword", keyword);
		return "book/findBook";
	}

	@RequestMapping("/deletebook")
	public String deleteBook(String book_cd, HttpServletRequest request) {
		String permission;

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0"))
					return "member/adminfail";
			}
		}
		if (rentservice.selectReservation(book_cd) != null) {
			return "rent/reservationfail";
		}

		bookservice.deleteBook(book_cd);
		return "redirect:searchBook?listType=title&keyword=";

	}

	@RequestMapping("/modifyBookForm")
	public String modifyBookForm(BookModel book, String book_cd,
			HttpServletRequest request, Model model) {
		String permission;
		List<CodeModel> BCodeList = new ArrayList<CodeModel>();
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				book = bookservice.selectBook(book_cd);
				BCodeList = bookservice.selectBCodeList();
				if (permission.equals("0"))
					return "member/adminfail";
			}
		}
		model.addAttribute("BCodeList", BCodeList);
		model.addAttribute("book", book);
		return "book/modifyBook";
	}

	@RequestMapping("/modifybook1")
	public String modifybookresult(BookModel bookmodel) {
		bookmodel.setBook_cd(book_cd1);
		bookservice.updateBook(bookmodel);
		return "book/modifybookresult";
	}

	/*
	 * @RequestMapping("/requestOk") public String requestOk(BookModel model) {
	 * System.out.println(model.getRequestid()); bookservice.requestBook(model);
	 * return "requestBookResult"; }
	 */

}
