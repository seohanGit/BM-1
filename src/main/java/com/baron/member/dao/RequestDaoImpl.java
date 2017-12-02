package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.ApprovalModel;
import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;

@Repository
public class RequestDaoImpl implements RequestDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	@Autowired
	@Resource(name = "smsSession")
	private SqlSession smsSession;

	@Override
	public void requestBook(BookModel model) {
		session.insert(NAMESPACE + "requestBook", model);

	}

	@Override
	public List<BookModel> requestList() {
		return session.selectList(NAMESPACE + "requestList");
	}

	@Override
	public void deleteRequest(BookModel model) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + "deleteRequest", model);
	}

	@Override
	public BookModel selectBook(BookModel model) {
		return session.selectOne(NAMESPACE + "selectRequest", model);

	}

	@Override
	public List<BookModel> requestRecord(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "requestRecord", id);
	}

	@Override
	public void rejectRequest(BookModel book) {
		session.update(NAMESPACE + "rejectRequest",book);

	}

	@Override
	public void modifiBook(BookModel book) { 
		session.update(NAMESPACE + "modifiReqBook", book);

	}

	@Override
	public String selectB_code(String b_group) {
		return session.selectOne(NAMESPACE + "selectB_code", b_group);
	}

	@Override
	public String selectC_code(String c_group) {
		return session.selectOne(NAMESPACE + "selectC_code", c_group);
	}

	@Override
	public String convertB_code(String b_group) {
		return session.selectOne(NAMESPACE + "convertB_code", b_group);
	}

	@Override
	public String convertC_code(String c_group) {
		return session.selectOne(NAMESPACE + "convertC_code", c_group);
	}

	@Override
	public int selectMaxSer() {
		return Integer.parseInt(session.selectOne(NAMESPACE + "selectMaxSer")); 
	}

	@Override
	public void approveChief(ApprovalModel approval) {
		session.insert(NAMESPACE + "insertApproval", approval);
		//session.delete(NAMESPACE + "deleteApproval");
		
	}
}
