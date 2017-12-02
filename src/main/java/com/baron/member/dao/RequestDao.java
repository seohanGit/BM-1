package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.ApprovalModel;
import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;

public interface RequestDao {

	public void requestBook(BookModel model);

	public List<BookModel> requestList( );

	public void deleteRequest(BookModel model);

	public BookModel selectBook(BookModel book);

	public List<BookModel> requestRecord(String id);

	public void rejectRequest(BookModel book);

	public void modifiBook(BookModel book);

	public String selectB_code(String b_group);

	public String selectC_code(String c_group);

	String convertB_code(String b_group);

	String convertC_code(String c_group);

	public int selectMaxSer();

	public void approveChief(ApprovalModel approval);
}
