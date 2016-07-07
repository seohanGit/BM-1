package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SmsModel;

public interface RentService {
	public MemberModel selectMember(String id);

	public BookModel selectBook(String book_cd);

	public BookModel selectRent(String book_cd);

	public BookModel selectReservation(String book_cd);

	// 대여요청
	public List<BookModel> borrowList(String id);

	public List<BookModel> borrowList();

	public boolean borrowBook(BookModel bookmodel);

	public void cancleBorrowBook(BookModel bookmodel);

	public void returnBook(BookModel bookmodel);

	public void confirmBorrowBook(String book_cd);

	// 대여 현황
	public List<BookModel> rentList();

	public List<BookModel> rentList(String id);

	public void extendBorrowBook(BookModel bookmodel);

	public void stopBorrow(String book_cd);

	public void recoverBook(String book_cd);

	// 백업 및 데이터 이관
	List<BookModel> copyRent();

	void backupRecord(BookModel bookmodel);

	// 대여 기록
	public void insertRecord(BookModel bookmodel);

	public List<BookModel> recordList(String id);

	public List<BookModel> recordList();

	// 예약 기능
	public void insertReservation(BookModel bookmodel);

	public List<BookModel> reserveList();

	public List<BookModel> reserveList(String id);

	public void deleteReserve(String book_cd);
	

	public List<BookModel> delayList();

	BookModel selectBorrow(String book_cd);
}
