package com.baron.member.dao;

import java.util.List;


import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class RequestDaoImpl implements RequestDao{
	private static final String NAMESPACE = "com.baron.member.MemberModel.";

	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public void requestBook(BookModel model) {
		System.out.println(model.getBookname());
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + "requestBook", model);

	}

	@Override
	public List<BookModel> requestList() {
		return session.selectList(NAMESPACE + "requestList");
	}

	@Override
	public void deleteRequest(String bookCode) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + "deleteRequest", bookCode);
	}
}
