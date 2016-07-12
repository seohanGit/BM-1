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

	public List<String> dinnerList() {
		return session.selectList(NAMESPACE + "selectdinner");
	}

	public List<String> lunchList() {
		return session.selectList(NAMESPACE + "selectlunch");
	}

	public List<String> breakfastList() {
		return session.selectList(NAMESPACE + "selectbreakfast");
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
	}
}
