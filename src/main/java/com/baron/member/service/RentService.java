package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;

public interface RentService {

	public String selectReservation(String book_cd);

	public List<BookModel> borrowList(String id);

	public List<BookModel> borrowListAll();

	public void borrowBook(BookModel bookmodel);

	public void returnBook(String book_cd);

	public void insertReservation(BookModel bookmodel);

	public void confirmBorrowBook(String book_cd);

	public List<BookModel> returnListAll();

	public List<BookModel> rentListAll();

	public void confirmReturnBook(String book_cd);

	public List<BookModel> recordList(String id);

	List<BookModel> recordListAll();

	public List<BookModel> reservationListAll();

	public void upPoint(String id);

	public void extendBorrowBook(String book_cd);

	BookModel selectBook(String book_cd);

	public void stopBorrow(String book_cd);

	void cancleBorrowBook(BookModel bookmodel);

	public void deleteRecord(BookModel book);

	public void recoverBook(String book_cd);

	public void backupRecord(BookModel bookmodel);

	public void confirmBorrowBook1(String book_cd);

	public void returnBook1(String book_cd);

}
