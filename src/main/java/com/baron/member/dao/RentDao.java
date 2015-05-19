package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;

public interface RentDao {

	BookModel selectBorrow(String book_cd);

	BookModel selectBook(String book_cd);

	void insertReservation(BookModel bookmodel);

	BookModel selectReservation(String bookCode);

	List<BookModel> reservationList(String id);

	List<BookModel> reservationListAll();

	List<BookModel> borrowList(String id);

	List<BookModel> borrowListAll();

	List<BookModel> rentListAll();

	List<BookModel> recordList(String id);

	List<BookModel> recordListAll();

	void borrowBook(BookModel bookmodel);

	void returnBook(String bookCode);

	void confirmBorrowBook(String bookCode);

	void extendBorrowBook(String bookCode);

	void cancleBorrowBook(String bookCode);

	void stopBorrow(String bookCode);

	void deleteBorrowBook(BookModel bookmodel);

	void recoverBook(String bookCode);

	void backupRecord(BookModel bookmodel);

	BookModel selectRent(String book_cd);

	void insertRecord(BookModel bookmodel);

	List<BookModel> copyRent();

	void deleteReserve(String book_cd);



}
