package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BoardModel;

public interface BoardDao {

	public List<BoardModel> selectBoard();

	public void insertBoard(BoardModel model);

	public List<BoardModel> selectBoardregister();

	public List<BoardModel> selectBoardtitle();

	public List<BoardModel> noticeList();

	public void deleteNotice(int boardnum);

	public void modifyNotice(BoardModel content);

	public void insertNotice(BoardModel boardmodel);

	public void deleteBoard(int boardnum);

	public void modifyBoard(BoardModel boardmodel);

	public BoardModel selectBoardnum(int boardnum);
}
