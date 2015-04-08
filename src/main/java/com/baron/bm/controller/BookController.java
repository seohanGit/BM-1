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

@Controller
public class BookController {

	String bookCode1;

	@Autowired
	private BookService bookservice;

	@RequestMapping("/insertbookForm")
	public String insertbook() {
		return "insertbook";
	}

	@RequestMapping("/insertbook")
	public String insertresult(BookModel model) {
		bookservice.insertBook(model);
		return "insertbookresult";
	}

	/*
	 * @RequestMapping("/requestOk") public String requestOk(BookModel model) {
	 * System.out.println(model.getRequestid()); bookservice.requestBook(model);
	 * return "requestBookResult"; }
	 */

	@RequestMapping("/national")
	public String getNationalBest(BookModel model) throws Exception {
		bookservice.getBestseller("200");
		return "book/nationalBest";
	}

	@RequestMapping("/searchBook")
	public String searchBook(HttpServletRequest request, String keyword, Model model) {
		List<BookModel> bookList = bookservice.searchBook(keyword);
		model.addAttribute("bookList", bookList);
		String permission;
		for(Cookie cookie : request.getCookies()){
			if(cookie.getName().equals("bm_permission")){
				permission=cookie.getValue();
				if(permission.equals("0")){
					return "search";
				}
			}
		}
		
		return "searchadmin";
	}

	

	@RequestMapping("/listBook")
	public String listBook(String keyword, Model model) {
		keyword = "";
		List<BookModel> bookList = bookservice.searchBook(keyword);
		model.addAttribute("bookList", bookList);
		return "search";
	}

	@RequestMapping("/findBook")
	public String findBook(String keyword, Model model) throws Exception {
		List<BookModel> bookList = bookservice.findBook(keyword);

		model.addAttribute("bookList", bookList);
		return "findBook";
	}

	@RequestMapping("/deletebook")
	public String deleteBook(String bookCode, HttpServletRequest request) {
		String permission;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0"))
					return "adminfail";
			}
		}
		if (bookservice.selectReservation(bookCode) != null) {
			return "reservationfail";
		}

		bookservice.deleteBook(bookCode);
		return "admin";

	}

	@RequestMapping("/modifyBookForm")
	public String modifyBookForm(String bookCode, HttpServletRequest request,
			Model model) {
		String permission;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0"))
					return "adminfail";
			}
		}
		bookCode1 = bookCode;
		return "modifyBook";
	}

	@RequestMapping("/modifybook1")
	public String modifybookresult(BookModel bookmodel) {
		bookmodel.setBookCode(bookCode1);
		bookservice.updateBook(bookmodel);
		return "modifybookresult";
	}

	@RequestMapping("/borrowbook")
	public String borrowBook(HttpServletRequest request, String bookCode,
			BookModel book) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		book.setId(id);
		book.setBookCode(bookCode);
		book.setBorrowcheck("1");
		bookservice.borrowBook(book);
		return "index";
	}

	@RequestMapping("/borrowListAll")
	public String borrowListAll(Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		bookList = bookservice.borrowListAll();
		model.addAttribute("bookList", bookList);
		return "borrowList";
	}

	@RequestMapping("/returnbook")
	public String returnBook(String bookCode) {
		bookservice.returnBook(bookCode);

		return "index";
	}

	@RequestMapping("/returnmanybook")
	public String returnManyBook(List<String> bookCodeList) {
		bookservice.returnManyBook(bookCodeList);

		return "index";
	}

	@RequestMapping("/borrowList")
	public String borrowList(HttpServletRequest request, Model model) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				id = cookie.getValue();
		}
		List<BookModel> bookList = bookservice.borrowList(id);

		model.addAttribute("bookList", bookList);
		return "borrowList";
	}

	@RequestMapping("/reservation")
	public String reservation(String bookCode, BookModel book,
			HttpServletRequest request) {

		if (bookservice.selectReservation(bookCode) != null) {
			return "reservationfail";
		}

		String bookname;
		book.setBookCode(bookCode);
		bookname = bookservice.selectname(bookCode);
		System.out.println(bookname);
		book.setBookname(bookname);

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				book.setReserid(cookie.getValue());
		}
		bookservice.insertReservation(book);
		
		return "reservationresult";
	}

}
