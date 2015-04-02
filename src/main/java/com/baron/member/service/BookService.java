package com.baron.member.service;

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


	List<BookModel> getBestseller() throws Exception;

	List<BookModel> getNewbook() throws Exception;

	void requestBook(BookModel model);

}
