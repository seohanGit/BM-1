package com.baron.member.model;

import java.util.Date;


public class BoardModel {
	private int boardnum;
	private String title;
	private String content;
	private Date registerday;
	private Date modifiday;
	private String id;
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegisterday() {
		return registerday;
	}
	public void setRegisterday(Date registerday) {
		this.registerday = registerday;
	}
	public Date getModifiday() {
		return modifiday;
	}
	public void setModifiday(Date modifiday) {
		this.modifiday = modifiday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
