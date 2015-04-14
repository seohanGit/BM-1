package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;

public interface RentService {

	public String selectReservation(String bookCode);

	public List<BookModel> borrowList(String id);

	public List<BookModel> borrowListAll();

	public void borrowBook(BookModel bookmodel);

	public void returnBook(String bookCode);

	public void returnManyBook(List<String> bookCodeList);

	public void insertReservation(BookModel bookmodel);

	public void confirmBorrowBook(String bookCode);

	public List<BookModel> returnListAll();

	public List<BookModel> rentListAll();

	public void confirmReturnBook(String bookCode);

	public List<BookModel> recordList(String id);

	List<BookModel> recordListAll();

	public List<BookModel> reservationListAll();

	public void upPoint(String id);

	public void extendBorrowBook(String bookCode);

	BookModel selectBook(String bookCode);

	public void stopBorrow(String bookCode);

	String borrowCheck(BookModel bookmodel);

	void cancleBorrowBook(BookModel bookmodel);

}
