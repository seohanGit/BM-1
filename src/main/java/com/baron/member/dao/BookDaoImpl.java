package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class BookDaoImpl implements BookDao {
	private static final String NAMESPACE = "com.baron.member.MemberModel.";

	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public void insertBook(BookModel model) {
		session.insert(NAMESPACE + "insertBook", model);
	}

	@Override
	public List<BookModel> searchBook(String keyword) {
		return session.selectList(NAMESPACE + "searchBook", keyword);
	}

	@Override
	public BookModel selectBook(String bookCode) {
		return session.selectOne(NAMESPACE + "selectBook", bookCode);
	}

	@Override
	public void deleteBook(String bookCode) {

		session.delete(NAMESPACE + "deleteBook", bookCode);
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBook(BookModel bookmodel) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + "updateBook", bookmodel);
	}

	@Override
	public String selectname(String bookCode) {
		return session.selectOne(NAMESPACE + "selectname", bookCode);
		// TODO Auto-generated method stub

	}

	@Override
	public List<BookModel> getNewbook() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "getNewbook");
	}

	@Override
	public List<BookModel> getBestSeller() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "getBestSeller");
	}

	
}
