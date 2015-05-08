package com.baron.member.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.dao.RequestDao;
import com.baron.member.model.BookModel;

@Service
public class RequestServiceImpl implements RequestService {
	@Autowired
	private RequestDao requestDao;

	@Override
	public List<BookModel> requestList() {
		// TODO Auto-generated method stub
		return requestDao.requestList();
	}

	@Override
	public void deleteRequest(String req_cd) {
		requestDao.deleteRequest(req_cd);
	}

	@Override
	public void requestBook(BookModel model) {
		model.setBook_cd(model.getId() + model.getIsbn());
		System.out.println(model.getTitle());
		System.out.println(model.getIsbn());
		System.out.println(model.getTitle());
		requestDao.requestBook(model);
	}
/*
	@Override
	public BookModel getRequestBook(String isbn, String id, int quantity)
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
*/
	public BookModel findBookOne(String isbn) throws Exception {
		BookModel book = new BookModel();
		URL url = getIsbnUrl(isbn);

		getApiTest(url);

		XmlDom xmlDom = new XmlDom();
		book = xmlDom.getBook(url.openStream());
		System.out.println(isbn);

		return book;
	}
	
	private URL getIsbnUrl(String keyword) throws UnsupportedEncodingException,
			MalformedURLException {
		String key = "B0F933E2847C6447203572CCC68F824A1054E7EF0D966C7B95245288CE95E300";
		String addr = "http://book.interpark.com/api/search.api?";
		String parameter = "";

		key = URLEncoder.encode(key, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "queryType=isbn";
		parameter = parameter + "&" + "maxResults=1";
		parameter = parameter + "&" + "searchTarget=book";
		parameter = parameter + "&" + "sort=salesPoint";

		key = URLEncoder.encode(key, "UTF-8");
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
	public BookModel selectBook(String bookCode) {
		return requestDao.selectBook(bookCode);
		
		
	}

	@Override
	public List<BookModel> requestRecord(String id) {
		// TODO Auto-generated method stub
		return requestDao.requestRecord(id);
	}
}
