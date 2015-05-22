package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;

public interface EtcDao {
	public List<String> dinnerList();
	public List<String> breakfastList();
	public List<String> lunchList();
	public List<BookModel> copyDate();
	public void updateDate(BookModel book);
	public List<BookModel> selectBookForImage();
}
