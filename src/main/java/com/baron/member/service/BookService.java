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

	public List<BookModel> borrowList(String id);

	List<BookModel> getBestseller(String catogoryId) throws Exception;

	List<BookModel> getNewbook() throws Exception;

	public List<BookModel> borrowListAll();

	public void borrowBook(BookModel bookmodel);

	public void returnBook(String bookCode);

	void returnManyBook(List<String> bookCodeList);


}
