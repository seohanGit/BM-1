package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.BookModel;
import com.baron.member.service.BookService;
import com.baron.member.service.RentService;

@Controller
public class RentController {

	@Autowired
	RentService rentservice;

	@RequestMapping("/borrowbook")
	public String borrowBook(HttpServletRequest request, String bookCode,
			BookModel book) {
		String id = null;
		String late = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
			if (cookie.getName().equals("bm_late")) {
				late = cookie.getValue();
			}
		}
		book.setId(id);
		book.setBookCode(bookCode);
		book.setBorrowcheck("1");

		if (rentservice.borrowCheck(book).equals("0") & late.equals("0")) {
			System.out.println(book.getBorrowcheck());
			rentservice.borrowBook(book);
			return "redirect:borrowList";
		} else {

			return "rent/borrowfail";
		}
	}

	@RequestMapping("/confirmBorrowBook")
	public String confirmBorrowBook(HttpServletRequest request,
			String bookCode, String id) {

		rentservice.upPoint(id);
		rentservice.confirmBorrowBook(bookCode);
		return "redirect:borrowListAll";
	}

	@RequestMapping("/confirmBorrowBookList")
	public String confirmBorrowBookList(List<String> bookCodeList) {

		for (int i = 0; i < bookCodeList.size(); i++) {
			String bookCode = bookCodeList.get(i);
			rentservice.confirmBorrowBook(bookCode);

		}
		return "redirect:borrowListAll";
	}

	@RequestMapping("/borrowListAll")
	public String borrowListAll(Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		bookList = rentservice.borrowListAll();
		model.addAttribute("bookList", bookList);
		return "rent/borrowListByAdmin";
	}

	@RequestMapping("/borrowList")
	public String borrowList(HttpServletRequest request, Model model) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				id = cookie.getValue();
		}
		List<BookModel> bookList = rentservice.borrowList(id);

		model.addAttribute("bookList", bookList);
		return "rent/borrowList";
	}

	@RequestMapping("/extendBorrowBook")
	public String extendBorrowBook(String bookCode) {

		if (rentservice.selectReservation(bookCode).equals("0")) {
			rentservice.extendBorrowBook(bookCode);
			return "/rent/extendSuccess";
		} else {
			return "redirect:extendFail";
		}
	}

	@RequestMapping("/cancleBorrowBook")
	public String cancleBorrowBook(String bookCode, BookModel bookmodel,
			HttpServletRequest request) {
		bookmodel = rentservice.selectBook(bookCode);
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				bookmodel.setId(cookie.getValue());
		}
		rentservice.cancleBorrowBook(bookmodel);

		return "redirect:borrowList";
	}

	@RequestMapping("/rentListAll")
	public String rentListAll(Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		bookList = rentservice.rentListAll();
		model.addAttribute("bookList", bookList);
		return "rent/rentList";
	}

	/*
	 * @RequestMapping("/returnListAll") public String returnListAll(Model
	 * model) { List<BookModel> bookList = new ArrayList<BookModel>(); bookList
	 * = rentservice.returnListAll(); model.addAttribute("bookList", bookList);
	 * return "rent/returnList"; }
	 */@RequestMapping("/returnmanybook")
	public String returnManyBook(List<String> bookCodeList) {

		for (int i = 0; i < bookCodeList.size(); i++) {
			String bookCode = bookCodeList.get(i);
			rentservice.returnBook(bookCode);
		}
		return "rent/rentList";
	}

	@RequestMapping("/returnBookByAdmin")
	public String returnBook(String bookCode, BookModel book) {

		if (rentservice.borrowCheck(book).equals("2")) {
			System.out.println(book.getBorrowcheck());
			rentservice.returnBook(bookCode);
			return "redirect:rentListAll";
		} else {

			return "rent/returnfail";
		}
	}

	@RequestMapping("stopBorrow")
	public String stopBorrow(String bookCode) {
		rentservice.stopBorrow(bookCode);

		return "redirect:rentListAll";
	}

	/*
	 * @RequestMapping("/confirmReturnBook") public String
	 * confirmReturnBook(String bookCode) {
	 * 
	 * rentservice.confirmReturnBook(bookCode); return "member/admin"; }
	 * 
	 * @RequestMapping("/confirmReturnBookList") public String
	 * confirmReturnBookList(List<String> bookCodeList) {
	 * 
	 * for (int i = 0; i < bookCodeList.size(); i++) { String bookCode =
	 * bookCodeList.get(i); rentservice.returnBook(bookCode); } return
	 * "member/admin"; }
	 */
	@RequestMapping("/recordList")
	public String recordList(HttpServletRequest request, Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				id = cookie.getValue();
		}
		bookList = rentservice.recordList(id);
		for (int i = 0; i < bookList.size(); i++) {
			bookList.get(i).setId(id);
		}
		model.addAttribute("bookList", bookList);
		return "rent/recordList";
	}

	@RequestMapping("/recordListAll")
	public String recordListAll(HttpServletRequest request, Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();

		bookList = rentservice.recordListAll();

		model.addAttribute("bookList", bookList);
		return "rent/recordList";
	}

	@RequestMapping("/deleteRecord")
	public String deleteRecord(String id, String bookCode, Model model,
			BookModel book) {
		book.setBookCode(bookCode);
		book.setId(id);
		rentservice.deleteRecord(book);

		return "redirect:recordList";
	}

	@RequestMapping("/reservation")
	public String reservation(String bookCode, BookModel book,
			HttpServletRequest request) {

		if (rentservice.selectReservation(bookCode).equals("1")) {
			return "rent/reservationfail";
		}

		book.setBookCode(bookCode);
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id"))
				book.setId(cookie.getValue());
		}
		rentservice.insertReservation(book);

		return "rent/reservationresult";
	}

	@RequestMapping("/reservationListAll")
	public String reserveListAll(HttpServletRequest request, Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();

		bookList = rentservice.reservationListAll();

		model.addAttribute("bookList", bookList);
		return "rent/reservationListAll";
	}
}
