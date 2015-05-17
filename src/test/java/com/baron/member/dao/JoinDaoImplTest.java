package com.baron.member.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;


import com.baron.member.model.BoardModel;
import com.baron.member.model.MemberModel;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class JoinDaoImplTest {

	@Autowired
	private JoinDao joinDao;
	
	@Before
	public void setup() {
		assertNotNull(joinDao);
	}
	
//	@Test
//	public void testSelectMemberById() throws Exception {
//		MemberModel model = new MemberModel();
//		model.setId("ksh90");
//		
//		int result = joinDao.selectMemberById(model);
//		assertEquals(1, result);
//	}

	@Test
	public void testInsertMember() throws Exception {
		MemberModel model = new MemberModel();
		model.setId("900601");
		model.setKname("민상훈");
		model.setPassword("1234");
		model.setMobi_no("01067766160");
		
		joinDao.insertMember(model);
	}
}
