package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.SearchResult;

public interface BookDao {
	public void insertBook(BookModel model);

	public BookModel selectBook(String bookCode);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public String selectname(String booknum);

	List<SearchResult> searchBook(String keyword);

	public List<BookModel> getNewbook();

	public List<BookModel> getBestSeller();

	public List<BookModel> listBook(Dto dto);

	public  List<BookModel> selectBookAll();
	


}
