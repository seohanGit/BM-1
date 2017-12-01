package com.baron.member.dao;

import java.util.List;
import java.util.Map;

import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SearchResult;

public interface BookDao {
	public void insertBook(BookModel model);
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public BookModel selectBook(String bookCode);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public String selectname(String booknum);

	public List<BookModel> listBook();
	public List<BookModel> newBook(Dto dto);
	public List<BookModel> bestBook(Dto dto);
	public List<BookModel> recommendBook();

	public List<BookModel> selectBookAll();

	public List<CodeModel> selectBCodeList();
	public List<CodeModel> selectCCodeList();

	public List<BookModel> searchBook(Dto dto); 
	public List<BookModel> searchAuthor(Dto dto); 
	public List<BookModel> searchPublisher(Dto dto);

	public void setRecommend(BookModel bookmodel);
	public String getMaxSer(BookModel bookmodel);

}
