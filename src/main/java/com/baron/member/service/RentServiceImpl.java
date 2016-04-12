package com.baron.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.JoinDao;
import com.baron.member.dao.NotifiDao;
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

	@Autowired
	private NotifiDao notifiDao;

	SmsModel sms = new SmsModel();

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
	public BookModel selectReservation(String book_cd) {
		// TODO Auto-generated method stub
		return rentDao.selectReservation(book_cd);
	}

	@Override
	public List<BookModel> borrowList(String id) {
		
		return rentDao.borrowList(id);
	}

	@Override
	public List<BookModel> borrowList() {
		return rentDao.borrowListAll();
	}

	@Override
	public void borrowBook(BookModel bookmodel) {
		
		rentDao.borrowBook(bookmodel);
		deleteReserve(bookmodel.getBook_cd());

	}

	@Override
	public void confirmBorrowBook(String book_cd) {
		String id = null;
		if (rentDao.selectBook(book_cd) != null) {
			String title = rentDao.selectBook(book_cd).getTitle();
			id = rentDao.selectBorrow(book_cd).getId();
			sms.setTitle(title);

			if (joinDao.selectMember(id).getMobi_no() != null) {
				sms.setPhone(joinDao.selectMember(id).getMobi_no().substring(1));
				notifiDao.notifiRent(sms);
			}
		}
		rentDao.confirmBorrowBook(book_cd);
	}

	@Override
	public void returnBook(BookModel book) {
		rentDao.returnBook(book);	
	}

	@Override
	public List<BookModel> rentList() {
		// TODO Auto-generated method stub
		return rentDao.rentListAll();
	}

	@Override
	public List<BookModel> recordList(String id) {
		// TODO Auto-generated method stub
		return rentDao.recordList(id);
	}

	@Override
	public List<BookModel> recordList() {
		// TODO Auto-generated method stub
		return rentDao.recordListAll();
	}

	@Override
	public List<BookModel> reserveList() {
		// TODO Auto-generated method stub

		return rentDao.reservationListAll();
	}

	@Override
	public void extendBorrowBook(BookModel book) {

		rentDao.extendBorrowBook(book);
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
	public List<BookModel> reserveList(String id) { 
		return rentDao.reservationList(id);

	}

	@Override
	public MemberModel selectMember(String id) { 
		return joinDao.selectMember(id);
	}

	@Override
	public List<BookModel> copyRent() { 
		return rentDao.copyRent();
	}

	@Override
	public void insertRecord(BookModel bookmodel) {
		rentDao.insertRecord(bookmodel);
	}

	@Override
	public BookModel selectRent(String book_cd) { 
		return rentDao.selectRent(book_cd);
	}

	@Override
	public void deleteReserve(String book_cd) {
		rentDao.deleteReserve(book_cd);

	}

	@Override
	public List<BookModel> rentList(String id) { 
		return rentDao.rentList(id);
	}
	@Override
	public List<BookModel> delayList() { 
		return rentDao.delayList();
	}
}
