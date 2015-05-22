package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;

public interface StatisticService {

	public List<BookModel> getNewbook() throws Exception;

	public List<BookModel> selectBestBook(Dto param) throws Exception;

	public List<MemberModel> selectBestTeam(String year) throws Exception;

	public List<BookModel> selectBookCount() throws Exception;

	public List<Dto> selectBestPerson(Dto param);

	public List<Dto> selectSumPurchase(Dto param);

	public List<Dto> selectGroupByB(Dto param);

	public List<Dto> rentByMonth(Dto param);


	

}
