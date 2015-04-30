package com.baron.member.dao;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.baron.member.model.BookModel;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class BookDaoImplTest {
	
	@Autowired
	private BookDao bookDao;
	
	@Before
	public void setup(){
		assertNotNull(bookDao);
		
	}
	
	@Test
	@Ignore
	public void insertBook()throws Exception{
		BookModel model = new BookModel();
		model.setBook_cd("mj1111");
		model.setTitle("안드로이드 프로그래밍 정복1");
		model.setB_group("JAVA");
		model.setPublish("한빛미디어");
		model.setAuthor("민상훈");
		
		bookDao.insertBook(model);
		
	}
	
/*	
	@Test
	public void selectBook()throws Exception{
		List<BookModel> model =bookDao.selectBook("그 후에");
		assertNotNull(model);
		assertTrue(model.size()>0);
		
	}
*/
}
