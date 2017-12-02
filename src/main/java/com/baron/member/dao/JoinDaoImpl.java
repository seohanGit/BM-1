package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

// DAO(Data Access Object)
// 데이터베이스와 연동해서 데이터를 가져오거나 입려그수정
@Repository
public class JoinDaoImpl implements JoinDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	// 왜!
	private SqlSession session;

	@Autowired
	@Resource(name = "smsSession")
	private SqlSession smsSession;

	@Override
	public int selectMemberById(MemberModel model) {
		return session.<Integer> selectOne(NAMESPACE + "selectMemberById",
				model);
	}

	@Override
	public void insertMember(MemberModel model) {
		session.insert(NAMESPACE + "insertMember", model);
	}


	@Override
	public MemberModel login(MemberModel memberModel) { 
		return session.selectOne(NAMESPACE + "login", memberModel);
	}
	@Override
	public MemberModel selectMember(String id) { 
		return session.selectOne(NAMESPACE + "selectMember", id);
	}

	@Override
	public String selectPass(String id) { 
		return session.selectOne(NAMESPACE + "selectPass", id);
	}

	@Override
	public void updateMember(MemberModel model) {
		session.update(NAMESPACE + "updateMember", model); 
	} 
	@Override
	public int selectMaxGrade() {
		// TODO Auto-generated method stub
		return (int) session.selectOne(NAMESPACE + "selectMaxGrade");
	}

	@Override
	public int selectMemberById(String id) {
		// TODO Auto-generated method stub
		return (int) session.selectOne(NAMESPACE + "selectMemberById", id);
	}

	@Override
	public List<MemberModel> selectMemberList() { 
		return session.selectList(NAMESPACE + "selectMemberList");
	}

	@Override
	public List<String> test() { 
		return session.selectList(NAMESPACE + "test");
	}

}
// 일반적으로 DAO에서 mybatis를 사용하는 시나리오.
//
// 1. Dao는 SqlSessionFactory에게 SQL을 실행할 객체를 요구한다.
// 2. SqlSessionFactory는 SqlSession 객체를 생성하여 반환한다.
// 3. Dao는 SqlSession 객체에게 SQL실행을 요청
// 4. SqlSession 객체는 SQL이 저장된 맵퍼 파일(XML) 에서 SQL을 찾는다.
// 5. SqlSession은 JDBC드라이버를 통해 데이터베이스에 질의를 실행
// 6. SqlSession은 데이터베이스로부터 가져온 질의 결과를 객체로 생성하여 반환
// 7. Dao는 사용이 끝난 SqlSession을 닫는다.
