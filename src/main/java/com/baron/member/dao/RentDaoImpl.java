package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class RentDaoImpl implements RentDao {

	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + "insertReservation", bookmodel);
		session.update(NAMESPACE + "insertReservation1", bookmodel.getBook_cd());
	}

	@Override
	public String selectReservation(String bookCode) {
		return session.selectOne(NAMESPACE + "selectReservation", bookCode);
		// TODO Auto-generated method stub

	}

	@Override
	public List<BookModel> borrowList(String id) {
		// TODO Auto-generated method stub
		System.out.println(id + "dao");
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
	public void returnBook1(String book_cd) {
		session.update(NAMESPACE + "returnBook1", book_cd);

	}

	@Override
	public void confirmBorrowBook(String bookCode) {
		session.update(NAMESPACE + "confirmBorrowBook", bookCode);

	}

	@Override
	public void confirmBorrowBook1(String book_cd) {
		session.update(NAMESPACE + "confirmBorrowBook1", book_cd);

	}

	@Override
	public void upPoint(String id) {

		session.update(NAMESPACE + "upPoint", id);
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

	@Override
	public List<BookModel> recordListAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "recordListAll");
	}

	@Override
	public List<BookModel> reservationListAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "reservationListAll");
	}

	@Override
	public void extendBorrowBook(String bookCode) {
		session.update(NAMESPACE + "extendBorrowBook", bookCode);

	}

	@Override
	public void cancleBorrowBook(String bookCode) {
		session.update(NAMESPACE + "cancelBorrowBook", bookCode);

	}

	@Override
	public void deleteBorrowBook(BookModel bookmodel) {
		session.delete(NAMESPACE + "deleteBorrowBook", bookmodel);
	}

	@Override
	public BookModel selectBook(String bookCode) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + "selectBook", bookCode);
	}

	@Override
	public void stopBorrow(String bookCode) {
		session.update(NAMESPACE + "stopBorrow", bookCode);

	}

	@Override
	public void deleteRecord(BookModel book) {
		session.delete(NAMESPACE + "deleteRecord", book);
	}

	@Override
	public void recoverBook(String bookCode) {
		session.update(NAMESPACE + "recoverBook", bookCode);

	}

	@Override
	public void backupRecord(BookModel bookmodel) {
		session.insert(NAMESPACE + "backupRecord", bookmodel);

	}

	@Override
	public List<BookModel> reservationList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "reservationList", id);
	}

}
