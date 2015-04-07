package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;

public interface BookDao {
	public void insertBook(BookModel model);

	public List<BookModel> selectBook(String keyword);
	
	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public void insertReservation(BookModel bookmodel);

	public String selectname(String booknum);

	public void updateBookReser(BookModel bookmodel);

	public String selectReservation(String booknum);

	public void requestBook(BookModel model);

<<<<<<< HEAD
	public List<BookModel> requestList();

	public List<BookModel> borrowList(String id);
=======
	List<BookModel> searchBook(String keyword);
>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc


	
}
