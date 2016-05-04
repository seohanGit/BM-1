package com.baron.bm.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.Format;
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
		if (model.getIsbn().equals("")){
			model.setRcv_date(nowDate); 
			model.setQuantity(1);
			model.setIsbn("");
			bookservice.insertBook(model);
		}else{
			model.setRcv_date(nowDate); 
			model.setQuantity(1);		
			bookservice.insertBook(model);
		}		
		return "book/insertbookresult";
	}

	@RequestMapping("/bookInfo")
	public String bookInfo(Model model, BookModel book,String listType, String keyword) {
		if(book.getBook_cd()!=null){
			book = bookservice.selectBook(book.getBook_cd());
		}else if(book.getReq_cd()!=null){
			book = requestservice.selectBook(book);
		}
		
		model.addAttribute("book", book);
		model.addAttribute("keyword", keyword);
		model.addAttribute("listType", listType);

		return "book/bookInfo";
	}
 
	@RequestMapping(value = "/searchBook", produces = "application/text; charset=utf8" )
	public ModelAndView searchBook(HttpServletRequest request, 
			String keyword, String listType, String datepicker1, String datepicker2, 
			String field, String year, String month,
			ModelAndView mav) throws NullPointerException, UnsupportedEncodingException {
		String permission = "";
		List<BookModel> bookList = new ArrayList<BookModel>();		 
		List<CodeModel> BCodeList = new ArrayList<CodeModel>(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		Calendar cal = Calendar.getInstance();		 
		
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue(); 
			}
		} 
		if (permission.equals("1")) {
			mav.setViewName("book/bookSearchByAdmin"); 
		} else {
			mav.setViewName("book/bookSearch");
		} 
		switch (listType) {			
			case "new" :
				if (datepicker1== null || datepicker1.equals("")){
					cal = Calendar.getInstance();				
					Date date2 = cal.getTime();
					cal.add(cal.MONTH, -1);
					Date date1 = cal.getTime();
					datepicker1 = sdf.format(date1); 
					datepicker2 = sdf.format(date2);
				}
				bookList = bookservice.listBook(listType, datepicker1, datepicker2,"");
				mav.setViewName("book/listBook");
				break;
			case "best" : 
			case "recommend" :
				if (year == null ){
					year=sdf.format(cal.getTime()).substring(0, 4);
					month=sdf.format(cal.getTime()).substring(4,6);
				} 
				mav.addObject("year", year);
				mav.addObject("month", month);
	
				bookList = bookservice.listBook(listType, "","", year+month);
				mav.setViewName("book/listBook");
				break;
			default :
				if (field == null){field = "title";}
				
				bookList = bookservice.searchBook(field, keyword);
				mav.addObject("bookList", bookList);
				if (permission.equals("1")) {
					mav.setViewName("book/bookSearchByAdmin"); 
				}else{
					mav.setViewName("book/bookSearch");
				}
				break;
		} 
		mav.addObject("bookList", bookList); 		  
		mav.addObject("date1", datepicker1);
		mav.addObject("date2", datepicker2); 
		mav.addObject("listType", listType);
		mav.addObject("keyword", keyword);
		
		BCodeList = bookservice.selectBCodeList(); 
		mav.addObject("BCodeList", BCodeList); 
	
		return mav;	
	}
	
		
	@RequestMapping(value ="/bookList" , produces = "application/text; charset=utf8")
	public ModelAndView BookList(HttpServletRequest request, 
			String keyword, String listType, String datepicker1, String datepicker2, 
			String field, String year, String month,
			ModelAndView mav) throws NullPointerException {
		String permission = "";
		List<BookModel> bookList = new ArrayList<BookModel>();		 
		List<CodeModel> BCodeList = new ArrayList<CodeModel>(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		Calendar cal = Calendar.getInstance();		 
		
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue(); 
			}
		}  
		switch (listType) {			
			case "new" :
				if (datepicker1== null || datepicker1.equals("")){
					cal = Calendar.getInstance();				
					Date date2 = cal.getTime();
					cal.add(cal.MONTH, -1);
					Date date1 = cal.getTime();
					datepicker1 = sdf.format(date1); 
					datepicker2 = sdf.format(date2);
				}
				bookList = bookservice.listBook(listType, datepicker1, datepicker2,"");
				mav.setViewName("book/searchResult");
				break;
			case "best" : 
			case "recommend" :
				if (year == null ){
					year=sdf.format(cal.getTime()).substring(0, 4);
					month=sdf.format(cal.getTime()).substring(4,6);
				} 
				mav.addObject("year", year);
				mav.addObject("month", month);

				bookList = bookservice.listBook(listType, "","", year+month);
				mav.setViewName("book/searchResult");
				break;
			default :
				if (field == null){field = "title";}
				bookList = bookservice.searchBook(field, keyword);
				mav.addObject("bookList", bookList);
				if (permission.equals("1")) {
					mav.setViewName("book/bookSearchByAdmin"); 
				}else{
					mav.setViewName("book/bookSearch");
				}
				break;
		}
		 
		mav.addObject("bookList", bookList);
		mav.addObject("date1", datepicker1);
		mav.addObject("date2", datepicker2);  
		mav.addObject("listType", listType);
		mav.addObject("keyword", keyword);	
		
		BCodeList = bookservice.selectBCodeList(); 
		mav.addObject("BCodeList", BCodeList); 
	
		return mav;	
	}


	@RequestMapping("/findBook")
	public String findBook(String keyword, String page, Model model, String type)
			throws Exception {
		List<BookModel> bookList;
		BookModel book; 
		
		if(type.equals("isbn")){
			book = requestservice.findBookOne(keyword);
			model.addAttribute("book", book);
			model.addAttribute("keyword", keyword);
			return "book/result1";
		} else{
			bookList = bookservice.findBook(keyword);
			model.addAttribute("bookList", bookList);
			model.addAttribute("keyword", keyword);
			return "book/findBook";
		}		
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
		return "redirect:searchBook?listType=&keyword=";

	}
	
	@RequestMapping("/setRecommend")
	public void setRecommend(String book_cd, String rcmdChk) { 
		BookModel bookmodel = new BookModel();
		bookmodel.setBook_cd(book_cd);
		bookmodel.setRcmdChk(rcmdChk);
		bookservice.setRecommend(bookmodel);
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
				if (permission.equals("0")){
					return "member/adminfail";
				}
			}
		}
		book_cd1=  book.getBook_cd();
		model.addAttribute("BCodeList", BCodeList);
		model.addAttribute("book", book);
		return "book/modifyBook";
	}

	@RequestMapping("/modifybook1")
	public String modifybookresult(BookModel bookmodel) {
		bookmodel.setBook_cd1(book_cd1);		
		bookservice.updateBook(bookmodel);
		return "book/modifybookresult";
	}
	
	@RequestMapping("/delayList")
	public ModelAndView delayList(BookModel bookmodel, ModelAndView mav) { 
		List<BookModel> bookList = rentservice.delayList();
		mav.addObject("bookList", bookList);
		mav.setViewName("rent/delayList");		
		return mav;
	}
	/*
	 * @RequestMapping("/requestOk") public String requestOk(BookModel model) {
	 * System.out.println(model.getRequestid()); bookservice.requestBook(model);
	 * return "requestBookResult"; }
	 */

}
