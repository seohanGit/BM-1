package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;

public interface StatisticService {

	public List<BookModel> getNewbook() throws Exception;

	public List<BookModel> selectBestBook();

	public List<MemberModel> selectBestTeam();

	public List<BookModel> selectBookCount();

	public List<MemberModel> selectBest();
}
