package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println(model.getId());
		requestservice.requestBook(model);
		return "requestBookResult";
	}

	@RequestMapping("/requestList")
	public String requestList(Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		bookList = requestservice.requestList();
		model.addAttribute("bookList", bookList);

		return "requestList";
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

		return "confirmRequest";
	}

	@RequestMapping("/buyRequest")
	public String buyRequest(String bookCode, Model model, BookModel book) {
		book = requestservice.selectBook(bookCode);
		model.addAttribute("book", book);
		return "confirmBuy";
	}

	@RequestMapping("/confirmBuy")
	public String confirmBuy(BookModel model) {
		if (bookService.selectBook(model.getBookCode()) == null) {
			bookService.insertBook(model);
			requestservice.deleteRequest(model.getBookCode());
			return "redirect:requestList";
		}else {
			return "buyfail";
		}
	}

	@RequestMapping("/deleteRequest")
	public String deleteRequest(String bookCode) {
		System.out.println(bookCode);
		System.out.println(bookCode);
		System.out.println(bookCode);
		System.out.println(bookCode);

		requestservice.deleteRequest(bookCode);
		return "redirect:requestList";
	}
}
