package com.baron.member.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.model.BookModel;


//입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 다오 클래스 사아에 비지니스 로직이나 트랜잭션을 처리하는 클래스
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;
	private Object XMLPullParserFactory;

	@Override
	public List<BookModel> findBook(String keyword) throws Exception {
		BufferedReader br;

		List<BookModel> listBook = new ArrayList<BookModel>();
		List<String> contents = new ArrayList<String>();
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/search.api?";
		String parameter = "";

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "sort=accuracy";

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
		br = new BufferedReader(new InputStreamReader(url.openStream()));
		//InputStream in = url.openStream();

		String line;
		StringBuilder sBuffer = new StringBuilder();

		while ((line = br.readLine()) != null) {
			sBuffer.append(line);
			System.out.println(line);
		}
		
		br.close();
		XmlDom xmlDom = new XmlDom();
		contents = xmlDom.XmlDom(url.openStream());
	
		System.out.println(contents.get(0));;
	

		return listBook;
	}

	@Override
	public void insertBook(BookModel model) {
		bookDao.insertBook(model);
	}

	@Override
	public List<BookModel> searchBook(String keyword) {
		return bookDao.selectBook(keyword);
	}

	@Override
	public void deleteBook(String booknum) {
		// TODO Auto-generated method stub
		bookDao.deleteBook(booknum);
	}

	@Override
	public void updateBook(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.updateBook(bookmodel);

	}

	@Override
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.insertReservation(bookmodel);
	}

	@Override
	public String selectname(String booknum) {
		// TODO Auto-generated method stub
		return bookDao.selectname(booknum);
	}

	@Override
	public void updateBookReser(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.updateBookReser(bookmodel);

	}

	@Override
	public String selectReservation(String booknum) {
		// TODO Auto-generated method stub
		return bookDao.selectReservation(booknum);
	}

}
