package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;

public interface BookService {

	public void insertBook(BookModel model);

	public List<BookModel> searchBook(String keyword);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public String selectname(String booknum);

	public List<BookModel> findBook(String keyword) throws Exception;

	List<BookModel> getBestseller(String catogoryId) throws Exception;

	List<BookModel> getNewbook() throws Exception;

	BookModel selectBook(String bookCode);

}
