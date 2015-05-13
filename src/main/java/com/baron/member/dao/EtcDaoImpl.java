package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EtcDaoImpl implements EtcDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	public List<String> dinnerList(){
		return sqlSession.selectList(NAMESPACE + "selectdinner");
	}
	public List<String> lunchList(){
		return sqlSession.selectList(NAMESPACE + "selectlunch");
	}
	public List<String> breakfastList(){
		return sqlSession.selectList(NAMESPACE + "selectbreakfast");
	}
}
