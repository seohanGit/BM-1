package com.baron.member.model;

import java.util.Date;

public class BoardModel {
	private int boardnum;
	private String title;
	private String content;
	private Date registerdate;
	private Date modifidate;
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

	public Date getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	public Date getModifidate() {
		return modifidate;
	}

	public void setModifidate(Date modifidate) {
		this.modifidate = modifidate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
