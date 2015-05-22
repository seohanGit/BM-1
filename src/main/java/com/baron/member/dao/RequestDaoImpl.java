package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		System.out.println(model.getTitle());
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + "requestBook", model);

	}

	@Override
	public List<BookModel> requestList() {
		return session.selectList(NAMESPACE + "requestList");
	}

	@Override
	public void deleteRequest(String req_cd) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + "deleteRequest", req_cd);
	}

	@Override
	public BookModel selectBook(String req_cd) {
		return session.selectOne(NAMESPACE + "selectRequest", req_cd);

	}

	@Override
	public List<BookModel> requestRecord(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "requestRecord", id);
	}



	@Override
	public void rejectRequest(String req_cd) {
		session.update(NAMESPACE + "rejectRequest", req_cd);

	}

	@Override
	public void modifiBook(BookModel book) {
		System.out.println(book.getB_group());
		System.out.println(book.getReq_cd());
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

}
