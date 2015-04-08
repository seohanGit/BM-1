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

	public List<BookModel> borrowList(String id);

	List<BookModel> searchBook(String keyword);

	public List<BookModel> borrowListAll();

	public void borrowBook(BookModel bookmodel);

	public void returnBook(String bookCode);

	public void updateBookBorrow(BookModel bookmodel);

	public void deleteBorrow(String bookCode);



	
}
