package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.ItDamage;

@Repository
public class EtcDaoImpl implements EtcDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;

	public List<String> dinnerList(String nowDate) {
		return session.selectList(NAMESPACE + "selectdinner", nowDate);
	}

	public List<String> lunchList(String nowDate) {
		return session.selectList(NAMESPACE + "selectlunch", nowDate);
	}

	public List<String> breakfastList(String nowDate) {
		return session.selectList(NAMESPACE + "selectbreakfast", nowDate);
	}

	@Override
	public List<BookModel> copyDate() {
		return session.selectList(NAMESPACE + "copyDate");
	}

	@Override
	public void updateDate(BookModel book) {
		session.update(NAMESPACE + "updateDate", book);

	}

	@Override
	public List<BookModel> selectBookForImage() {
		return session.selectList(NAMESPACE + "selectBookForImage");
	}

	@Override
	public List<ItDamage> itDamageList() {
		 
		return session.selectList(NAMESPACE + "selectItDamage");
	}

	@Override
	public void endDamage(ItDamage itDamage) {
		session.update(NAMESPACE + "endDamage", itDamage);
		session.update(NAMESPACE + "endDamage2", itDamage);
	}
}
