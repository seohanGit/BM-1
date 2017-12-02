package com.baron.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.baron.member.model.BoardModel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class BoardDaoImplTest {
	
	@Autowired
	private BoardDao boardDao;
	
//	@Test
//	public void testInsertBoard()throws Exception{
//		BoardModel model = new BoardModel();
//		model.setBoardnum(6);
//		model.setContent("ㅎㅎ");
//		model.setId("ksh90");
//		model.setTitle("안녕하세요용");
//	
//		
//		boardDao.insertBoard(model);
//	}
	
	@Test
	public void selectBoard()throws Exception{
		List<BoardModel> model = boardDao.selectBoard();
		assertNotNull(model);
		
	}
	
	

}
