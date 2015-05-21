package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.BookModel;
import com.baron.member.service.BookService;
import com.baron.member.service.EtcService;
import com.baron.member.service.RentService;
import com.baron.member.service.RequestService;

@Controller
public class EtcController {

	@Autowired
	private EtcService etcService;

	@Autowired
	private RentService rentservice;

	@Autowired
	private BookService bookservice;

	@Autowired
	private RequestService requestservice;

	@RequestMapping("/food")
	public String todayFood(Model model) {

		List<String> breakfastList = new ArrayList<String>();
		List<String> lunchList = new ArrayList<String>();
		List<String> dinnerList = new ArrayList<String>();
		breakfastList = etcService.breakfastList();
		lunchList = etcService.lunchList();
		dinnerList = etcService.dinnerList();

		model.addAttribute("List1", breakfastList);
		model.addAttribute("List2", lunchList);
		model.addAttribute("List3", dinnerList);

		return "food";
	}

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

	@RequestMapping("/updateDate")
	public String updateDate ()	{
		try {
			bookservice.updateDate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "updateDate";
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