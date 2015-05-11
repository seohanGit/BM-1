package com.baron.member.model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

public class MemberModel {

	private String id;
	@NotBlank(message = "패스워드를 입력하세요.")
	private String password;
	private String kname;
	private String email;
	private String address;
	private String cell;
	private String home;
	private String permission;
	private Date endday;
	private int numborrow;
	private int numarrear;
	private int score;
	private String content;
	private String team_nm;
	private Date borrowdate;
	private Date returndate;
	private String jikb;
	private String co_gb;

	public String getCo_gb() {
		return co_gb;
	}

	public void setCo_gb(String co_gb) {
		this.co_gb = co_gb;
	}

	public String getJikb() {
		return jikb;
	}

	public void setJikb(String jikb) {
		this.jikb = jikb;
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

	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}

	public String getTeam_nm() {
		return team_nm;
	}

	public void setTeam_nm(String team_nm) {
		this.team_nm = team_nm;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getNumarrear() {
		return numarrear;
	}

	public void setNumarrear(int numarrear) {
		this.numarrear = numarrear;
	}

	public int getNumborrow() {
		return numborrow;
	}

	public void setNumborrow(int numborrow) {
		this.numborrow = numborrow;
	}

	public Date getEndday() {
		return endday;
	}

	public void setEndday(Date endday) {
		this.endday = endday;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}
}
