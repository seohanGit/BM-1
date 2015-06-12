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

import com.baron.member.dao.BookDao;
import com.baron.member.dao.JoinDao;
import com.baron.member.dao.RentDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;
import com.baron.member.service.NotifiService;
import com.baron.member.service.RentService;

@Controller
public class RentController {

	@Autowired
	RentService rentservice;

	@Autowired
	NotifiService notifiService;

	@Autowired
	private RentDao rentDao;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private JoinDao joinDao;

	@RequestMapping("/borrowbook")
	public String borrowBook(HttpServletRequest request, String book_cd,
			BookModel book) {
		String id = null;
		// String late = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
			}
		book.setId(id);
		book.setBook_cd(book_cd);
		book.setRentchk("1");
		BookModel chkbook = rentservice.selectBook(book_cd);
		if (id != null) {
			if (chkbook.getRentchk().equals("0")) {
				rentservice.borrowBook(book);
				return "redirect:borrowList";
			} else {

				return "rent/borrowfail";
			}
		} else {
			return "rent/borrowfail";
		}
	}

	@RequestMapping(value = "/confirmBorrowBook", method = RequestMethod.GET)
	public String confirmBorrowBook(HttpServletRequest request, String book_cd) {
		String id = null;
		rentservice.confirmBorrowBook(book_cd);
		notifiService.notifiRent(book_cd);
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		if (rentservice.selectReservation(book_cd) != null) {
			if (rentservice.selectReservation(book_cd).getId() == id)
				rentservice.deleteReserve(book_cd);

		}

		return "redirect:borrowList";
	}

	@RequestMapping("/confirmBorrowBookList")
	public String confirmBorrowBookList(HttpServletRequest request,
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		for (String book_cd : book_cdList) {
			rentservice.confirmBorrowBook(book_cd);
			notifiService.notifiRent(book_cd);
			if (rentservice.selectReservation(book_cd) != null) {
				if (rentservice.selectReservation(book_cd).getId() == id)
					rentservice.deleteReserve(book_cd);

			}
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
					List<BookModel> rentList = rentservice.rentListAll();
					List<BookModel> bookList = rentservice.borrowListAll();
					model.addAttribute("rentList", rentList);
					model.addAttribute("bookList", bookList);
					return "rent/borrowListByAdmin";

				} else if (cookie.getValue().equals("0")) {

					List<BookModel> bookList = rentservice.borrowList(id);
					List<BookModel> rentList = rentservice.rentListAll();
					List<BookModel> reserve = rentservice.reservationList(id);

					model.addAttribute("rentList", rentList);
					model.addAttribute("reserveList", reserve);
					model.addAttribute("bookList", bookList);

					return "rent/borrowList";
				}
			}

		}

		return null;
	}

	@RequestMapping("/extendBorrowBook")
	public String extendBorrowBook(String book_cd) {
		String id = rentservice.selectRent(book_cd).getId();
		SmsModel sms = new SmsModel();

		if (rentservice.selectReservation(book_cd) == null) {
			sms.setPhone(joinDao.selectMember(id).getMobi_no().substring(1));
			sms.setTitle(bookDao.selectBook(book_cd).getTitle());

			rentservice.extendBorrowBook(book_cd);
			notifiService.notifiExtend(sms);

		} else if (rentservice.selectReservation(book_cd).getReservechk()
				.equals("0")) {
			sms.setPhone(joinDao.selectMember(id).getMobi_no().substring(1));
			sms.setTitle(rentDao.selectBorrow(book_cd).getTitle());

			rentservice.extendBorrowBook(book_cd);
			notifiService.notifiExtend(sms);

		} else {
			return "/rent/extendFail";
		}
		return "/rent/extendSuccess";
	}

	@RequestMapping("/extendBookList")
	public String extendBookList(
			@RequestParam(value = "book_cd") List<String> book_cdList,
			Model model) {

		for (String book_cd : book_cdList) {
			if (rentservice.selectReservation(book_cd) == null) {
				rentservice.extendBorrowBook(book_cd);
			} else if (rentservice.selectReservation(book_cd).getReservechk()
					.equals("0")) {
				rentservice.extendBorrowBook(book_cd);
			} else {
				return "/rent/extendFail";
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
	public String rentListAll(Model model, HttpServletRequest request) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		String permission = null;
		bookList = rentservice.rentListAll();
		model.addAttribute("bookList", bookList);

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission"))
				permission = (cookie.getValue());
		}
		if (permission.equals("1")) {
			return "rent/rentList";
		} else {
			return "rent/borrowfail";
		}

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
			BookModel checkBook = rentservice.selectBook(book_cd);
			if (checkBook.getRentchk().equals("2")) {
				notifiService.notifiReturnConfirm(book_cd);
				rentservice.returnBook(book_cd);
				
			} else {

				return "rent/returnfail";
			}
		}

		return "redirect:borrowList";
	}

	@RequestMapping("/returnBook")
	public String returnBook(String book_cd, BookModel book) {
		BookModel checkBook = rentservice.selectBook(book_cd);

		if (checkBook.getRentchk().equals("2")) {

			notifiService.notifiReturnConfirm(book_cd);
			rentservice.returnBook(book_cd);
			return "redirect:borrowList";
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

		String id = null;
		String permission = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			} else if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
			}
		}
		if (permission.equals("1")) {
			List<BookModel> bookList = rentservice.recordListAll();
			model.addAttribute("bookList", bookList);
			return "rent/recordList";
		} else if (permission.equals("0")) {
			List<BookModel> record = rentservice.recordList(id);
			model.addAttribute("record", record);
			return "rent/record";
		}
		return "rent/borrowList";
	}

	@RequestMapping("/deleteReserve")
	public String deleteReserve(String book_cd, Model model, BookModel book) {
		book = rentservice.selectReservation(book_cd);
		rentservice.borrowBook(book);
		rentservice.confirmBorrowBook(book_cd);
		rentservice.deleteReserve(book_cd);

		return "redirect:recordListAll";
	}

	@RequestMapping("/reservation")
	public String reservation(String book_cd, BookModel book,
			HttpServletRequest request) {
		String id = null;
		if (rentservice.selectReservation(book_cd) == null) {
			for (Cookie cookie : request.getCookies()) {
				if (cookie.getName().equals("bm_id"))
					id = rentservice.selectBook(book_cd).getId();
				if (cookie.getValue().equals(id)) {
					return "rent/reservationfail";
				} else {
					book.setId(cookie.getValue());
					book.setBook_cd(book_cd);
					rentservice.insertReservation(book);
					System.out.println(book.getTitle() + "도서가 예약 되었습니다.");
				}
			}
		} else if (rentservice.selectReservation(book_cd).equals("1")) {
			return "rent/reservationfail";
		}
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
