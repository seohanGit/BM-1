package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;

public interface StatisticDao {

	public List<BookModel> selectBestBook(Dto param);

	public List<BookModel> getNewbook();

	public List<MemberModel> selectBestTeam(String year);

	public List<BookModel> selectBookCount();

	public List<Dto> selectBestPerson(Dto param);

	public List<Dto> selectSumPurchase(Dto param);

	public List<Dto> selectGroupByB(Dto param);

	public List<Dto> rentByMonth(Dto param);

}
