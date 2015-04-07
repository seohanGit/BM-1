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
import org.xml.sax.SAXException;

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

		getApiTest(url);

		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;

	}

	@Override
	public BookModel addRequestBook(String isbn, String id, int quantity)
			throws Exception, IOException {
		BookModel book = new BookModel();
		URL url = getIsbnUrl(isbn);

		getApiTest(url);

		XmlDom xmlDom = new XmlDom();
		book = xmlDom.getBook(url.openStream());
		book.setId(id);
		book.setQuantity(quantity);
		System.out.println(book.getId());
		System.out.println(book.getGenre());
		return book;
	}

	public BookModel findBookOne(String isbn) throws Exception {
		BookModel book = new BookModel();
		URL url = getIsbnUrl(isbn);

		getApiTest(url);

		XmlDom xmlDom = new XmlDom();
		book = xmlDom.getBook(url.openStream());
		System.out.println(isbn);

		return book;
	}

	@Override
	public List<BookModel> findBook(String keyword) throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getSearchUrl(keyword);

		getApiTest(url);
		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());
		System.out.println(keyword);

		return bookList;
	}

	private URL getIsbnUrl(String keyword) throws UnsupportedEncodingException,
			MalformedURLException {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/search.api?";
		String parameter = "";

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "queryType=isbn";
		parameter = parameter + "&" + "maxResults=1";

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
		return url;
	
	}

	@Override
	public List<BookModel> getBestseller(String categoryId) throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getBestsellerUrl(categoryId);

		getApiTest(url);

		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;
	}

	@Override
	public void insertBook(BookModel model) {
		bookDao.insertBook(model);
	}

	@Override
	public void requestBook(BookModel model) {
		model.setBookCode(model.getId() + model.getIsbn());
		System.out.println(model.getBookname());
		System.out.println(model.getIsbn());
		System.out.println(model.getBookname());
		bookDao.requestBook(model);
	}

	@Override
	public List<BookModel> searchBook(String keyword) {
		return bookDao.searchBook(keyword);
	}

	/*
	 * @Override public List<BookModel> selectBook(String bookCode) { return
	 * bookDao.selectBook(bookCode); }
	 */

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
	public void insertReservation(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.insertReservation(bookmodel);
	}

	@Override
	public String selectname(String bookCode) {
		// TODO Auto-generated method stub
		return bookDao.selectname(bookCode);
	}

	@Override
	public void updateBookReser(BookModel bookmodel) {
		// TODO Auto-generated method stub
		bookDao.updateBookReser(bookmodel);

	}

	@Override
	public String selectReservation(String bookCode) {
		// TODO Auto-generated method stub
		return bookDao.selectReservation(bookCode);
	}

	@Override
	public List<BookModel> requestList() {
		// TODO Auto-generated method stub
		return bookDao.requestList();
	}

	@Override
	public List<BookModel> borrowList(String id) {
		// TODO Auto-generated method stub
		return bookDao.borrowList(id);
	}

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

	private URL getSearchUrl(String keyword)
			throws UnsupportedEncodingException, MalformedURLException {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/search.api?";
		String parameter = "";

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "sort=accuracy";
		parameter = parameter + "&" + "maxResults=20";

		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		addr = addr + "key=" + key + parameter;

		URL url = new URL(addr);
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

	@Override
	public void deleteRequest(String bookCode) {
		 bookDao.deleteRequest(bookCode);
	}

	@Override
	public List<BookModel> selectBorrowList() {
		// TODO Auto-generated method stub
		return bookDao.selectBorrowList();
	}

}
