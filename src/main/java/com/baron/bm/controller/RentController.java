package com.baron.bm.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.baron.member.dao.BookDao;
import com.baron.member.dao.JoinDao;
import com.baron.member.dao.RentDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
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
 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Calendar cal = Calendar.getInstance();
	String nowDate = sdf.format(cal.getTime());
	
	@RequestMapping("/borrowbook")
	public String borrowBook(HttpServletRequest request, String book_cd,
			BookModel book, String keyword, String listType) throws UnsupportedEncodingException {
		String id = null;
		Calendar cal = Calendar.getInstance();
		String nowDate = sdf.format(cal.getTime());
		
		if(keyword==null){keyword="";}
		if(listType==null){listType="";} 
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		book.setId(id);
		book.setBook_cd(book_cd);
		book.setRentchk("1");
		book.setRentdate(nowDate);
		if (id != null) { 
			if(rentservice.borrowBook(book)){				
				return "redirect:searchBook?listType="+listType+"&keyword="+keyword;
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
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		BookModel reserveBook = rentservice.selectReservation(book_cd);
		if (reserveBook != null) {
			if (reserveBook.getId() == id)
				rentservice.deleteReserve(book_cd); 
		}
		return "redirect:borrowReqListAdmin";
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
			BookModel reserveBook = rentservice.selectReservation(book_cd);
			if (reserveBook != null) {
				if (reserveBook.getId() == id)
					rentservice.deleteReserve(book_cd); 
			}
		}
		return "redirect:borrowReqListAdmin";
	}

	@RequestMapping("/borrowReqList")
	public String borrowReqList(HttpServletRequest request, Model model) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		} 
		List<BookModel> bookList = rentservice.borrowList(id); 
		model.addAttribute("bookList", bookList); 
		return "rent/borrowReqList";  
	}
	@RequestMapping("/borrowReqListAdmin")
	public String borrowReqListAdmin(HttpServletRequest request, Model model, HttpSession session) {
		session.setAttribute("adminMode", "admin");
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				if (cookie.getValue().equals("1")) {
					List<BookModel> bookList = rentservice.borrowList();
					List<BookModel> rentList = rentservice.rentList();
					model.addAttribute("bookList", bookList);
					model.addAttribute("rentList", rentList);
					return "rent/borrowReqListByAdmin";
				} else if (cookie.getValue().equals("0")) {
					List<BookModel> bookList = rentservice.borrowList(id);
					List<BookModel> rentList = rentservice.rentList(id);
					model.addAttribute("bookList", bookList);
					model.addAttribute("rentList", rentList);
					return "rent/borrowReqList";
				}
			}
		}
		return null;
	}
//
	@RequestMapping("/borrowList")
	public String borrowList(HttpServletRequest request, Model model) {
		String id = null;
		for (Cookie cookie : request.getCookies()) { 
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
			List<BookModel> bookList = rentservice.rentList(id);
			model.addAttribute("bookList", bookList);
			return "rent/borrowList"; 
	} 

	@RequestMapping("/extendBorrowBook")
	public String extendBorrowBook(String book_cd, BookModel book) throws NullPointerException {
		book = rentservice.selectRent(book_cd);
		
		String id = book.getId();
		SmsModel sms = new SmsModel();		
		
		book.setBook_cd(book_cd);
		
		MemberModel member =  joinDao.selectMember(id);
		BookModel reserveBook = rentservice.selectReservation(book_cd);	 
		
		if (reserveBook == null) {
			sms.setPhone(member.getMobi_no().substring(1));
			sms.setTitle(book.getTitle());

			rentservice.extendBorrowBook(book);
			notifiService.notifiExtend(sms);

		} else if (reserveBook.getReservechk()
				.equals("0")) {
			sms.setPhone(member.getMobi_no().substring(1));
			sms.setTitle(book.getTitle());

			rentservice.extendBorrowBook(book);
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
			BookModel reserveBook = rentservice.selectReservation(book_cd);	
			if (reserveBook == null) {
				BookModel book = new BookModel();
				book.setBook_cd(book_cd);				
				rentservice.extendBorrowBook(book);
			} else if (reserveBook.getReservechk()
					.equals("0")
					&& rentservice.selectRent(book_cd).getExtendchk()
							.equals("0")) {
				BookModel book = new BookModel();
				book.setBook_cd(book_cd); 
				rentservice.extendBorrowBook(book);
			} else {
				return "/rent/extendFail";
			}
		}
		return "/rent/extendSuccess";

	}

	@RequestMapping("/cancleBorrowBook")
	public ModelAndView cancleBorrowBook(String book_cd, BookModel bookmodel,
			HttpServletRequest request, ModelAndView mav) {  
		String id = "";
		for (Cookie cookie : request.getCookies()) { 
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		bookmodel.setId(id);
		rentservice.cancleBorrowBook(bookmodel);
		List<BookModel> bookList = rentservice.borrowList(bookmodel.getId());
		mav.addObject("bookList", bookList);
		mav.setViewName("redirect:borrowReqList");		
		return mav;
	}
	
	@RequestMapping("/cancleBorrowBookAdmin")
	public ModelAndView cancleBorrowBookAdmin(String book_cd, BookModel bookmodel,
			HttpServletRequest request, ModelAndView mav) {
		String id = "";
		bookmodel = rentservice.selectBorrow(book_cd);
		
		for (Cookie cookie : request.getCookies()) { 
			if(cookie.getName().equals("bm_permission")){
				if(cookie.getValue().equals("1")){
					mav.setViewName("redirect:borrowReqListAdmin");
				} 
			} 
		}
		rentservice.cancleBorrowBook(bookmodel);
		List<BookModel> bookList = rentservice.borrowList(id);
		mav.addObject("bookList", bookList);
		
		return mav;
	}
//
//	@RequestMapping("/rentListAll")
//	public String rentListAll(Model model, HttpServletRequest request) {
//		List<BookModel> bookList = new ArrayList<BookModel>();
//		String permission = null;
//		bookList = rentservice.rentList();
//		model.addAttribute("bookList", bookList);
//
//		for (Cookie cookie : request.getCookies()) {
//			if (cookie.getName().equals("bm_permission"))
//				permission = (cookie.getValue());
//		}
//		if (permission.equals("1")) {
//			return "rent/rentList";
//		} else {
//			return "rent/borrowfail";
//		}
//
//	}
	

	@RequestMapping("/returnBook")
	public String returnBook(String book_cd, BookModel book) {
		rentservice.returnBook(book);
		
		return "redirect:borrowReqListAdmin";
	}
	@RequestMapping("/returnBookList")
	public String returnManyBook(
			@RequestParam(value = "book_cd") List<String> book_cdList) {

		for (String book_cd : book_cdList) {
			BookModel checkBook = rentservice.selectBook(book_cd);
			if (checkBook.getRentchk().equals("2")) {
				BookModel book = new BookModel();
				book.setBook_cd(book_cd);
				notifiService.notifiReturnConfirm(book_cd);
				rentservice.returnBook(book);
			}
		} 
		return "redirect:borrowReqListAdmin";
	}


	@RequestMapping("recoverBook")
	public String recoverBook(String book_cd) {
		rentservice.recoverBook(book_cd);

		return "redirect:searchBook?listType=title&keyword=";
	}

	@RequestMapping("stopBorrow")
	public String stopBorrow(String book_cd) {
		rentservice.stopBorrow(book_cd);

		return "redirect:searchBook?listType=title&keyword";
	}

	@RequestMapping("/stopBorrowList")
	public String stopBorrowList(
			@RequestParam(value = "book_cd") List<String> book_cdList) {
		for (String book_cd : book_cdList) {

			rentservice.stopBorrow(book_cd);

		}
		return "redirect:rentListAll";
	}
 
	@RequestMapping("/record")
	public String record(HttpServletRequest request, Model model) { 
		String id = null; 
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}  
		} 
		List<BookModel> record = rentservice.recordList(id);
		model.addAttribute("record", record);
		return "rent/record";
	}
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
			List<BookModel> bookList = rentservice.recordList();
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

	@RequestMapping("/reserveList")
	public String reserveList(HttpServletRequest request, Model model) {
		String id = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				if (cookie.getValue().equals("1")) {
					List<BookModel> bookList = rentservice.reserveList();
					model.addAttribute("bookList", bookList);
					return "rent/reserveList";

				} else if (cookie.getValue().equals("0")) {
					List<BookModel> reserve = rentservice.reserveList(id);
					model.addAttribute("bookList", reserve);
					return "rent/reserve";
				}
			}

		}
		return null;
	}
}