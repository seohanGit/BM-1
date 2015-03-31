package com.baron.bm.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
import com.baron.member.service.BookService;




@Controller
public class BookController {

	String booknum1;
	
	@Autowired
	private BookService bookservice;
	
	@RequestMapping("/insertbookForm")
	public String insertbook(){
		return "insertbook";
	}
	
	@RequestMapping("/insertbook")
	public String insertresult(BookModel model){
		bookservice.insertBook(model);		
		return "insertbookresult";
	}
	
	@RequestMapping("/buybook")
	public String buyBook(BookModel book, String booknum, String bookname, String genre, String writer, String publisher, String imageurl){
		/*if(bookservice.selectReservation(booknum)!=null){
			return "reservationfail";
		}*/
		book.setBookname(bookname);
		book.setBooknum(booknum);
		book.setGenre(genre);
		book.setWriter(writer);
		book.setPublisher(publisher);
		book.setImageurl(imageurl);
		
		bookservice.insertBook(book);		
		return "insertbookresult";
	}
	
	@RequestMapping("/searchBook")
	public String searchBook(String keyword,Model model){
		List<BookModel> bookList = bookservice.searchBook(keyword);
		model.addAttribute("bookList",bookList);
		return "search";
	}
	
	
	@RequestMapping("/findBook")
	public String findBook(String keyword,Model model) throws Exception{
		List<BookModel> bookList = bookservice.findBook(keyword);
		
		model.addAttribute("bookList",bookList);
		return "findBook";
	}
	
	
	@RequestMapping("/deletebook")
	public String deleteBook(String booknum,HttpServletRequest request){
		String permission;
		for (Cookie cookie : request.getCookies()) {
			if(cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if(permission.equals("0"))
					return "adminfail";
			}
		}
		if(bookservice.selectReservation(booknum)!=null){
			return "reservationfail";
		}
		
		bookservice.deleteBook(booknum);
		return "admin";
		
	}
	
	@RequestMapping("/modifyBookForm")
	public String modifyBookForm(String booknum,HttpServletRequest request){
		String permission;
		for (Cookie cookie : request.getCookies()) {
			if(cookie.getName().equals("bm_permission")) {
				permission = cookie.getValue();
				if(permission.equals("0"))
					return "adminfail";
			}
		}
		booknum1= booknum;
		return "modifyBook";
	}
	
	@RequestMapping("/modifybook1")
	public String modifybookresult(BookModel bookmodel){
		bookmodel.setBooknum(booknum1);
		bookservice.updateBook(bookmodel);
		return "modifybookresult";
	}
	
	@RequestMapping("/reservation")
	public String reservation(String booknum,BookModel book,HttpServletRequest request){
		
		if(bookservice.selectReservation(booknum)!=null){
			return "reservationfail";
		}
		
		String bookname;
		String resername;
		book.setBooknum(booknum);
		bookname = bookservice.selectname(booknum);
		System.out.println(bookname);
		book.setBookname(bookname);
		resername="reser"+book.getBooknum();
		book.setresernum(resername);
		
		for(Cookie cookie : request.getCookies()){
			if(cookie.getName().equals("bm_id"))
				book.setReserid(cookie.getValue());
		}
		bookservice.insertReservation(book);
		bookservice.updateBookReser(book);
		return "reservationresult";
	}
	
	

}
