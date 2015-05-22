package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;

public interface RequestDao {

	public void requestBook(BookModel model);

	public List<BookModel> requestList();

	public void deleteRequest(String req_cd);

	public BookModel selectBook(String req_cd);

	public List<BookModel> requestRecord(String id);

	public void rejectRequest(String req_cd);

	public void modifiBook(BookModel book);

	public String selectB_code(String b_group);

	public String selectC_code(String c_group);
}
