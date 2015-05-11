package com.baron.member.dao;

import java.util.List;




import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class RequestDaoImpl implements RequestDao{
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Resource(name = "sqlSession")
	private SqlSession session;

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
	public BookModel selectBook(String book_cd) {
		return session.selectOne(NAMESPACE + "selectRequest", book_cd);
		
		
	}

	@Override
	public List<BookModel> requestRecord(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "requestRecord", id);
	}
}
