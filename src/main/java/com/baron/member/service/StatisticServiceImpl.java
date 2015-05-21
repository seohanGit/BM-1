package com.baron.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.StatisticDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;

@Service
public class StatisticServiceImpl implements StatisticService {

	@Autowired
	private StatisticDao statisticDao;

	@Override
	public List<BookModel> getNewbook() throws Exception {
		return statisticDao.getNewbook();

	}

	@Override
	public List<BookModel> selectBestBook() {

		return statisticDao.selectBestBook();
	}

	@Override
	public List<MemberModel> selectBestTeam() {

		List<MemberModel> list = new ArrayList<MemberModel>();
		list = statisticDao.selectBestTeam();
		int max = list.get(0).getCount();

		for (MemberModel member : list) {
			member.setMax(max);
		}
		return list;
	}

	@Override
	public List<BookModel> selectBookCount() {
		return statisticDao.selectBookCount();
	}

	@Override
	public List<MemberModel> selectBest() {

		return statisticDao.selectBest();
	}

	@Override
	public List<Dto> selectGroupByMonth(String year) {
		return statisticDao.selectGroupByMonth(year);
	}

	@Override
	public List<Dto> selectBestPerson() {
		return statisticDao.selectBestPerson();
	}

	@Override
	public List<Dto> selectSumPurchase(String year) {
		// TODO Auto-generated method stub
		return statisticDao.selectSumPurchase(year);
	}

}
