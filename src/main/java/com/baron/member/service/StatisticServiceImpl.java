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
	public List<BookModel> selectBestBook(Dto param) throws Exception{

		return statisticDao.selectBestBook(param);
	}

	@Override
	public List<MemberModel> selectBestTeam(String year) {

		List<MemberModel> list = new ArrayList<MemberModel>();
		list = statisticDao.selectBestTeam(year);
		/*int max = list.get(0).getCount();

		for (MemberModel member : list) {
			member.setMax(max);
		}*/
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
	public List<Dto> rentByMonth(Dto param) {
		return statisticDao.rentByMonth(param);
	}

	@Override
	public List<Dto> selectBestPerson(Dto param) {
		return statisticDao.selectBestPerson(param);
	}

	@Override
	public List<Dto> selectSumPurchase(String year) {
		return statisticDao.selectSumPurchase(year);
	}

	@Override
	public List<Dto> selectGroupByB(Dto param) {
		return statisticDao.selectGroupByB(param);
	}

	
}
