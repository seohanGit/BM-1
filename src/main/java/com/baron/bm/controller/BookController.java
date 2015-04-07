package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.dao.BookDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
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
	@RequestMapping("/confirmRequest")
	public String requestResult(BookModel model) {
		System.out.println(model.getId());
		bookservice.requestBook(model);
		return "requestBookResult";
	}

	@RequestMapping("/requestList")
	public String requestList(Model model) {
		List<BookModel> BookList = new ArrayList<BookModel>();
		BookList = bookservice.requestList();
		model.addAttribute("bookList", BookList);
		return "requestList";
	}

	

	@RequestMapping("/national")
	public String getNationalBest(BookModel model) throws Exception {
		bookservice.getBestseller("200");
		return "book/nationalBest";
	}

	@RequestMapping("/borrowListAll")
	public String borrowListAll(Model model){
		List<BookModel> bookList = new ArrayList<BookModel>();
		bookList = bookservice.selectBorrowList();
		model.addAttribute("bookList", bookList);
		return "borrowListAll";
	}
	@RequestMapping("/requestbook")
	public String requestBook(HttpServletRequest request, BookModel book,
			String isbn, int quantity) throws Exception {
		
		book = bookservice.findBookOne(isbn);
		book.setQuantity(quantity);
		
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				book.setId(cookie.getValue());
		}
		
		bookservice.requestBook(book);
		System.out.println(book.getBookname());
		
		return "admin";
	}
	
	@RequestMapping("/deleteRequest")
	public String deleteRequest(String bookCode){
		bookservice.deleteRequest(bookCode);
		return "admin";
	}
	
	
	@RequestMapping("/searchBook")
	public String searchBook(String keyword, Model model) {
		List<BookModel> bookList = bookservice.searchBook(keyword);
		model.addAttribute("bookList", bookList);
		return "search";
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
	public String borrowBook(String bookCode, BookModel book) {

		return "borrowresult";
	}

	@RequestMapping("/returnbook")
	public String returnBook(String bookCode, BookModel book) {

		return "returnresult";
	}

	@RequestMapping("/borrowList")
	public String borrowList(HttpServletRequest request, Model model) {
		String id = null;
		for(Cookie cookie : request.getCookies()){
			if(cookie.getName().equals("bm_id"))
				id=cookie.getValue();
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
		bookservice.updateBookReser(book);
		return "reservationresult";
	}

}
