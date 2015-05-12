package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baron.member.model.BookModel;
import com.baron.member.service.BookService;
import com.baron.member.service.RequestService;

@Controller
public class RequestController {

	@Autowired
	private RequestService requestservice;

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
		if (bookService.selectBook(model.getBook_cd()) == null) {
			bookService.insertBook(model);
			requestservice.deleteRequest(model.getReq_cd());
			return "redirect:requestList";
		} else {
			return "buyfail";
		}
	}

	@RequestMapping("/confirmBuyList")
	public String confirmBuyList(
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		for (String book_cd : book_cdList) {
			if (bookService.selectBook(book_cd) == null) {
				bookService.insertBook(requestservice.selectBook(book_cd));
				requestservice.deleteRequest(book_cd);

			} else {
				return "buyfail";

			}

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
