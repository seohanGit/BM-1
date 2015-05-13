package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;

@Repository
public class RentDaoImpl implements RentDao {

	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	@Autowired
	@Resource(name = "smsSession")
	private SqlSession smsSession;

	private JoinDao joinDao;

	@Override
	public BookModel selectBook(String book_cd) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + "selectBook", book_cd);
	}

	@Override
	public BookModel selectBorrow(String book_cd) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + "selectBorrow", book_cd);
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
		session.update(NAMESPACE + "borrowBook2", bookmodel.getBook_cd());

	}

	@Override
	public void returnBook(String book_cd) {

		session.update(NAMESPACE + "returnBook", book_cd);
		session.update(NAMESPACE + "returnBook1", book_cd);

	}

	@Override
	public void confirmBorrowBook(String book_cd) {
		session.update(NAMESPACE + "confirmBorrowBook", book_cd);
		session.update(NAMESPACE + "confirmBorrowBook1", book_cd);

	}

	@Override
	public List<BookModel> rentListAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "rentListAll");
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
	public List<BookModel> reservationList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "reservationList", id);
	}

	@Override
	public void extendBorrowBook(String book_cd) {
		session.update(NAMESPACE + "extendBorrowBook", book_cd);

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
		// TODO Auto-generated method stub
		session.insert(NAMESPACE + "insertReservation", bookmodel);
		session.update(NAMESPACE + "insertReservation1", bookmodel.getBook_cd());
	}

	@Override
	public BookModel selectReservation(String book_cd) {
		return session.selectOne(NAMESPACE + "selectReservation", book_cd);
		// TODO Auto-generated method stub

	}

	@Override
	public void notifiReser(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiReser", sms);
	}

	@Override
	public void notifiRent(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiRent", sms);
	}

	@Override
	public void notifiReturn(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiReturn", sms);

	}

}
