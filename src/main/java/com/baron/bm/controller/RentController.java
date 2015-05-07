package com.baron.bm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baron.member.model.BookModel;
import com.baron.member.service.BookService;
import com.baron.member.service.RentService;

@Controller
public class RentController {

	@Autowired
	RentService rentservice;

	@RequestMapping("/borrowbook")
	public String borrowBook(HttpServletRequest request, String book_cd,
			BookModel book) {
		String id = null;
		// String late = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
			/*
			 * if (cookie.getName().equals("bm_late")) { late =
			 * cookie.getValue(); }
			 */
		}
		book.setId(id);
		book.setBook_cd(book_cd);
		book.setRentchk("1");

		if (rentservice.selectBook(book_cd).getRentchk().equals("0")) {
			System.out.println(book.getRentchk());
			rentservice.borrowBook(book);
			return "redirect:borrowList";
		} else {

			return "rent/borrowfail";
		}
	}

	@RequestMapping("/confirmBorrowBook")
	public String confirmBorrowBook(HttpServletRequest request, String book_cd) {

		rentservice.confirmBorrowBook(book_cd);
		rentservice.confirmBorrowBook1(book_cd);
		return "redirect:borrowList";
	}

	@RequestMapping("/confirmBorrowBookList")
	public String confirmBorrowBookList(
			@RequestParam(value = "book_cd") List<String> book_cdList) {

		for (String book_cd : book_cdList) {
			rentservice.confirmBorrowBook(book_cd);
			rentservice.confirmBorrowBook1(book_cd);
		}
		return "redirect:borrowList";
	}

	@RequestMapping("/borrowList")
	public String borrowList(HttpServletRequest request, Model model) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {

			if (cookie.getName().equals("bm_id")) {

				id = cookie.getValue();
				System.out.println(id);

			}
		}
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				if (cookie.getValue().equals("1")) {
					List<BookModel> bookList = new ArrayList<BookModel>();
					bookList = rentservice.borrowListAll();
					model.addAttribute("bookList", bookList);
					return "rent/borrowListByAdmin";

				} else if (cookie.getValue().equals("0")) {

					System.out.println(id + "ctrl");
					List<BookModel> bookList = rentservice.borrowList(id);
					List<BookModel> record = rentservice.recordList(id);

					model.addAttribute("bookList", bookList);
					model.addAttribute("record", record);
					return "rent/borrowList";
				}
			}

		}

		return null;
	}

	@RequestMapping("/extendBorrowBook")
	public String extendBorrowBook(String book_cd) {

		if (rentservice.selectReservation(book_cd).equals("0")) {
			rentservice.extendBorrowBook(book_cd);
			return "/rent/extendSuccess";
		} else {
			return "redirect:extendFail";
		}
	}

	@RequestMapping("/extendBookList")
	public String extendBookList(
			@RequestParam(value = "book_cd") List<String> book_cdList,
			Model model) {

		for (String book_cd : book_cdList) {
			if (rentservice.selectReservation(book_cd).equals("0")) {
				rentservice.extendBorrowBook(book_cd);

			} else {
				return "redirect:extendFail";
			}
		}
		return "/rent/extendSuccess";

	}

	@RequestMapping("/cancleBorrowBook")
	public String cancleBorrowBook(String book_cd, BookModel bookmodel,
			HttpServletRequest request) {
		bookmodel = rentservice.selectBook(book_cd);
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
	 */@RequestMapping("/returnBookList")
	public String returnManyBook(
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		for (String book_cd : book_cdList) {
			rentservice.returnBook(book_cd);
			rentservice.returnBook1(book_cd);

		}

		return "redirect:rentListAll";
	}

	@RequestMapping("/returnBookByAdmin")
	public String returnBook(String book_cd, BookModel book) {

		if (rentservice.selectBook(book_cd).getRentchk().equals("2")) {
			System.out.println(book.getRentchk());
			rentservice.returnBook(book_cd);
			rentservice.returnBook1(book_cd);
			return "redirect:rentListAll";
		} else {

			return "rent/returnfail";
		}
	}

	@RequestMapping("recoverBook")
	public String recoverBook(String book_cd) {
		rentservice.recoverBook(book_cd);

		return "redirect:bookList";
	}

	@RequestMapping("stopBorrow")
	public String stopBorrow(String book_cd) {
		rentservice.stopBorrow(book_cd);

		return "redirect:bookList";
	}

	@RequestMapping("/stopBorrowList")
	public String stopBorrowList(
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		for (String book_cd : book_cdList) {
			rentservice.stopBorrow(book_cd);

		}
		return "redirect:rentListAll";
	}

	/*
	 * @RequestMapping("/confirmReturnBook") public String
	 * confirmReturnBook(String book_cd) {
	 * 
	 * rentservice.confirmReturnBook(book_cd); return "member/admin"; }
	 * 
	 * @RequestMapping("/confirmReturnBookList") public String
	 * confirmReturnBookList(List<String> book_cdList) {
	 * 
	 * for (int i = 0; i < book_cdList.size(); i++) { String book_cd =
	 * book_cdList.get(i); rentservice.returnBook(book_cd); } return
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
	public String deleteRecord(String id, String book_cd, Model model,
			BookModel book) {
		book.setBook_cd(book_cd);
		book.setId(id);
		rentservice.deleteRecord(book);

		return "redirect:recordList";
	}

	@RequestMapping("/reservation")
	public String reservation(String book_cd, BookModel book,
			HttpServletRequest request) {

		if (rentservice.selectReservation(book_cd).equals("1")) {
			return "rent/reservationfail";
		}

		book.setBook_cd(book_cd);
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
	/*
	 * 기존 대여기록 새로운 테이블로 옮기기
	 * 
	 * @RequestMapping("/backupRecord") public String
	 * backupRecord(HttpServletRequest request) throws Exception { List
	 * <BookModel> bookList = new ArrayList<BookModel>(); List <BookModel>
	 * bookList1 = new ArrayList<BookModel>();
	 * 
	 * bookList = rentservice.recordListAll();
	 * 
	 * SimpleDateFormat format = new SimpleDateFormat("yyyymmdd",
	 * Locale.KOREAN);
	 * 
	 * for (BookModel bookModel2 : bookList) { BookModel bookmodel = new
	 * BookModel(); bookmodel.setRentdate(
	 * format.parse(bookModel2.getReq_ymd())); bookmodel.setReturndate(
	 * format.parse(bookModel2.getRetu_ymd()));
	 * bookmodel.setId(bookModel2.getSabun());
	 * bookmodel.setBook_cd(bookModel2.getBook_cd()); bookList1.add(bookmodel);
	 * rentservice.insertRecord(bookmodel); }
	 * 
	 * return "recordListAll"; }
	 */
}
