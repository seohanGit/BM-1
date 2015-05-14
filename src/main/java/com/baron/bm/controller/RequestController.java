package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.SmsModel;
import com.baron.member.service.BookService;
import com.baron.member.service.JoinService;
import com.baron.member.service.NotifiService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class RequestController {

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
	public String requestResult(BookModel model) {
		System.out.println(model.getSummary());
		model.setReq_cd(model.getB_group() + model.getIsbn());
		requestservice.requestBook(model);
		return "redirect:requestList";
	}

	@RequestMapping("/requestList")
	public String requestList(HttpServletRequest request, Model model, String id) {
		List<BookModel> bookList = new ArrayList<BookModel>();

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = (cookie.getValue());
			} else if (cookie.getName().equals("bm_permission")) {
				if ("1".equals(cookie.getValue())) {
					bookList = requestservice.requestList();
					System.out.println(bookList.get(0).getReq_cd());
					model.addAttribute("bookList", bookList);
					return "requestList";
				} else {
					bookList = requestservice.requestRecord(id);
					model.addAttribute("bookList", bookList);
					return "request";
				}
			}

		}
		return null;
	}

	@RequestMapping("/request")
	public String request(HttpServletRequest request, Model model, String id) {
		List<BookModel> bookList = new ArrayList<BookModel>();

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = (cookie.getValue());
			} else if (cookie.getName().equals("bm_permission")) {
				if ("1".equals(cookie.getValue())) {
					bookList = requestservice.requestList();
					model.addAttribute("bookList", bookList);
					return "redirect:requestList";
				} else {
					bookList = requestservice.requestRecord(id);
					model.addAttribute("bookList", bookList);
					return "request";
				}
			}

		}
		return null;
	}

	@RequestMapping("/requestbook")
	public String requestBook(HttpServletRequest request, Model model,
			BookModel book, String isbn, int quantity) throws Exception {

		book = requestservice.findBookOne(isbn);
		book.setQuantity(quantity);

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				book.setId(cookie.getValue());
		}

		model.addAttribute("book", book);
		System.out.println(book.getId());
		System.out.println(book.getSummary());

		return "confirmRequest";
	}

	@RequestMapping("/buyRequest")
	public String buyRequest(String req_cd, Model model, BookModel book) {
		book = requestservice.selectBook(req_cd);
		model.addAttribute("book", book);
		return "confirmBuy";
	}

	@RequestMapping("/confirmBuy")
	public String confirmBuy(BookModel model) {
		SmsModel sms = new SmsModel();
		if (bookService.selectBook(model.getBook_cd()) == null) {
			System.out.println(model.getId());
			String mobi_no = rentService.selectMember(model.getId())
					.getMobi_no().substring(1);

			sms.setTitle(model.getTitle());
			sms.setPhone(mobi_no);

			bookService.insertBook(model);
			requestservice.deleteRequest(model.getReq_cd());
			notifiService.notifiReq(sms);
			return "redirect:requestList";
		} else {
			return "buyfail";
		}
	}

	@RequestMapping("/confirmBuyList")
	public String confirmBuyList(
			@RequestParam(value = "req_cd") List<String> req_cdList) {
		for (String req_cd : req_cdList) {
			BookModel book = requestservice.selectBook(req_cd);
			SmsModel sms = new SmsModel();
			if (bookService.selectBook(book.getBook_cd()) == null) {
				String mobi_no = rentService.selectMember(book.getId())
						.getMobi_no().substring(1);

				sms.setTitle(book.getTitle());
				sms.setPhone(mobi_no);

				bookService.insertBook(requestservice.selectBook(req_cd));
				requestservice.deleteRequest(req_cd);
				notifiService.notifiReq(sms);
				return "buySuccess";
			} else {
				return "buyfail";

			}

		}
		return "redirect:requestList";
	}

	@RequestMapping(value = "/modifiRequest", method = RequestMethod.POST)
	public String modifiRequest(
			@RequestParam("book_cd") List<String> book_cdList,
			@RequestParam("req_cd") List<String> req_cdList) {
		for (int i = 0; i < req_cdList.size(); i++) {
			Dto dto = new Dto();
			dto.setString1(book_cdList.get(i));
			dto.setString2(req_cdList.get(i));

			requestservice.updateBook_cd(dto);
		}

		return "redirect:requestList";
	}

	@RequestMapping("/deleteRequest")
	public String deleteRequest(String req_cd) {
		System.out.println(req_cd);
		requestservice.deleteRequest(req_cd);
		return "redirect:requestList";
	}
}
