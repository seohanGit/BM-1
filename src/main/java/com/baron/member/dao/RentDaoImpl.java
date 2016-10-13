package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class RentDaoImpl implements RentDao {

	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public BookModel selectBook(String book_cd) { 
		return session.selectOne(NAMESPACE + "selectBook", book_cd);
	}

	@Override
	public BookModel selectBorrow(String book_cd) {

		return session.selectOne(NAMESPACE + "selectBorrow", book_cd);
	}

	@Override
	public List<BookModel> borrowList(String id) { 
		return session.selectList(NAMESPACE + "borrowList", id);
	}

	@Override
	public List<BookModel> borrowListAll() {
		return session.selectList(NAMESPACE + "borrowListAll");
	}

	@Override
	public void borrowBook(BookModel bookmodel) {
		session.insert(NAMESPACE + "borrowBook1", bookmodel);
		session.update(NAMESPACE + "borrowBook2", bookmodel.getBook_cd());

	}

	@Override
	public void returnBook(BookModel book) {

		session.update(NAMESPACE + "returnBook", book);
		session.update(NAMESPACE + "returnBook1", book);

	}

	@Override
	public void confirmBorrowBook(BookModel book) {
		session.update(NAMESPACE + "confirmBorrowBook", book);
		session.update(NAMESPACE + "confirmBorrowBook1", book.getBook_cd());

	}

	@Override
	public List<BookModel> rentListAll() {
		return session.selectList(NAMESPACE + "rentListAll");
	}

	@Override
	public List<BookModel> rentList(String id) {
		return session.selectList(NAMESPACE + "rentList", id);
	}

	@Override
	public List<BookModel> recordList(String id) {
		return session.selectList(NAMESPACE + "recordList", id);
	}

	@Override
	public List<BookModel> recordListAll() {
		return session.selectList(NAMESPACE + "recordListAll");
	}

	@Override
	public void extendBorrowBook(BookModel book) {
		session.update(NAMESPACE + "extendBorrowBook", book);

	}

	@Override
	public void cancleBorrowBook(String book_cd) {
		session.update(NAMESPACE + "cancelBorrowBook", book_cd);

	}

	@Override
	public void deleteBorrowBook(BookModel bookmodel) {
		session.delete(NAMESPACE + "deleteBorrowBook", bookmodel);
	}

	@Override
	public void stopBorrow(String book_cd) {
		session.update(NAMESPACE + "stopBorrow", book_cd);

	}

	@Override
	public void recoverBook(String book_cd) {
		session.update(NAMESPACE + "recoverBook", book_cd);

	}

	@Override
	public void backupRecord(BookModel bookmodel) {
		session.insert(NAMESPACE + "backupRecord", bookmodel);

	}

	@Override
	public void insertReservation(BookModel bookmodel) {
		session.insert(NAMESPACE + "insertReservation", bookmodel);
		session.update(NAMESPACE + "insertReservation1", bookmodel.getBook_cd());
	}

	@Override
	public BookModel selectReservation(String book_cd) {
		return session.selectOne(NAMESPACE + "selectReservation", book_cd);

	}

	@Override
	public List<BookModel> reservationListAll() {
		return session.selectList(NAMESPACE + "reservationListAll");
	}

	@Override
	public List<BookModel> reservationList(String id) {
		return session.selectList(NAMESPACE + "reservationList", id);
	}

	@Override
	public List<BookModel> copyRent() {
		return session.selectList(NAMESPACE + "copyRent");
	}

	@Override
	public void insertRecord(BookModel bookmodel) {
		session.insert(NAMESPACE + "backupRecord", bookmodel);
	}

	@Override
	public BookModel selectRent(String book_cd) {
		return session.selectOne(NAMESPACE + "selectRent", book_cd);
	}

	@Override
	public void deleteReserve(String book_cd) {
		session.delete(NAMESPACE + "deleteReserve", book_cd);

	}

	@Override
	public List<BookModel> delayList() { 
		return session.selectList(NAMESPACE + "selectDelayList");
	}

	@Override
	public int checkRentCount(String id) {
		return session.selectOne(NAMESPACE + "checkRentCount", id);
	}

}
