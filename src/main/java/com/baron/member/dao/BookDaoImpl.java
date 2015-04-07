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
	public List<BookModel> searchBook(String keyword) {
		return session.selectList(NAMESPACE + "searchBook", keyword);
	}

	@Override
	public List<BookModel> selectBook(String bookCode) {
		return session.selectList(NAMESPACE + "selectBook", bookCode);
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
	public String selectReservation(String bookCode) {
		return session.selectOne(NAMESPACE + "selectReservation", bookCode);
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

	@Override
	public List<BookModel> borrowList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "borrowList", id);
	}

	@Override
	public void deleteRequest(String bookCode) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE + "deleteRequest", bookCode);

	}

	@Override
	public List<BookModel> selectBorrowList() {
		return session.selectList(NAMESPACE + "selectBorrowList");
	}

}
