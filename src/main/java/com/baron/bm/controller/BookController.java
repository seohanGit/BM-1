package com.baron.bm.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baron.bm.utils.FileUtils;
import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sdftime = new SimpleDateFormat("yyyyMMddHHmmss");
	
	@RequestMapping("/insertbookForm")
	public ModelAndView insertbook() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();
		mav.addObject("BCodeList", BCodeList);
		mav.addObject("CCodeList", CCodeList);
		mav.setViewName("book/insertbook");
		return mav;
	}

	@RequestMapping("/insertbook")
	public ModelAndView insertresult(ModelAndView mav, BookModel model) {
		Calendar cal = Calendar.getInstance();
		String nowDate = sdftime.format(cal.getTime());
		model.setRcv_date(nowDate);
		bookservice.insertBook(model);
		mav.setViewName("book/insertbookresult");
		return mav;
	}

	@RequestMapping("/bookInfo")
	public String bookInfo(Model model, BookModel book, String listType,
			String keyword, String main) {
		if (book.getBook_cd() != null) {
			book = bookservice.selectBook(book.getBook_cd());
		} else if (book.getReq_cd() != null) {
			book = requestservice.selectBook(book);
		}

		model.addAttribute("book", book);
		model.addAttribute("keyword", keyword);
		model.addAttribute("listType", listType);
		if (main == null) {
			main = "";
		}
		switch (main) {
		case "Y":
			return "book/bookInfo2";

		default:
			return "book/bookInfo";
		}
	}

	@RequestMapping(value = "/searchBook", produces = "application/text; charset=utf8")
	public ModelAndView searchBook(HttpServletRequest request,
			HttpSession session, Dto dto, String listType, String datepicker1,
			String datepicker2, String year, String month, ModelAndView mav)
			throws NullPointerException, UnsupportedEncodingException {
		session.setAttribute("adminMode", "user");
		String permission = "";
		List<BookModel> bookList = new ArrayList<BookModel>();
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal = Calendar.getInstance();
		Date date2 = cal.getTime();
		cal.add(cal.MONTH, -1);
		Date date1 = cal.getTime();

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
			}
		}
		
		switch (listType) {
		case "new":
			if (datepicker1 == null || datepicker1.equals("")) {
				datepicker1 = sdf.format(date1);
				datepicker2 = sdf.format(date2);
			}
			bookList = bookservice.listBook(listType, datepicker1, datepicker2,
					""); 
			mav.setViewName("book/listBook");
			break;
		case "best":
		case "recommend":
			if (year == null) {
				year = sdf.format(cal.getTime()).substring(0, 4);
				month = sdf.format(cal.getTime()).substring(4, 6);
			}
			mav.addObject("year", year);
			mav.addObject("month", month);

			bookList = bookservice.listBook(listType, "", "", year + month);
			mav.setViewName("book/listBook");
			break;
		default:
			if (dto.getField().equals("")) {
				dto.setField("title");
			}

			bookList = bookservice.searchBook(dto);
			mav.addObject("bookList", bookList);
			mav.setViewName("book/bookSearch");
			break;
		}
		mav.addObject("bookList", bookList);
		mav.addObject("date1", datepicker1);
		mav.addObject("date2", datepicker2);
		mav.addObject("listType", listType);
		mav.addObject("keyword", dto.getKeyword());
		mav.addObject("BCodeList", BCodeList);
		mav.addObject("CCodeList", CCodeList);
		mav.addObject("b_group", dto.getB_group());
		mav.addObject("c_group", dto.getC_group());

		return mav;
	}

	@RequestMapping(value = "/searchBookAdmin", produces = "application/text; charset=utf8")
	public ModelAndView searchBookAdmin(HttpServletRequest request,
			HttpSession session, Dto dto, String listType, String datepicker1,
			String datepicker2, String year, String month, ModelAndView mav)
			throws NullPointerException, UnsupportedEncodingException {
		List<BookModel> bookList = new ArrayList<BookModel>();
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();
		session.setAttribute("adminMode", "admin");

		if (dto.getField().equals("")) {
			dto.setField("title");
		}
		bookList = bookservice.searchBook(dto);
		mav.addObject("bookList", bookList);
		mav.addObject("listType", listType);
		mav.addObject("keyword", dto.getKeyword());
		mav.addObject("b_group", dto.getB_group());
		mav.addObject("BCodeList", BCodeList);
		mav.addObject("CCodeList", CCodeList);
		mav.setViewName("book/bookSearchByAdmin");

		return mav;
	}

	@RequestMapping(value = "/bookList", produces = "application/text; charset=utf8")
	public ModelAndView BookList(HttpServletRequest request,
			HttpSession session, Dto dto, String listType, String datepicker1,
			String datepicker2, String year, String month, ModelAndView mav)
			throws NullPointerException {
		
		String permission = "";
		List<BookModel> bookList = new ArrayList<BookModel>();
		List<CodeModel> BCodeList = new ArrayList<CodeModel>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal = Calendar.getInstance();
		Date date2 = cal.getTime();
		cal.add(cal.MONTH, -1);
		Date date1 = cal.getTime();
		
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
			}
		}
		switch (listType) {
		case "new":
			if (datepicker1 == null || datepicker1.equals("")) {				
				datepicker1 = sdf.format(date1);
				datepicker2 = sdf.format(date2);
			}
			bookList = bookservice.listBook(listType, datepicker1, datepicker2,
					"");
//			mav.addObject("datepicker1", datepicker1);
//			mav.addObject("datepicker2", datepicker2);
			mav.setViewName("book/searchResult");
			break;
		case "best":
		case "recommend":
			if (year == null) {
				year = sdf.format(cal.getTime()).substring(0, 4);
				month = sdf.format(cal.getTime()).substring(4, 6);
			}
			mav.addObject("year", year);
			mav.addObject("month", month);

			bookList = bookservice.listBook(listType, "", "", year + month);
			mav.setViewName("book/searchResult");
			break;
		default:
			bookList = bookservice.searchBook(dto);
			mav.addObject("bookList", bookList);
			if (session.getAttribute("adminMode").equals("admin")
					&& permission.equals("1")) {
				mav.setViewName("book/searchAdminResult");
			} else {
				mav.setViewName("book/searchResult");
			}
			break;
		}

		mav.addObject("bookList", bookList);
		mav.addObject("date1", datepicker1);
		mav.addObject("date2", datepicker2);
		mav.addObject("listType", listType);
		mav.addObject("keyword", dto.getKeyword());

		BCodeList = bookservice.selectBCodeList();
		mav.addObject("BCodeList", BCodeList);

		return mav;
	}

	@RequestMapping("/findBook")
	public ModelAndView findBook(String keyword, String page, ModelAndView mav, String type)
			throws Exception {
		List<BookModel> bookList;
		BookModel book;
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();
		mav.addObject("BCodeList", BCodeList);
		mav.addObject("CCodeList", CCodeList);

		if (type.equals("isbn")) {
			book = requestservice.findBookOne(keyword);
			mav.addObject("book", book);
			mav.addObject("keyword", keyword); 
		} else {
			bookList = bookservice.findBook(keyword);
			mav.addObject("bookList", bookList);
			mav.addObject("keyword", keyword);
			mav.setViewName( "book/findBook");
		}
		return mav;
	}

	@RequestMapping("/getBookFromISBN")
	@ResponseBody
	public BookModel getBookFromISBN (String keyword, String page, String type)
			throws Exception {  
   
		return requestservice.findBookOne(keyword);
	}
	
	@RequestMapping("/getMaxSer")
	@ResponseBody
	public BookModel getMaxSer (String b_group, String c_group, BookModel book )
			throws Exception {   
		book.setB_group(b_group);
		book.setC_group(c_group);
		return bookservice.getMaxSer(book);
	}
	
	
	
	@RequestMapping("/deletebook")
	public String deleteBook(String keyword, String book_cd, HttpServletRequest request) {
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
		return "redirect:searchBookAdmin?listType=&keyword="+keyword;

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
				if (permission.equals("0")) {
					return "member/adminfail";
				}
			}
		}
		book_cd1 = book.getBook_cd();
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

	@RequestMapping("/download")
	public ModelAndView fileDownload(String imageurl) throws Exception {

		ModelAndView mav = new ModelAndView();
		bookservice.downLoad(imageurl);

		mav.addObject("fileName", new File("c:/temp/" + imageurl));
		mav.setViewName("fileDownloadView");
		return mav;
	}
	
	
}
