package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;

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
	public List<BookModel> selectBook(String keyword) {
		return session.selectList(NAMESPACE + "selectBook", keyword);
	}

	@Override
	public void deleteBook(String booknum) {

		session.delete(NAMESPACE + "deleteBook", booknum);
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBook(BookModel bookmodel) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + "updateBook", bookmodel);

	}

	@Override
	public String selectname(String booknum) {
		return session.selectOne(NAMESPACE + "selectname", booknum);
		// TODO Auto-generated method stub

	}

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + "insertReservation", bookmodel);

	}

	@Override
	public void updateBookReser(BookModel bookmodel) {
		session.update(NAMESPACE + "updateBookReser", bookmodel);
		// TODO Auto-generated method stub

	}

	@Override
	public String selectReservation(String booknum) {
		return session.selectOne(NAMESPACE + "selectReservation", booknum);
		// TODO Auto-generated method stub

	}

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

}
