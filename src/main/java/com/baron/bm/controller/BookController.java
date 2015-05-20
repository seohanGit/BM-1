package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.SearchResult;
import com.baron.member.service.BookService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class BookController {

	String book_cd1;

	@Autowired
	private BookService bookservice;

	@Autowired
	private RentService rentservice;

	@Autowired
	private RequestService requestservice;

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
	public String bookInfo(String book_cd, Model model, BookModel book) {
		book = bookservice.selectBook(book_cd);
		model.addAttribute("book", book);

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
		if (keyword == null) {
			keyword = "";
		}
		List<SearchResult> bookList = bookservice.searchBook(keyword);

		System.out.println(keyword);
		System.out.println(keyword);
		System.out.println(keyword);

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

		// int total = ((bookservice.listBook(page).get(0).getCount()) / 15) +
		// 1;
		model.addAttribute("bookList", bookList);
		// model.addAttribute("total", total);
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
		// total = ((bookservice.listBook(page).get(0).getCount()) / 15) + 1;
		page.setNum3(total);
		List<BookModel> bookList = bookservice.listBook(page);

		// model.addAttribute("total", total);
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
		System.out.println(keyword);
		bookList = bookservice.findBook(keyword);

		model.addAttribute("bookList", bookList);

		model.addAttribute("keyword", keyword);
		return "book/findBook";
	}

	@RequestMapping("/deletebook")
	public String deleteBook(String book_cd, HttpServletRequest request) {
		String permission;

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if (permission.equals("0"))
					return "member/adminfail";
			}
		}
		if (rentservice.selectReservation(book_cd) != null) {
			return "rent/reservationfail";
		}

		bookservice.deleteBook(book_cd);
		return "member/admin";

	}

	@RequestMapping("/modifyBookForm")
	public String modifyBookForm(BookModel book, String book_cd,
			HttpServletRequest request, Model model) {
		String permission;

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				book = bookservice.selectBook(book_cd);
				if (permission.equals("0"))
					return "member/adminfail";
			}
		}

		model.addAttribute("book", book);
		return "book/modifyBook";
	}

	@RequestMapping("/modifybook1")
	public String modifybookresult(BookModel bookmodel) {
		bookmodel.setBook_cd(book_cd1);
		bookservice.updateBook(bookmodel);
		return "book/modifybookresult";
	}

	/*
	 * @RequestMapping("/requestOk") public String requestOk(BookModel model) {
	 * System.out.println(model.getRequestid()); bookservice.requestBook(model);
	 * return "requestBookResult"; }
	 */
	@RequestMapping("/backupRecord")
	public String backupRecord(HttpServletRequest request) throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		bookList = rentservice.copyRent();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		for (BookModel bookmodel : bookList) {
			bookmodel.setRentdate(format.parse(bookmodel.getReq_ymd()));
			bookmodel.setReturndate(format.parse(bookmodel.getRetu_ymd()));

			bookmodel.setBook_cd(bookmodel.getBook_cd());
			bookmodel.setTeam_nm(bookmodel.getTeam_nm());
			bookmodel.setId(bookmodel.getId());
			System.out.println(bookmodel.getBook_cd() + bookmodel.getRentdate()
					+ bookmodel.getReq_ymd());
			rentservice.insertRecord(bookmodel);
		}

		return "rent/recordListAll";

	}

	@RequestMapping("/updateImage")
	public String updateImage() throws Exception {
		String isbn = "";

		List<BookModel> bookList = bookservice.selectBookAll();
		for (int i = 0; i < bookList.size() - 2700; i++) {
			BookModel book = bookList.get(i);
			isbn = book.getIsbn();
			isbn = isbn.substring(0, 13);
			System.out.println(isbn);
			book = requestservice.findBookOne(isbn);
			System.out.println(book.getImageurl());

		}/*
		 * for (BookModel bookmodel : bookList) { BookModel book = new
		 * BookModel(); isbn = bookmodel.getIsbn();
		 * 
		 * if (isbn != null) { isbn = isbn.substring(0, 13);
		 * System.out.println(isbn); if (isbn.substring(0, 5) == "97889") { book
		 * = requestservice.findBookOne(isbn);
		 * System.out.println(book.getImageurl());
		 * bookmodel.setImageurl(book.getImageurl());
		 * bookmodel.setAuthor(book.getAuthor());
		 * bookservice.updateBook(bookmodel); } else
		 * System.out.println("isbn일치 없음"); } else {
		 * System.out.println("isbn오류"); } }
		 */
		return "member/admin";

	}

}
