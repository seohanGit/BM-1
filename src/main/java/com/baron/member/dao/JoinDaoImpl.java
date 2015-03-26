package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

// DAO(Data Access Object)
// 데이터베이스와 연동해서 데이터를 가져오거나 입려그수정
@Repository
public class JoinDaoImpl implements JoinDao {
	private static final String NAMESPACE = "com.baron.member.MemberModel.";

	@Resource(name = "sqlSession") //왜!
	private SqlSession session;
	
	@Override
	public int selectMemberById(MemberModel model)  {
		return session.<Integer>selectOne(NAMESPACE + "selectMemberById", model);
	}

	@Override
	public void insertMember(MemberModel model) {
		session.insert(NAMESPACE + "insertMember", model);
	}

	@Override
	public MemberModel selectMember(MemberModel model) {
		
		return session.selectOne(NAMESPACE + "selectMember", model);
	}

	@Override
	public String selectPass(String id) {
		
		return session.selectOne(NAMESPACE + "selectPass",id);
	}

	@Override
	public void updateMember(MemberModel model) {
		session.update(NAMESPACE + "updateMember",model);
		
	}

	@Override
	public List<MemberModel> selectBlack() {
		return session.selectList(NAMESPACE+"selectBlack");
	}

	@Override
	public List<MemberModel> selectLate() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+"selectLate");
	}

	@Override
	public List<MemberModel> selectBest() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+"selectBest");
	}

	@Override
	public List<ContentModel> selectContent() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+"selectContent");
	}

	@Override
	public int selectMaxGrade() {
		// TODO Auto-generated method stub
		return (int) session.selectOne(NAMESPACE+"selectMaxGrade");
	}

	@Override
	public List<BookModel> selectBestBook() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+"selectBestBook");
	}

	@Override
	public int selectMemberById(String id) {
		// TODO Auto-generated method stub
		return (int)session.selectOne(NAMESPACE+"selectMemberById",id);
	}
	

}
//일반적으로 DAO에서 mybatis를 사용하는 시나리오.
//
//1. Dao는 SqlSessionFactory에게 SQL을 실행할 객체를 요구한다.
//2. SqlSessionFactory는 SqlSession 객체를 생성하여 반환한다.
//3. Dao는 SqlSession 객체에게 SQL실행을 요청
//4. SqlSession 객체는 SQL이 저장된 맵퍼 파일(XML) 에서 SQL을 찾는다.
//5. SqlSession은 JDBC드라이버를 통해 데이터베이스에 질의를 실행
//6. SqlSession은 데이터베이스로부터 가져온 질의 결과를 객체로 생성하여 반환
//7. Dao는 사용이 끝난 SqlSession을 닫는다.
