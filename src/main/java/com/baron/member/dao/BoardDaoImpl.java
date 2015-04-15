package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BoardModel;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final String NAMESPACE = "com.baron.member.MemberModel.";

	@Resource(name = "sqlSession")
	private SqlSession session;

	@Override
	public List<BoardModel> selectBoard() {
		return session.selectList(NAMESPACE + "selectBoard");
	}

	@Override
	public void insertBoard(BoardModel model) {
		session.insert(NAMESPACE + "insertBoard", model);

	}

	@Override
	public List<BoardModel> selectBoardregister() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "selectBoardregister");
	}

	@Override
	public List<BoardModel> selectBoardtitle() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "selectBoardtitle");
	}

	@Override
	public List<BoardModel> noticeList() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "noticeList");
	}

	@Override
	public void deleteNotice(String boardnum) {
		session.delete(NAMESPACE + "deleteNotice", boardnum);
	}

	@Override
	public void modifyNotice(BoardModel content) {
		session.update(NAMESPACE + "modifyNotice", content);
		
	}

	@Override
	public void insertNotice(BoardModel boardmodel) {
		session.insert(NAMESPACE + "insertNotice", boardmodel);
		
	}
}
