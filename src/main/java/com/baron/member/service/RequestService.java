package com.baron.member.service;

import java.io.IOException;
import java.util.List;

import com.baron.member.model.BookModel;

public interface RequestService {

	public List<BookModel> requestList();

	public void deleteRequest(String bookCode);

	public void requestBook(BookModel model);

	public BookModel addRequestBook(String isbn, String id, int quantity)
			throws Exception, IOException;

	public BookModel findBookOne(String isbn)throws Exception ;

}
