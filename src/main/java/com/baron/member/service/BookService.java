package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;

public interface BookService {

	public void insertBook(BookModel model);

	public List<BookModel> searchBook(String keyword);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public String selectname(String booknum);

	List<BookModel> getNewbook() throws Exception;

	BookModel selectBook(String bookCode);

	List<BookModel> findBook(String keyword) throws Exception;
/*
	List<BookModel> pagenation(String keyword, String page) throws Exception;
*/
	public List<BookModel> getBestSeller();



	public List<BookModel> listBook(Dto dto);

}
