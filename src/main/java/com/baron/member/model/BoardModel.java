package com.baron.member.model;

import java.util.Date;
 
public class BoardModel {
	private int boardnum;
	private String title;
	private String content;
	private String regisdate;
	private String modifidate;
	private String id;
	private String kname;
	private String boardType;
	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

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

	public String getRegisdate() {
		return regisdate;
	}

	public void setRegisdate(String regisdate) {
		this.regisdate = regisdate;
	}

	public String getModifidate() {
		return modifidate;
	}

	public void setModifidate(String modifidate) {
		this.modifidate = modifidate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
