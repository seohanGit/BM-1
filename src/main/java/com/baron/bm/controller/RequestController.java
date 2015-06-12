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

import com.baron.member.dao.JoinDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
import com.baron.member.model.SmsModel;
import com.baron.member.service.BookService;
import com.baron.member.service.JoinService;
import com.baron.member.service.NotifiService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class RequestController {

	@Autowired
	private RequestService requestservice;

	@Autowired
	private NotifiService notifiService;

	@Autowired
	private JoinService joinService;

	@Autowired
	private RentService rentService;

	@Autowired
	private BookService bookService;

	@RequestMapping("/confirmRequest")
	public String requestResult(BookModel model) {
		/*
		 * System.out.println(model.getKname() + "님이 " + model.getTitle() +
		 * "을 구매요청하였습니다. ");
		 */
		model.setKname(model.getKname().substring(0, 5));
		model.setBook_cd(model.getB_group().substring(2));
		model.setReq_cd(model.getIsbn().substring(2) + model.getSabun() + "-("
				+ model.getQuantity() + 1 + ")");
		requestservice.requestBook(model);

		return "redirect:request";
	}

	@RequestMapping("/request")
	public String request(HttpServletRequest request, Model model) {
		List<BookModel> bookList = new ArrayList<BookModel>();
		String id = null, permission = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
				System.out.println(id);
			} else if (cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
			}

		}
		if (permission.equals("1")) {
			bookList = requestservice.requestList();
			model.addAttribute("bookList", bookList);
			return "request/requestList";
		} else {
			bookList = requestservice.requestRecord(id);
			System.out.println(id);
			model.addAttribute("bookList", bookList);
			return "request/request";
		}
	}

	@RequestMapping("/requestbook")
	public String requestBook(HttpServletRequest request, Model model,
			String isbn) throws Exception {
		String id = null;

		BookModel book = requestservice.findBookOne(isbn);

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
				book.setId(id);
			}
		}

		model.addAttribute("book", book);
		return "request/confirmRequest";
	}

	@RequestMapping("/buyRequest")
	public String buyRequest(String req_cd, Model model, BookModel book){
		
		book = requestservice.selectBook(req_cd);
		book.setB_group(book.getB_group().trim() +"-"+ requestservice.selectB_code(book.getB_group()).trim());
		book.setC_group(book.getC_group() +"-"+ requestservice.selectC_code(book.getC_group()));
		System.out.println(book.getB_group());System.out.println(book.getC_group());
		
		model.addAttribute("book", book);
		return "request/confirmBuy";
	}

	@RequestMapping("/confirmBuy")
	public String confirmBuy(BookModel model) {
		
		requestservice.confirmBuy(model);
		requestservice.deleteRequest(model.getReq_cd());

		return "redirect:request";

	}

	@RequestMapping("/confirmBuyList")
	public String confirmBuyList(
			@RequestParam(value = "req_cd") List<String> req_cdList) {
		for (String req_cd : req_cdList) {
			BookModel book = requestservice.selectBook(req_cd);
			if (bookService.selectBook(book.getBook_cd()) == null) {
				requestservice.confirmBuy(book);
				requestservice.deleteRequest(book.getReq_cd());
				return "request/buySuccess";
			} else {
				return "request/buyfail";

			}

		}
		return "redirect:request";
	}

	@RequestMapping("modifiReqForm")
	public String modifiForm(Model model) {
		List<BookModel> bookList = requestservice.requestList();
		List<CodeModel> BCodeList = bookService.selectBCodeList();
		List<CodeModel> CCodeList = bookService.selectCCodeList();

		model.addAttribute("bookList", bookList);
		model.addAttribute("BCodeList", BCodeList);
		model.addAttribute("CCodeList", CCodeList);

		return "request/modifiReqForm";
	}

	@RequestMapping(value = "/modifiRequest", method = RequestMethod.POST)
	public String modifiRequest(
			@RequestParam("book_cd") List<String> book_cdList,
			@RequestParam("req_cd") List<String> req_cdList/*
															 * ,
															 * 
															 * @RequestParam(
															 * "b_group")
															 * List<String>
															 * b_groupList,
															 * 
															 * @RequestParam(
															 * "c_group")
															 * List<String>
															 * c_groupList
															 */) {
		for (int i = 0; i < req_cdList.size(); i++) {
			BookModel book = new BookModel();
			book.setBook_cd(book_cdList.get(i));
			book.setReq_cd(req_cdList.get(i));
			/*
			 * book.setB_group(requestservice. selectB_code
			 * (book_cd.substring(0,1))); book.setC_group
			 * (requestservice.selectC_code (book_cd.substring(1,4)));
			 */
			/*
			 * String b_group = b_groupList.get(i); System.out.println(b_group);
			 * book.setB_group(requestservice.selectB_code(b_group)); String
			 * c_group = c_groupList.get(i); System.out.println(c_group);
			 * book.setC_group(requestservice.selectC_code(c_group));
			 */
			requestservice.modifiBook(book);
		}

		return "redirect:request";
	}

	@RequestMapping("/deleteRequest")
	public String deleteRequest(String req_cd) {
		requestservice.deleteRequest(req_cd);
		return "redirect:request";
	}

	@RequestMapping("/rejectRequest")
	public String rejectRequest(String req_cd) {

		requestservice.rejectRequest(req_cd);
		return "redirect:request";
	}
}
