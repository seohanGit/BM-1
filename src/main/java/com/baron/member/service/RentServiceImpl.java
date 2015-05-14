package com.baron.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.JoinDao;
import com.baron.member.dao.RentDao;
import com.baron.member.dao.SmsDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SmsModel;

@Service
public class RentServiceImpl implements RentService {
	/*
	 * 대여 예약 서비스
	 */
	@Autowired
	private RentDao rentDao;

	@Autowired
	private JoinDao joinDao;
	@Autowired
	private SmsDao smsDao;

	@Override
	public BookModel selectBook(String book_cd) {
		// TODO Auto-generated method stub
		return rentDao.selectBook(book_cd);
	}

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		rentDao.insertReservation(bookmodel);
	}

	@Override
	public BookModel selectReservation(String id) {
		// TODO Auto-generated method stub
		return rentDao.selectReservation(id);
	}

	@Override
	public List<BookModel> borrowList(String id) {
		// TODO Auto-generated method stub
		System.out.println(id + "service");
		return rentDao.borrowList(id);
	}

	@Override
	public List<BookModel> borrowListAll() {
		return rentDao.borrowListAll();
	}

	@Override
	public void borrowBook(BookModel bookmodel) {

		rentDao.borrowBook(bookmodel);

	}

	@Override
	public void confirmBorrowBook(String book_cd) {

		SmsModel sms = new SmsModel();
		String title = rentDao.selectBook(book_cd).getTitle();
		String id = rentDao.selectBorrow(book_cd).getId();
		System.out.println(id);
		sms.setTitle(title);
		sms.setPhone(joinDao.selectMember(id).getMobi_no().substring(1));
		smsDao.notifiRent(sms);
		rentDao.confirmBorrowBook(book_cd);
	}

	@Override
	public void returnBook(String book_cd) {
		rentDao.returnBook(book_cd);

	}

	@Override
	public List<BookModel> rentListAll() {
		// TODO Auto-generated method stub
		return rentDao.rentListAll();
	}

	@Override
	public List<BookModel> recordList(String id) {
		// TODO Auto-generated method stub
		return rentDao.recordList(id);
	}

	@Override
	public List<BookModel> recordListAll() {
		// TODO Auto-generated method stub
		return rentDao.recordListAll();
	}

	@Override
	public List<BookModel> reservationListAll() {
		// TODO Auto-generated method stub
		return rentDao.reservationListAll();
	}

	@Override
	public void extendBorrowBook(String book_cd) {

		rentDao.extendBorrowBook(book_cd);
	}

	@Override
	public void cancleBorrowBook(BookModel bookmodel) {
		rentDao.cancleBorrowBook(bookmodel.getBook_cd());
		rentDao.deleteBorrowBook(bookmodel);

	}

	@Override
	public void stopBorrow(String book_cd) {
		rentDao.stopBorrow(book_cd);

	}

	@Override
	public void recoverBook(String book_cd) {
		rentDao.recoverBook(book_cd);

	}

	@Override
	public void backupRecord(BookModel bookmodel) {
		rentDao.backupRecord(bookmodel);

	}

	@Override
	public List<BookModel> reservationList(String id) {
		// TODO Auto-generated method stub
		return rentDao.reservationList(id);

	}

	@Override
	public MemberModel selectMember(String id) {
		// TODO Auto-generated method stub
		return selectMember(id);
	}

	@Override
	public void notifiReser(SmsModel sms) {
		smsDao.notifiReser(sms);

	}

}
