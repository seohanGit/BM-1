package com.baron.member.dao;

import java.util.List;

import com.baron.member.model.BoardModel;

public interface BoardDao {

	public List<BoardModel> selectBoard();

	public void insertBoard(BoardModel model);

	public List<BoardModel> selectBoardregister();

	public List<BoardModel> selectBoardtitle();
}
