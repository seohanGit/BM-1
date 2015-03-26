package com.baron.member.model;

import java.sql.Date;

public class BookModel {
	private String booknum;
	private String bookname;
	private String genre;
	private int damage;
	private Date borrowday;
	private Date retrunday;
	private String publisher;
	private String borrowcheck;
	private String resernum;
	private int grade;
	private String writer;
	private String imageurl;
	private String reserid;
	
	public String getReserid() {
		return reserid;
	}
	public void setReserid(String reserid) {
		this.reserid = reserid;
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
	public int getDamage() {
		return damage;
	}
	public void setDamage(int damage) {
		this.damage = damage;
	}
	public Date getBorrowday() {
		return borrowday;
	}
	public void setBorrowday(Date borrowday) {
		this.borrowday = borrowday;
	}
	public Date getRetrunday() {
		return retrunday;
	}
	public void setRetrunday(Date retrunday) {
		this.retrunday = retrunday;
	}
	public String getBorrowcheck() {
		return borrowcheck;
	}
	public void setBorrowcheck(String borrowcheck) {
		this.borrowcheck = borrowcheck;
	}
	public String getresernum() {
		return resernum;
	}
	public void setresernum(String resernum) {
		this.resernum = resernum;
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
