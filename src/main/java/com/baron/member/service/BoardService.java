package com.baron.member.service;

import java.util.List;

import com.baron.member.model.BoardModel;

public interface BoardService {

	public void insertBoard(BoardModel model);
	
	public List<BoardModel> selectBoard();

	public List<BoardModel> selectBoardregister();

	public List<BoardModel> selecBoardtitle();

	public List<BoardModel> noticeList();

	public void deleteNotice(int boardnum);

	public void modifyNotice(BoardModel content);

	public void insertNotice(BoardModel boardmodel);

	public void modifyBoard(BoardModel boardmodel);

	public void deleteBoard(int boardnum);

	public BoardModel selectBoardnum(int boardnum);
}
