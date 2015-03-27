package com.baron.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
//입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 다오 클래스 사아에 비지니스 로직이나 트랜잭션을 처리하는 클래스
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDao bookDao;
	
	private List<BookModel> findBook( String keyword){
		List<BookModel> bookModel = new ArrayList<BookModel>() ;
		
		
		return bookModel;
	}
	
	@Override
	public void insertBook(BookModel model) {
		bookDao.insertBook(model);	
	}

	@Override
	public List<BookModel> searchBook(String keyword) {
		return bookDao.selectBook(keyword);
	}

	@Override
	public void deleteBook(String booknum) {
		// TODO Auto-generated method stub
		bookDao.deleteBook(booknum);
	}

	@Override
	public void updateBook(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.updateBook(bookmodel);
		
	}

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.insertReservation(bookmodel);
	}

	@Override
	public String selectname(String booknum) {
		// TODO Auto-generated method stub
		return bookDao.selectname(booknum);
	}

	@Override
	public void updateBookReser(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.updateBookReser(bookmodel);
		
	}

	@Override
	public String selectReservation(String booknum) {
		// TODO Auto-generated method stub
		return bookDao.selectReservation(booknum);
	}





}
