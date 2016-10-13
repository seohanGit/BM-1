package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.service.BookService;
import com.baron.member.service.JoinService;
import com.baron.member.service.NotifiService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class RequestController { 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
	SimpleDateFormat sdftime = new SimpleDateFormat("yyyyMMddHHmmss");
	
	@Autowired
	private RequestService requestservice;

	@Autowired
	private NotifiService notifiService;

	@Autowired
	private JoinService joinService;

	@Autowired
	private RentService rentService;

	@Autowired
	private BookService bookservice;

	@RequestMapping("/confirmRequest")
	public String requestResult(BookModel model, HttpServletRequest request) {		
		String id = "";		
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id =cookie.getValue();
				model.setId(cookie.getValue());
			}
		}
		requestservice.requestBook(model);
		notifiService.notifiReq(model);
		
		return "request/requestSuccess";
	}

	@RequestMapping("/request")
	public String request(HttpServletRequest request, Model model, HttpSession session) {
		session.setAttribute("adminMode", "user");
		List<BookModel> bookList = new ArrayList<BookModel>();
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		if (id == "") {
			return "getout";
		} else {
			bookList = requestservice.requestRecord(id); 
			model.addAttribute("bookList", bookList);
			return "request/request";		
		}
	}
	
	@RequestMapping("/requestList")
	public String requestList(HttpServletRequest request, Model model) {
		
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
	public String requestBook(HttpSession session, HttpServletRequest request, Model model,
			String isbn) throws Exception {
		String id = null;
		Calendar cal =  Calendar.getInstance();
		String nowDate = sdf.format(cal.getTime());
		
		BookModel book = requestservice.findBookOne(isbn);
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
				book.setReqdate(nowDate);
				book.setId(id);
			}
		}
		
		model.addAttribute("cheif",session.getAttribute("cheif") );
		model.addAttribute("cheifid",session.getAttribute("cheifid") );
		model.addAttribute("BCodeList", BCodeList);
		model.addAttribute("CCodeList", CCodeList);
		if (isbn != null) {
			model.addAttribute("book", book);
			return "request/confirmRequest";
		} else {
			return "request/manualRequest";
		}
	}

	@RequestMapping("/buyRequest")
	public String buyRequest(String req_cd, Model model, BookModel book) { 
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();
		book = requestservice.selectBook(book); 
		model.addAttribute("book", book);
		model.addAttribute("BCodeList", BCodeList);
		model.addAttribute("CCodeList", CCodeList);
		return "request/confirmBuy";
	}

	@RequestMapping("/confirmBuy")
	public String confirmBuy(BookModel model) {
		Calendar cal =  Calendar.getInstance();
		String nowDate = sdftime.format(cal.getTime());		
		model.setRcv_date(nowDate);  
		requestservice.confirmBuy(model);
		requestservice.deleteRequest(model);
		return "request/requestSuccess"; 
	}

	@RequestMapping("/confirmBuyList")
	public String confirmBuyList(
			@RequestParam(value = "req_cd") List<BookModel> bookList, 
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		for (String book_cd :book_cdList){
			
		}
		for (BookModel book : bookList) { 
			if (bookservice.selectBook(book.getBook_cd()) == null) {
				requestservice.confirmBuy(book);
				requestservice.deleteRequest(book);
				return "redirect:requestList";
			} else {
				return "redirect:requestList";

			}

		}
		return "redirect:request";
	}

	@RequestMapping("modifiReqForm")
	public String modifiForm(Model model) {
		List<BookModel> bookList = requestservice.requestList();
		List<CodeModel> BCodeList = bookservice.selectBCodeList();
		List<CodeModel> CCodeList = bookservice.selectCCodeList();

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
		return "redirect:requestList";
	}
}
