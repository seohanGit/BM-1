package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;

@Repository
public class StatisticDaoImpl implements StatisticDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";
	
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public List<BookModel> selectBestBook() {

		return session.selectList(NAMESPACE + "selectBestBook");
	}

	@Override
	public List<BookModel> getNewbook() {

		return session.selectList(NAMESPACE + "getNewbook");
	}

	@Override
	public List<MemberModel> selectBestTeam() {

		return session.selectList(NAMESPACE + "selectBestTeam");
	}

	@Override
	public List<MemberModel> selectBest() {
		// TODO Auto-generated method stub

		return session.selectList(NAMESPACE + "selectBest");
	}

	@Override
	public List<BookModel> selectBookCount() {
		System.out.println(session.selectList(NAMESPACE + "selectBookCount"));
		return session.selectList(NAMESPACE + "selectBookCount");
	}

}
