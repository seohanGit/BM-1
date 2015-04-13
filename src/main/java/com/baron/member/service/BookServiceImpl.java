package com.baron.member.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.model.BookModel;

//입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 다오 클래스 사아에 비지니스 로직이나 트랜잭션을 처리하는 클래스
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;

	@Override
	public List<BookModel> getNewbook() throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getNewbookUrl();

		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;

	}

	@Override
	public List<BookModel> pagenation(String keyword, String page)
			throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getPageUrl(keyword, page);

		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;
	}

	@Override
	public List<BookModel> findBook(String keyword)
			throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getSearchUrl(keyword);

		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;
	}

	@Override
	public List<BookModel> getBestseller(String categoryId) throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getBestsellerUrl(categoryId);
		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;
	}

	@Override
	public void insertBook(BookModel model) {
		bookDao.insertBook(model);
	}

	@Override
	public List<BookModel> searchBook(String keyword) {
		return bookDao.searchBook(keyword);
	}

	@Override
	public BookModel selectBook(String bookCode) {
		return bookDao.selectBook(bookCode);
	}

	@Override
	public void deleteBook(String bookCode) {
		// TODO Auto-generated method stub
		bookDao.deleteBook(bookCode);
	}

	@Override
	public void updateBook(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.updateBook(bookmodel);

	}

	@Override
	public String selectname(String bookCode) {
		// TODO Auto-generated method stub
		return bookDao.selectname(bookCode);
	}

	/*
	 * 대여 예약 서비스
	 */

	private URL getNewbookUrl() throws UnsupportedEncodingException,
			MalformedURLException {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/newBook.api?";
		String parameter = "";

		key = URLEncoder.encode(key, "UTF-8");
		parameter = parameter + "&" + "categoryId=100";

		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
		return url;
	}

	private URL getBestsellerUrl(String categoryId)
			throws UnsupportedEncodingException, MalformedURLException {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/bestSeller.api?";
		String parameter = "";

		key = URLEncoder.encode(key, "UTF-8");
		parameter = parameter + "&" + "categoryId=" + categoryId;

		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
		return url;
	}

	private URL getPageUrl(String keyword, String page) throws Exception {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/search.api?";
		String parameter = "";
		String startIndex = "1";
		startIndex = page;

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "sort=salesPoint";
		parameter = parameter + "&" + "maxResults=15";
		parameter = parameter + "&" + "start=" + startIndex;

		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
		getApiTest(url);
		return url;
	}
	
	private URL getSearchUrl(String keyword) throws Exception {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/search.api?";
		String parameter = "";
	
		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "sort=salesPoint";
		parameter = parameter + "&" + "maxResults=15";

		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
		getApiTest(url);
		return url;
	}

	private void getApiTest(URL url) throws IOException {
		BufferedReader br;
		/* api 출력 확인 */
		br = new BufferedReader(new InputStreamReader(url.openStream()));

		String line;
		StringBuilder sBuffer = new StringBuilder();

		while ((line = br.readLine()) != null) {
			sBuffer.append(line);
			System.out.println(line);
		}

		br.close();
	}
	/*
	 * private URL getIsbnUrl(String keyword) throws
	 * UnsupportedEncodingException, MalformedURLException { String key =
	 * "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
	 * String addr = "http://book.interpark.com/api/search.api?"; String
	 * parameter = "";
	 * 
	 * key = URLEncoder.encode(key, "UTF-8"); keyword =
	 * URLEncoder.encode(keyword, "UTF-8"); parameter = parameter + "&" +
	 * "query=" + keyword; parameter = parameter + "&" + "queryType=isbn";
	 * parameter = parameter + "&" + "maxResults=1";
	 * 
	 * addr = addr + "key=" + key + parameter;
	 * 
	 * URL url = new URL(addr); return url;
	 * 
	 * }
	 */

}
