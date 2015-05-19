package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SmsModel;

public interface RentService {

	public BookModel selectReservation(String book_cd);

	public List<BookModel> borrowList(String id);

	public List<BookModel> borrowListAll();

	public void borrowBook(BookModel bookmodel);

	public void returnBook(String book_cd);

	public void insertReservation(BookModel bookmodel);

	public void confirmBorrowBook(String book_cd);

	public List<BookModel> rentListAll();

	public List<BookModel> recordList(String id);

	List<BookModel> recordListAll();

	public List<BookModel> reservationListAll();

	public void extendBorrowBook(String book_cd);

	BookModel selectBook(String book_cd);

	public void stopBorrow(String book_cd);

	void cancleBorrowBook(BookModel bookmodel);

	public void recoverBook(String book_cd);

	public void backupRecord(BookModel bookmodel);

	public List<BookModel> reservationList(String id);

	public MemberModel selectMember(String id);

	public void notifiReservation(String book_cd);

	public void insertRecord(BookModel bookmodel);

	List<BookModel> copyRent();

	public BookModel selectRent(String book_cd);

	public void notifiReturnConfirm(String book_cd);

	public void deleteReserve(String book_cd);
}
