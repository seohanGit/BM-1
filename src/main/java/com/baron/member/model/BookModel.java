package com.baron.member.model;

import java.util.Date;

public class BookModel {
	private String book_cd;
	private String book_cd1;

	private String b_group;
	private String c_group;
	private int quantity;

	private java.util.Date rentdate;
	private java.util.Date returndate;
	private Date reser_date;
	private String title;
	private String imageurl;
	private String publish;
	private String author;
	private String price;
	private String link;
	private String isbn;
	private String summary;
	private int totalResults;

	private String rentchk;
	private String reservechk;

	private String rcv_date;
	private String reqstatus;
	private Date reqdate;
	private String req_cd;

	private String sabun;
	private String id;
	private String kname;
	private String team_nm;
	
	private int count;
	private String req_ymd;
	private String retu_ymd;
	private String mobi_no;
	
	private String extendchk;
	
	public String getExtendchk() {
		return extendchk;
	}

	public void setExtendchk(String extendchk) {
		this.extendchk = extendchk;
	}

	public String getMobi_no() {
		return mobi_no;
	}

	public void setMobi_no(String mobi_no) {
		this.mobi_no = mobi_no;
	}

	public int getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
	}

	public String getRetu_ymd() {
		return retu_ymd;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setRetu_ymd(String retu_ymd) {
		this.retu_ymd = retu_ymd;
	}

	public void setReq_ymd(String req_ymd) {
		this.req_ymd = req_ymd;
	}

	public String getReq_ymd() {
		return req_ymd;
	}

	public String getBook_cd1() {
		return book_cd1;
	}

	public String getTeam_nm() {
		return team_nm;
	}

	public void setTeam_nm(String team_nm) {
		this.team_nm = team_nm;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getReq_cd() {
		return req_cd;
	}

	public void setReq_cd(String req_cd) {
		this.req_cd = req_cd;
	}

	public String getSabun() {
		return sabun;
	}

	public void setSabun(String sabun) {
		this.sabun = sabun;
	}

	public java.util.Date getRentdate() {
		return rentdate;
	}

	public void setRentdate(java.util.Date date) {
		this.rentdate = date;
	}

	public Date getReser_date() {
		return reser_date;
	}

	public void setReser_date(Date reser_date) {
		this.reser_date = reser_date;
	}

	public Date getReqdate() {
		return reqdate;
	}

	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}

	public String getRentchk() {
		return rentchk;
	}

	public void setRentchk(String rentchk) {
		this.rentchk = rentchk;
	}

	public String getReservechk() {
		return reservechk;
	}

	public void setReservechk(String reservechk) {
		this.reservechk = reservechk;
	}

	public String getBook_cd() {
		return book_cd;
	}

	public void setBook_cd(String book_cd) {
		this.book_cd = book_cd;
		this.book_cd1 = book_cd;
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

	public String getRcv_date() {
		return rcv_date;
	}

	public void setRcv_date(String rcv_date) {
		this.rcv_date = rcv_date;
	}

	public String getReqstatus() {
		return reqstatus;
	}

	public void setReqstatus(String reqstatus) {
		this.reqstatus = reqstatus;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setReturndate(java.util.Date date) {
		this.returndate = date;
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

	public java.util.Date getReturndate() {
		return returndate;
	}

	public void setRetrundate(Date returndate) {
		this.returndate = returndate;
	}

	public String getC_group() {
		return c_group;
	}

	public void setC_group(String c_group) {
		this.c_group = c_group;
	}

}
