package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SearchResult;

public interface BookDao {
	public void insertBook(BookModel model);

	public BookModel selectBook(String bookCode);

	public void deleteBook(String booknum);

	public void updateBook(BookModel bookmodel);

	public String selectname(String booknum);

	List<SearchResult> searchBook(String keyword);

	public List<BookModel> listBook(Dto dto);

	public List<BookModel> selectBookAll();

	public List<CodeModel> selectBCodeList();
	public List<CodeModel> selectCCodeList();

}
