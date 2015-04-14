package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;

public interface RentDao {

	void insertReservation(BookModel bookmodel);

	String selectReservation(String bookCode);

	List<BookModel> borrowList(String id);

	List<BookModel> borrowListAll();

	void borrowBook(BookModel bookmodel);

	void updateBookTable(String bookCode);

	void returnBook(String bookCode);

	void confirmBorrowBook(String bookCode);

	List<BookModel> returnListAll();

	List<BookModel> rentListAll();

	void confirmReturnBook(String bookCode);

	List<BookModel> recordList(String id);

	List<BookModel> recordListAll();

	List<BookModel> reservationListAll();

	void upPoint(String id);

	void extendBorrowBook(String bookCode);

	void cancleBorrowBook(String bookCode);

	BookModel selectBook(String bookCode);

	void stopBorrow(String bookCode);

	void deleteBorrowBook(BookModel bookmodel);


}
