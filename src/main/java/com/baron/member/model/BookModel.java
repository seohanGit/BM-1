package com.baron.member.model;

import java.sql.Date;

public class BookModel {
	private String book_cd;
	private String title;
	
	private String b_group;
	private int quantity;
	private Date borrowdate;
	private Date returndate;
	private Date reservedate;
	private Date requestdate;
	private String id;
	private String publish;
	private String borrowcheck;
	private String reservecheck;
	private int grade;
	private String author;
	private String imageurl;
	private String price;
	private String link;
	private String isbn;
	private String summary;
	private int totalResults;
	private int startindex;
	private String keyword;
	private String rece_ymd;
	private int seq;
	private int count;
	private int sunbo;

	public String getBook_cd() {
		return book_cd;
	}

	public void setBook_cd(String book_cd) {
		this.book_cd = book_cd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getB_group() {
		return b_group;
	}

	public void setB_group(String b_group) {
		this.b_group = b_group;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRece_ymd() {
		return rece_ymd;
	}

	public void setRece_ymd(String rece_ymd) {
		this.rece_ymd = rece_ymd;
	}

	public int getSunbo() {
		return sunbo;
	}

	public void setSunbo(int sunbo) {
		this.sunbo = sunbo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStartindex() {
		return startindex;
	}

	public void setStartindex(int startIndex) {
		this.startindex = startIndex;
	}

	public int getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
	}

	public Date getReservedate() {
		return reservedate;
	}

	public void setReservedate(Date reservedate) {
		this.reservedate = reservedate;
	}

	public String getReservecheck() {
		return reservecheck;
	}

	public void setReservecheck(String reservecheck) {
		this.reservecheck = reservecheck;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

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
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setReturndate(Date returndate) {
		this.returndate = returndate;
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

	public Date getBorrowdate() {
		return borrowdate;
	}

	public void setBorrowdate(Date borrowdate) {
		this.borrowdate = borrowdate;
	}

	public Date getReturndate() {
		return returndate;
	}

	public void setRetrundate(Date returndate) {
		this.returndate = returndate;
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

	
}
