package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;

public interface StatisticService {

	public List<BookModel> getNewbook() throws Exception;

	public List<BookModel> selectBestBook() throws Exception;

	public List<MemberModel> selectBestTeam() throws Exception;

	public List<BookModel> selectBookCount() throws Exception;

	public List<MemberModel> selectBest() throws Exception;

}
