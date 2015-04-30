package com.baron.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.RentDao;
import com.baron.member.model.BookModel;

@Service
public class RentServiceImpl implements RentService {
	/*
	 * 대여 예약 서비스
	 */
	@Autowired
	private RentDao rentDao;

	@Override
	public BookModel selectBook(String bookCode) {
		// TODO Auto-generated method stub
		return rentDao.selectBook(bookCode);
	}

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		rentDao.insertReservation(bookmodel);
	}

	@Override
	public String selectReservation(String bookCode) {
		// TODO Auto-generated method stub
		return rentDao.selectReservation(bookCode);
	}

	@Override
	public List<BookModel> borrowList(String id) {
		// TODO Auto-generated method stub
		return rentDao.borrowList(id);
	}

	@Override
	public List<BookModel> borrowListAll() {
		return rentDao.borrowListAll();
	}

	@Override
	public String borrowCheck(BookModel bookmodel) {
		BookModel checkbook = rentDao.selectBook(bookmodel.getBook_cd());
		String borrowCheck = checkbook.getBorrowcheck();
		return borrowCheck;
	}

	@Override
	public void borrowBook(BookModel bookmodel) {

		rentDao.borrowBook(bookmodel);
		rentDao.updateBookTable(bookmodel.getBook_cd());

	}

	@Override
	public void confirmBorrowBook(String bookCode) {
		rentDao.confirmBorrowBook(bookCode);

	}

	@Override
	public void returnBook(String bookCode) {
		rentDao.returnBook(bookCode);

	}

	@Override
	public void returnManyBook(List<String> bookCodeList) {
		for (String bookCode : bookCodeList) {
			rentDao.returnBook(bookCode);
		}
	}

	@Override
	public void confirmReturnBook(String bookCode) {
		rentDao.confirmReturnBook(bookCode);

	}

	@Override
	public List<BookModel> returnListAll() {
		// TODO Auto-generated method stub
		return rentDao.returnListAll();
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
	public void upPoint(String id) {
		rentDao.upPoint(id);

	}

	@Override
	public void extendBorrowBook(String bookCode) {

		rentDao.extendBorrowBook(bookCode);
	}

	@Override
	public void cancleBorrowBook(BookModel bookmodel) {
		rentDao.cancleBorrowBook(bookmodel.getBook_cd());
		rentDao.deleteBorrowBook(bookmodel);

	}

	@Override
	public void stopBorrow(String bookCode) {
		rentDao.stopBorrow(bookCode);

	}

	@Override
	public void deleteRecord(BookModel book) {
		rentDao.deleteRecord(book);
		
	}

	@Override
	public void recoverBook(String bookCode) {
		rentDao.recoverBook(bookCode);
		
	}

}
