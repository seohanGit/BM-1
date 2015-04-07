package com.baron.member.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.baron.member.model.BookModel;

public interface BookService {

	public void insertBook(BookModel model);

	public List<BookModel> searchBook(String keyword);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public void insertReservation(BookModel bookmodel);

	public String selectname(String booknum);

	public void updateBookReser(BookModel bookmodel);

	public String selectReservation(String booknum);

	public List<BookModel> findBook(String keyword) throws Exception;

<<<<<<< HEAD
	public BookModel addRequestBook(String isbn, String id, int quantity) throws Exception,
			IOException;

	public List<BookModel> requestList();

	void requestBook(BookModel model);

	public List<BookModel> borrowList(String id);
=======

	List<BookModel> getBestseller(String catogoryId) throws Exception;

	List<BookModel> getNewbook() throws Exception;

	void requestBook(BookModel model);

	public BookModel findBookOne(String isbn) throws Exception;



	
>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc

}
