package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;

public interface StatisticDao {

	public List<BookModel> selectBestBook();

	public List<BookModel> getNewbook();

	public List<MemberModel> selectBestTeam();

	public List<MemberModel> selectBest();

	public List<BookModel> selectBookCount();

	public List<Dto> selectGroupByMonth(String year);

	public List<Dto> selectBestPerson();

	public List<Dto> selectSumPurchase(String year);

}
