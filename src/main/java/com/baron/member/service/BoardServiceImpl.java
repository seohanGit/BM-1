package com.baron.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BoardDao;
import com.baron.member.model.BoardModel;

@Service
// 입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 다오 클래스 사이에 비즈니스 로직이나 트랜잭션을 처리하는 클래스
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public void insertBoard(BoardModel model) {
		boardDao.insertBoard(model);
	}

	@Override
	public List<BoardModel> selectBoard() {
		return boardDao.selectBoard();
	}

	@Override
	public List<BoardModel> selectBoardregister() {
		// TODO Auto-generated method stub
		return boardDao.selectBoardregister();
	}

	@Override
	public List<BoardModel> selecBoardtitle() {
		// TODO Auto-generated method stub
		return boardDao.selectBoardtitle();
	}

	@Override
	public List<BoardModel> noticeList() {
		// TODO Auto-generated method stub

		return boardDao.noticeList();
	}

	@Override
	public void deleteNotice(int boardnum) {
		boardDao.deleteNotice(boardnum);
	}

	@Override
	public void modifyNotice(BoardModel content) {
		boardDao.modifyNotice(content);

	}

	@Override
	public void insertNotice(BoardModel boardmodel) {
		boardDao.insertNotice(boardmodel);

	}

	@Override
	public void modifyBoard(BoardModel boardmodel) {
		
		boardDao.modifyBoard(boardmodel);

	}

	@Override
	public void deleteBoard(int boardnum) {
		boardDao.deleteBoard(boardnum);

	}

	@Override
	public BoardModel selectBoardnum(int boardnum) {
		// TODO Auto-generated method stub
		return boardDao.selectBoardnum(boardnum);
	}

}
