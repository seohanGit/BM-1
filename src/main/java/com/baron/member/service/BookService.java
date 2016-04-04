package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SearchResult;

public interface BookService {

	public void insertBook(BookModel model);

	public List<SearchResult> searchBook(String field, String keyword);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public String selectname(String booknum);

	BookModel selectBook(String bookCode);

	List<BookModel> findBook(String keyword) throws Exception;

	/*
	 * List<BookModel> pagenation(String keyword, String page) throws Exception;
	 */

	public List<BookModel> listBook(String listType, String datepicker1, String datepicker2);
	public List<BookModel> bookList(String listType);
	
	public List<BookModel> selectBookAll();



	public List<CodeModel> selectBCodeList();
	public List<CodeModel> selectCCodeList();

	public void updateDate() throws Exception;

	public List<BookModel> selectBookForImage();
}
