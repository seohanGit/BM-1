package com.baron.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.JoinDao;
import com.baron.member.model.MemberModel;

@Service
// 입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 클래스 사이에
// 비지니스 로직이나 트랜잭션을 처리하는 클래스
public class JoinServiceImpl implements JoinService {

	@Autowired
	private JoinDao joinDao;

	@Override
	public boolean join(MemberModel memberModel) {

		int result = joinDao.selectMemberById(memberModel);

		if (result > 0) {
			return false;
		} else {
			joinDao.insertMember(memberModel);
		}

		return true;
	}

	@Override
	public MemberModel login(MemberModel memberModel) { 
		return joinDao.login(memberModel); 
	}

	@Override
	public String identify(String id) {
		return joinDao.selectPass(id);
	}

	@Override
	public void updateMember(MemberModel model) {
		joinDao.updateMember(model);

	}

	@Override
	public int selectMaxGrade() {
		// TODO Auto-generated method stub
		return joinDao.selectMaxGrade();
	}

	@Override
	public int selectMemberById(String id) {
		// TODO Auto-generated method stub
		return joinDao.selectMemberById(id);
	}

	@Override
	public List<MemberModel> memberList(String rentdate) {
		return joinDao.selectMemberList();
	}

	@Override
	public List<String> test() {
		// TODO Auto-generated method stub
		return joinDao.test();
	}

	@Override
	public MemberModel selectMember(String id) {
		return joinDao.selectMember(id);
		
	}

}
