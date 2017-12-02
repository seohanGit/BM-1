package com.baron.member.model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

public class MemberModel {

	private String id;
	@NotBlank(message = "패스워드를 입력하세요.")
	private String password;
	private String kname;
	private String email;
	private String mobi_no;
	private String permission;
	private String endday;

	private int count;
	private String content;

	private String borrowdate;
	private String returndate;
	private String jikb;
	private String co_gb;
	private String team_nm;
	private String chief;
	private String chiefid; 

	private int max;

	private String year;
	private String month;

	private String adminChk;
	private String serviceName;
	
	
	public String getAdminChk() {
		return adminChk;
	}

	public void setAdminChk(String adminChk) {
		this.adminChk = adminChk;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getChief() {
		return chief;
	}

	public void setChief(String chief) {
		this.chief = chief;
	}

	public String getChiefid() {
		return chiefid;
	}

	public void setChiefid(String chiefid) {
		this.chiefid = chiefid;
	}
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public String getTeam_nm() {
		return team_nm;
	}

	public void setTeam_nm(String team_nm) {
		this.team_nm = team_nm;
	}

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

	public String getBorrowdate() {
		return borrowdate;
	}

	public void setBorrowdate(String borrowdate) {
		this.borrowdate = borrowdate;
	}

	public String getReturndate() {
		return returndate;
	}

	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
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

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getMobi_no() {
		return mobi_no;
	}

	public void setMobi_no(String mobi_no) {
		this.mobi_no = mobi_no;
	}
}