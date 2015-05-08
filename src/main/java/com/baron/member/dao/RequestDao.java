package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;

public interface RequestDao {

	public void requestBook(BookModel model);

	public List<BookModel> requestList();

	public void deleteRequest(String req_cd);

	public BookModel selectBook(String bookCode);

	public List<BookModel> requestRecord(String id);
}
