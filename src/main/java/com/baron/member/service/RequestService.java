package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;

public interface RequestService {

	public List<BookModel> requestList();

	public void deleteRequest(BookModel model);

	public void requestBook(BookModel model);

	/*
	 * public BookModel getRequestBook(String isbn, String id, int quantity)
	 * throws Exception, IOException;
	 */
	public BookModel findBookOne(String isbn) throws Exception;

	public BookModel selectBook(BookModel book);

	public List<BookModel> requestRecord(String id);

	public void rejectRequest(BookModel book);

	public void modifiBook(BookModel book);

	public String selectB_code(String b_group);

	public String selectC_code(String c_group);

	public void confirmBuy(BookModel model);

	public int selectMaxSer();

}
