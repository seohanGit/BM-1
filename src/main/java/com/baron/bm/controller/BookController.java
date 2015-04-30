package com.baron.bm.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.hamcrest.core.IsNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.service.BookService;
import com.baron.member.service.RentService;

@Controller
public class BookController {

	String bookCode1;

	@Autowired
	private BookService bookservice;

	@Autowired
	private RentService rentservice;

	@RequestMapping("/insertbookForm")
	public String insertbook() {
		return "book/insertbook";
	}

	@RequestMapping("/insertbook")
	public String insertresult(BookModel model) {
		bookservice.insertBook(model);
		return "book/insertbookresult";
	}

	@RequestMapping("/bookInfo")
	public String bookInfo(String bookCode, Model model, BookModel book) {
		model.addAttribute("book", bookservice.selectBook(bookCode));

		return "book/bookInfo";
	}

	/*
	 * @RequestMapping("/national") public String getNationalBest(BookModel
	 * model) throws Exception { bookservice.getBestSeller(); return
	 * "book/nationalBest"; }
	 */
	@RequestMapping("/searchBook")
	public String searchBook(HttpServletRequest request, String keyword,
			Model model) {
		List<BookModel> bookList = bookservice.searchBook(keyword);
		model.addAttribute("bookList", bookList);
		String permission;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("1")) {
					return "book/bookSearchByAdmin";

				}
			}
		}
		return "book/bookSearch";

	}

	@RequestMapping("/bookList")
	public String BookList(HttpServletRequest request, Model model) {
		int a = 1;

		String permission;
		Dto page = new Dto();
		page.setNum1(a);
		page.setNum2(a + 15);
		List<BookModel> bookList = bookservice.listBook(page);
		int total = ((bookservice.listBook(page).get(0).getCount()) / 15) + 1;
		model.addAttribute("bookList", bookList);
		model.addAttribute("total", total);
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0")) {
					return "book/bookSearch";
				}
			}
		}
		return "book/bookList";
	}

	@RequestMapping("/page")
	public String listPage(HttpServletRequest request, Model model, int seq) {
		String permission;
		int total = 0;
		Dto page = new Dto();
		page.setNum1((seq - 1) * 15);
		page.setNum2((seq) * 15);
		total = ((bookservice.listBook(page).get(0).getCount()) / 15) + 1;
		page.setNum3(total);
		List<BookModel> bookList = bookservice.listBook(page);

		model.addAttribute("total", total);
		model.addAttribute("bookList", bookList);
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0")) {
					return "book/bookSearch";
				}
			}
		}
		return "book/bookList";
	}

	@RequestMapping("/findBook")
	public String findBook(String keyword, String page, Model model)
			throws Exception {
		List<BookModel> bookList;
		int totalPage;
		bookList = bookservice.findBook(keyword);

		totalPage = bookList.get(0).getTotalResults() / 15;

		model.addAttribute("bookList", bookList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("keyword", keyword);
		return "book/findBook";
	}

	@RequestMapping("/deletebook")
	public String deleteBook(String bookCode, HttpServletRequest request) {
		String permission;

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0"))
					return "member/adminfail";
			}
		}
		if (rentservice.selectReservation(bookCode) != null) {
			return "reservationfail";
		}

		bookservice.deleteBook(bookCode);
		return "member/admin";

	}

	@RequestMapping("/modifyBookForm")
	public String modifyBookForm(BookModel book, String bookCode,
			HttpServletRequest request, Model model) {
		String permission;

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				book = bookservice.selectBook(bookCode);
				if (permission.equals("0"))
					return "member/adminfail";
			}
		}

		model.addAttribute("book", book);
		return "book/modifyBook";
	}

	@RequestMapping("/modifybook1")
	public String modifybookresult(BookModel bookmodel) {
		bookmodel.setBook_cd(bookCode1);
		bookservice.updateBook(bookmodel);
		return "book/modifybookresult";
	}

	/*
	 * @RequestMapping("/requestOk") public String requestOk(BookModel model) {
	 * System.out.println(model.getRequestid()); bookservice.requestBook(model);
	 * return "requestBookResult"; }
	 */

}
