package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;

@Repository
public class EtcDaoImpl implements EtcDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	public List<String> dinnerList(){
		return session.selectList(NAMESPACE + "selectdinner");
	}
	public List<String> lunchList(){
		return session.selectList(NAMESPACE + "selectlunch");
	}
	public List<String> breakfastList(){
		return session.selectList(NAMESPACE + "selectbreakfast");
	}
	@Override
	public BookModel copyDate(String book_cd) {
		return session.selectOne(NAMESPACE + "copyDate", book_cd);
	}
	@Override
	public void updateDate(BookModel book) {
		session.update(NAMESPACE + "updateDate", book);
		
	}
}
