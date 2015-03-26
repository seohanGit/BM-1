package com.baron.member.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.JoinDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;

@Service
// 입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 클래스 사이에
//비지니스 로직이나 트랜잭션을 처리하는 클래스
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
	public MemberModel login(MemberModel MemberModel) {
		
		return joinDao.selectMember(MemberModel);

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
	public List<MemberModel> selectBlack() {
		return joinDao.selectBlack();
	}

	@Override
	public List<MemberModel> selectLate() {
		// TODO Auto-generated method stub
		return joinDao.selectLate();
	}

	@Override
	public List<MemberModel> selectBest() {
		// TODO Auto-generated method stub
		return joinDao.selectBest();
	}

	@Override
	public List<ContentModel> selectContent() {
		// TODO Auto-generated method stub
		return joinDao.selectContent();
	}

	@Override
	public int selectMaxGrade() {
		// TODO Auto-generated method stub
		return joinDao.selectMaxGrade();
	}

	@Override
	public List<BookModel> selectBestBook() {
		// TODO Auto-generated method stub
		return joinDao.selectBestBook();
	}

	@Override
	public int selectMemberById(String id) {
		// TODO Auto-generated method stub
		return joinDao.selectMemberById(id);
	}


	
	
}
