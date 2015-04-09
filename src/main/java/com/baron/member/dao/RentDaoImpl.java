package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class RentDaoImpl implements RentDao {

	private static final String NAMESPACE = "com.baron.member.MemberModel.";
	
	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + "insertReservation", bookmodel);

	}

	@Override
	public String selectReservation(String bookCode) {
		return session.selectOne(NAMESPACE + "selectReservation", bookCode);
		// TODO Auto-generated method stub

	}

	@Override
	public List<BookModel> borrowList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "borrowList", id);
	}

	@Override
	public List<BookModel> borrowListAll() {
		return session.selectList(NAMESPACE + "borrowListAll");
	}

	@Override
	public void borrowBook(BookModel bookmodel) {
		session.insert(NAMESPACE + "borrowBook1", bookmodel);

	}

	@Override
	public void updateBookTable(String bookCode) {
		session.update(NAMESPACE + "borrowBook2", bookCode);
	}

	@Override
	public void returnBook(String bookCode) {

		session.update(NAMESPACE + "returnBook", bookCode);
	}

	@Override
	public String selectname(String bookCode) {
		return session.selectOne(NAMESPACE + "selectname", bookCode);
		// TODO Auto-generated method stub

	}

	@Override
	public void confirmBorrowBook(String bookCode) {
		session.update(NAMESPACE + "confirmBorrowBook", bookCode);
		
	}

	@Override
	public List<BookModel> returnListAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "returnListAll");
	}

	@Override
	public List<BookModel> rentListAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "rentListAll");
	}

	@Override
	public void confirmReturnBook(String bookCode) {
		session.update(NAMESPACE + "confirmReturnBook", bookCode);
		
	}

	@Override
	public List<BookModel> recordList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "recordList", id);
	}
}
