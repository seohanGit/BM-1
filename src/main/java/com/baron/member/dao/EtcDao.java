package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.ItDamage;

public interface EtcDao {
	public List<String> dinnerList(String nowDate);
	public List<String> breakfastList(String nowDate);
	public List<String> lunchList(String nowDate);
	public List<BookModel> copyDate();
	public void updateDate(BookModel book);
	public List<BookModel> selectBookForImage();
	public List<ItDamage> itDamageList();
	public void endDamage(ItDamage itDamage);
}
