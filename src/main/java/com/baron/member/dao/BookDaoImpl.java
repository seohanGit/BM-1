package com.baron.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;
import com.baron.member.model.SearchResult;

@Repository
public class BookDaoImpl implements BookDao {
	private static final String NAMESPACE = "com.baron.member.sqlModel.";

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession session;
	@Autowired
	@Resource(name = "smsSession")
	private SqlSession smsSession;

	@Override
	public void insertBook(BookModel model) {
		session.insert(NAMESPACE + "insertBook", model);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
	    session.insert(NAMESPACE + "insertFile", map);
	}
	@Override
	public List<BookModel> searchBook(Dto dto) {
		return session.selectList(NAMESPACE + "searchBook", dto);
	}

	@Override
	public List<BookModel> searchAuthor(Dto dto) { 
		return session.selectList(NAMESPACE + "searchAuthor", dto.getKeyword());
	}

	@Override
	public List<BookModel> searchPublisher(Dto dto) {
		return session.selectList(NAMESPACE + "searchPublisher", dto.getKeyword());
	}
	@Override
	public BookModel selectBook(String book_cd) {
		return session.selectOne(NAMESPACE + "selectBook", book_cd);
	}

	@Override
	public void deleteBook(String book_cd) { 
		session.delete(NAMESPACE + "deleteBook", book_cd); 
	}

	@Override
	public void updateBook(BookModel bookmodel) {

		session.update(NAMESPACE + "updateBook", bookmodel);
	}

	@Override
	public String selectname(String book_cd) {
		return session.selectOne(NAMESPACE + "selectname", book_cd);

	}

	@Override
	public List<BookModel> listBook() {

		return session.selectList(NAMESPACE + "listBook");
	}

	@Override
	public List<BookModel> selectBookAll() {

		return session.selectList(NAMESPACE + "selectBookAll");
	}

	@Override
	public List<CodeModel> selectBCodeList() {

		return session.selectList(NAMESPACE + "selectB_codeList");
	}

	@Override
	public List<CodeModel> selectCCodeList() { 
		return session.selectList(NAMESPACE + "selectC_codeList");
	}

	@Override
	public List<BookModel> newBook(Dto dto) { 
		return session.selectList(NAMESPACE + "newBook", dto);
	}

	@Override
	public List<BookModel> bestBook(Dto dto) { 
		return session.selectList(NAMESPACE + "bestBook", dto);
	}

	@Override
	public List<BookModel> recommendBook() { 
		return session.selectList(NAMESPACE + "recommendBook");
	}
	
	@Override
	public void setRecommend(BookModel bookmodel) { 
		session.update(NAMESPACE + "setRecommend", bookmodel);
	}

	@Override
	public String getMaxSer(BookModel bookmodel) {  
		return session.selectOne(NAMESPACE + "getMaxSer", bookmodel);
	}
	
}
