package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.scripting.xmltags.TrimSqlNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.baron.member.dao.JoinDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SmsModel;
import com.baron.member.service.BookService;
import com.baron.member.service.JoinService;
import com.baron.member.service.NotifiService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class RequestController {
	Calendar cal =  Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String nowDate = sdf.format(cal.getTime());
	
	@Autowired
	private RequestService requestservice;

	@Autowired
	private NotifiService notifiService;

	@Autowired
	private JoinService joinService;

	@Autowired
	private RentService rentService;

	@Autowired
	private BookService bookService;

	@RequestMapping("/confirmRequest")
	public String requestResult(BookModel model, HttpServletRequest request) {
		String id = "";
		BookModel book = new BookModel();
		book = model;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id =cookie.getValue();
				book.setId(cookie.getValue());
			}
		}
		MemberModel membermodel = joinService.selectMember(model.getId());  
		String max = requestservice.selectMaxSer();

		book.setReqdate(nowDate);
		book.setKname(model.getKname().substring(0, 5).trim());
		book.setBook_cd(book.getB_group().substring(0, 1)
				+ book.getC_group().substring(0, 3) + "-");
		book.setReq_cd(max);
		book.setId(id);
		
		requestservice.requestBook(book, membermodel);
		notifiService.notifiReq(book);
		
		return "request/requestSuccess";
	}

	@RequestMapping("/request")
	public String request(HttpServletRequest request, Model model) {

		List<BookModel> bookList = new ArrayList<BookModel>();
		String id = null, permission = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			} else if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
			}
		}
		if (id == "") {
			return "getout";
		} else {
			if (permission.equals("1")) {
				bookList = requestservice.requestList(); 
				model.addAttribute("bookList", bookList);
				return "request/requestList";
			} else {
				bookList = requestservice.requestRecord(id);
				System.out.println(id);
				model.addAttribute("bookList", bookList);
				return "request/request";
			}
		}
	}

	@RequestMapping("/requestbook")
	public String requestBook(HttpServletRequest request, Model model,
			String isbn) throws Exception {
		String id = null;
		BookModel book = requestservice.findBookOne(isbn);

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
				book.setReqdate(nowDate);
				book.setId(id);
			}
		}

		if (isbn != null) {
			model.addAttribute("book", book);
			return "request/confirmRequest";
		} else {
			return "request/manualRequest";
		}
	}

	@RequestMapping("/buyRequest")
	public String buyRequest(String req_cd, Model model, BookModel book) { 
		book = requestservice.selectBook(book); 
		model.addAttribute("book", book);
		return "request/confirmBuy";
	}

	@RequestMapping("/confirmBuy")
	public String confirmBuy(BookModel model) {
		model.setRcv_date(nowDate); 
		BookModel existbook = bookService.selectBook(model.getBook_cd());
		if (existbook == null){
			requestservice.confirmBuy(model);
			requestservice.deleteRequest(model);
			return "request/buySuccess";
		}else{
			return "redirect:requestfail";
		} 
	}

	@RequestMapping("/confirmBuyList")
	public String confirmBuyList(
			@RequestParam(value = "req_cd") List<BookModel> bookList, 
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		for (String book_cd :book_cdList){
			
		}
		for (BookModel book : bookList) { 
			if (bookService.selectBook(book.getBook_cd()) == null) {
				requestservice.confirmBuy(book);
				requestservice.deleteRequest(book);
				return "redirect:request";
			} else {
				return "redirect:request";

			}

		}
		return "redirect:request";
	}

	@RequestMapping("modifiReqForm")
	public String modifiForm(Model model) {
		List<BookModel> bookList = requestservice.requestList();
		List<CodeModel> BCodeList = bookService.selectBCodeList();
		List<CodeModel> CCodeList = bookService.selectCCodeList();

		model.addAttribute("bookList", bookList);
		model.addAttribute("BCodeList", BCodeList);
		model.addAttribute("CCodeList", CCodeList);

		return "request/modifiReqForm";
	}

	@RequestMapping(value = "/modifiRequest", method = RequestMethod.POST)
	public String modifiRequest(
			@RequestParam("book_cd") List<String> book_cdList,
			@RequestParam("req_cd") List<String> req_cdList) {
		for (int i = 0; i < req_cdList.size()-1; i++) {
			BookModel book = new BookModel();
			book.setBook_cd(book_cdList.get(i));
			String reqString[]= req_cdList.get(i).split("-");
			book.setReqdate(reqString[0]);
			book.setReq_cd(reqString[1]);
			requestservice.modifiBook(book);
		}

		return "redirect:request";
	}

	@RequestMapping("/deleteRequest")
	public String deleteRequest(String req_cd) {
		BookModel book = new BookModel();
		book.setReq_cd(req_cd);
		requestservice.deleteRequest(book);
		return "redirect:request";
	}

	@RequestMapping("/rejectRequest")
	public String rejectRequest(BookModel book) {		
		requestservice.rejectRequest(book);
		return "redirect:request";
	}
}
