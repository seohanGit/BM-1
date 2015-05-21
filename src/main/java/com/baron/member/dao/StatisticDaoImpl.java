package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;

@Repository
public class StatisticDaoImpl implements StatisticDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public List<BookModel> selectBestBook(Dto param) {
		if (param.getMonth() != "") {
			return session.selectList(NAMESPACE + "selectBestBook", param);
		} else {
			return session.selectList(NAMESPACE + "selectBestBookYear", param);
		}
	}

	@Override
	public List<BookModel> getNewbook() {

		return session.selectList(NAMESPACE + "getNewbook");
	}

	@Override
	public List<MemberModel> selectBestTeam(String year) {

		return session.selectList(NAMESPACE + "selectBestTeam", year);
	}

	@Override
	public List<MemberModel> selectBest() {
		// TODO Auto-generated method stub

		return session.selectList(NAMESPACE + "selectBest");
	}

	@Override
	public List<BookModel> selectBookCount() {

		return session.selectList(NAMESPACE + "selectBookCount");
	}

	@Override
	public List<Dto> rentByMonth(Dto param) {
		return session.selectList(NAMESPACE + "rentByMonth", param);
	}

	@Override
	public List<Dto> selectBestPerson(Dto param) {
		if (param.getMonth() != "") {
			return session.selectList(NAMESPACE + "selectBestPerson", param);
		} else {
			return session.selectList(NAMESPACE + "selectBestPersonYear", param);
		}
	}

	@Override
	public List<Dto> selectSumPurchase(String year) {
		return session.selectList(NAMESPACE + "selectSumPurchase", year);
	}

	@Override
	public List<Dto> selectGroupByB(Dto param) {
		if (param.getMonth() != "") {
			return session.selectList(NAMESPACE + "selectGroupByB", param);
		} else {
			return session.selectList(NAMESPACE + "selectGroupByBYear", param);
		}
	}

}
