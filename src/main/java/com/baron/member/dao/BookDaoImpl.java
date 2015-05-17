package com.baron.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
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

	@Override
	public List<SearchResult> searchBook(String keyword) {
		return session.selectList(NAMESPACE + "searchBook", keyword);
	}

	@Override
	public BookModel selectBook(String book_cd) {
		return session.selectOne(NAMESPACE + "selectBook", book_cd);
	}

	@Override
	public void deleteBook(String book_cd) {

		session.delete(NAMESPACE + "deleteBook", book_cd);
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBook(BookModel bookmodel) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE + "updateBook", bookmodel);
	}

	@Override
	public String selectname(String book_cd) {
		return session.selectOne(NAMESPACE + "selectname", book_cd);
		// TODO Auto-generated method stub

	}

	@Override
	public List<BookModel> listBook(Dto dto) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "listBook", dto);
	}

	@Override
	public List<BookModel> selectBookAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "selectBookAll");
	}

	@Override
	public List<BookModel> selectBestBook() {

		return session.selectList(NAMESPACE + "selectBestBook");
	}

	@Override
	public List<BookModel> getNewbook() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "getNewbook");
	}

	@Override
	public List<MemberModel> selectBestTeam() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE + "selectBestTeam");
	}

}
