package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;

public interface RequestDao {

	public void requestBook(BookModel model);

	public List<BookModel> requestList();

	public void deleteRequest(String bookCode);

	public BookModel selectBook(String bookCode);
}
