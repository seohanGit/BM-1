package com.baron.member.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.exolab.castor.xml.dtd.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.dao.JoinDao;
import com.baron.member.dao.NotifiDao;
import com.baron.member.dao.RequestDao;
import com.baron.member.dao.SmsDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;

@Service
public class RequestServiceImpl implements RequestService {
	@Autowired
	private RequestDao requestDao;

	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private SmsDao smsDao;
	
	@Autowired
	private JoinDao joinDao;

	@Autowired NotifiDao notifiDao;
	
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
		model.setB_group(requestDao.convertB_code(model.getB_group().substring(2)));
		if(model.getC_group() != null){
			model.setC_group(requestDao.convertC_code(model.getC_group().substring(4)));
		}
		model.setBook_cd(model.getB_group() + model.getC_group() + "-");
		
		requestDao.requestBook(model);
	}

	@Override
	public void confirmBuy(BookModel model){
		SmsModel sms = new SmsModel();
		String mobi_no = joinDao.selectMember(model.getId())
				.getMobi_no().substring(1);
		
		sms.setTitle(model.getTitle());
		sms.setPhone(mobi_no);

		if (model.getQuantity() > 1) {
			for (int i = 0; i < model.getQuantity(); i++) {
				model.setBook_cd(model.getBook_cd() + "(" + (i + 1) + ")");
				bookDao.insertBook(model);
			}

		} else {
			bookDao.insertBook(model);
		}
		notifiDao.notifiReq(sms);
	}
	/*
	 * @Override public BookModel getRequestBook(String isbn, String id, int
	 * quantity) throws Exception, IOException { BookModel book = new
	 * BookModel(); URL url = getIsbnUrl(isbn);
	 * 
	 * getApiTest(url);
	 * 
	 * XmlDom xmlDom = new XmlDom(); book = xmlDom.getBook(url.openStream());
	 * book.setId(id); book.setQuantity(quantity);
	 * System.out.println(book.getId()); System.out.println(book.getGenre());
	 * return book; }
	 */
	public BookModel findBookOne(String isbn) throws Exception {
		BookModel book = new BookModel();
		URL url = getIsbnUrl(isbn);

		getApiTest(url);

		XmlDom xmlDom = new XmlDom();
		book = xmlDom.getBook(url.openStream());
		System.out.println(url);

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
	public BookModel selectBook(String req_cd) {
		return requestDao.selectBook(req_cd);

	}

	@Override
	public List<BookModel> requestRecord(String id) {
		// TODO Auto-generated method stub
		return requestDao.requestRecord(id);
	}

	@Override
	public void modifiBook(BookModel book) {
		requestDao.modifiBook(book);
	}

	@Override
	public void rejectRequest(String req_cd) {
		requestDao.rejectRequest(req_cd);

	}

	@Override
	public String selectB_code(String b_group) {
		return requestDao.selectB_code(b_group);
	}

	@Override
	public String selectC_code(String c_group) {
		return requestDao.selectC_code(c_group);
	}
}
