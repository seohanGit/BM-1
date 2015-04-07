package com.baron.member.model;

import java.sql.Date;

public class BookModel {
	private String booknum;
	private String bookname;
	private String genre;
	private int quantity;
	private Date borrowday;
	private Date returnday;
	private Date requestdate;
	private String requestid;
	private String publisher;
	private String borrowcheck;
	private String resernum;
	private int grade;
	private String writer;
	private String imageurl;
	private String id;
	private String priceSales;
	private String link;
	private String isbn;
<<<<<<< HEAD
	private String requestid;
	private Date requestDate;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
=======

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Date getRequestdate() {
		return requestdate;
	}

	public void setRequestdate(Date requestdate) {
		this.requestdate = requestdate;
>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc
	}

	public String getRequestid() {
		return requestid;
	}

	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}

<<<<<<< HEAD
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
=======
	public String getResernum() {
		return resernum;
	}

	public void setResernum(String resernum) {
		this.resernum = resernum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setReturnday(Date returnday) {
		this.returnday = returnday;
>>>>>>> 5308682d6d996a04e3756f10010cd91de3dccfdc
	}

	public String getPriceSales() {
		return priceSales;
	}

	public void setPriceSales(String priceSales) {
		this.priceSales = priceSales;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getReserid() {
		return id;
	}

	public void setReserid(String reserid) {
		this.id = reserid;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getBooknum() {
		return booknum;
	}

	public void setBooknum(String booknum) {
		this.booknum = booknum;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Date getBorrowday() {
		return borrowday;
	}

	public void setBorrowday(Date borrowday) {
		this.borrowday = borrowday;
	}

	public Date getReturnday() {
		return returnday;
	}

	public void setRetrunday(Date returnday) {
		this.returnday = returnday;
	}

	public String getBorrowcheck() {
		return borrowcheck;
	}

	public void setBorrowcheck(String borrowcheck) {
		this.borrowcheck = borrowcheck;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
