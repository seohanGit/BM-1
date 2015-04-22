package com.baron.member.model;

import java.sql.Date;

public class BookModel {
	private String bookCode;
	private String bookname;
	private String name;
	private String genre;
	private int quantity;
	private Date borrowdate;
	private Date returndate;
	private Date reservedate;
	private Date requestdate;
	private String id;
	private String publisher;
	private String borrowcheck;
	private String reservecheck;
	private int grade;
	private String writer;
	private String imageurl;
	private String priceSales;
	private String link;
	private String isbn;
	private String summary;
	private int totalResults;
	private int startindex;
	private String keyword;
	private Date buydate;
	private int seq;
	private int count;
	
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

	public Date getBuydate() {
		return buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
