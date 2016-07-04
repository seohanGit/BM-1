package com.baron.member.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BookModel {
	private String book_cd;
	private String book_cd1;
 
	private String b_group;
	private String c_group;
	private int quantity;

	private String rentdate;
	private String returndate;
	private String reser_date;
	private String title;
	private String imageurl;
	private String publish;
	private String author;
	private int price;
	private String link;
	private String isbn;
	private String summary;
	private String reason;
	private int totalResults;

	private String rentchk;
	private String reservechk;
	private String req_ymd;
	private String retu_ymd;

	private String rcv_date;
	private String reqstatus;
	private String reqdate;
	private String req_cd;
	private int count;
	private String id;

	private String extendchk;
	private int total;
	private String field;
	private String rcmdChk;
	private String kname;
	
	private MultipartFile file;
	private String filename, localpath;

	 
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getLocalpath() {
		return localpath;
	}

	public void setLocalpath(String localpath) {
		this.localpath = localpath;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	} 
	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReq_ymd() {
		return req_ymd;
	}

	public void setReq_ymd(String req_ymd) {
		this.req_ymd = req_ymd;
	}

	public String getRetu_ymd() {
		return retu_ymd;
	}

	public void setRetu_ymd(String retu_ymd) {
		this.retu_ymd = retu_ymd;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRcmdChk() {
		return rcmdChk;
	}

	public void setRcmdChk(String rcmdChk) {
		this.rcmdChk = rcmdChk;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}
 
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getExtendchk() {
		return extendchk;
	}

	public void setExtendchk(String extendchk) {
		this.extendchk = extendchk;
	} 

	public int getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
	}
 

	public String getBook_cd1() {
		return book_cd1;
	}
 

	public String getReq_cd() {
		return req_cd;
	}

	public void setReq_cd(String req_cd) {
		this.req_cd = req_cd;
	}
 

	public String getRentdate() {
		return rentdate;
	}

	public void setRentdate(String date) {
		this.rentdate = date;
	}

	public String getReser_date() {
		return reser_date;
	}

	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}

	public String getReqdate() {
		return reqdate;
	}

	public void setReqdate(String reqdate) {
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
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
 

	public void setReturndate(String date) {
		this.returndate = date;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	} 
	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getReturndate() {
		return returndate;
	}

	public void setRetrundate(String returndate) {
		this.returndate = returndate;
	}

	public String getC_group() {
		return c_group;
	}

	public void setC_group(String c_group) {
		this.c_group = c_group;
	}

	public void setBook_cd1(String book_cd1) {
		this.book_cd1 = book_cd1;
	}
}
