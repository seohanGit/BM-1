package com.baron.member.service;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baron.bm.utils.FileUtils;
import com.baron.member.dao.BookDao;
import com.baron.member.dao.EtcDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.CodeModel;
import com.baron.member.model.Dto;

//입력을 받는 컨트롤러 클래스와 데이터베이스를 처리하는 다오 클래스 사아에 비지니스 로직이나 트랜잭션을 처리하는 클래스
@Service
public class BookServiceImpl implements BookService {

	String server = "175.200.81.11";
	int port = 21;
	String user = "ATTFL";
	String pass = "EDPS";

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private BookDao bookDao;

	@Autowired
	private EtcDao etcDao;

	@Override
	public List<BookModel> findBook(String keyword) throws Exception {
		List<BookModel> bookList = new ArrayList<BookModel>();

		URL url = getSearchUrl(keyword);

		XmlDom xmlDom = new XmlDom();
		bookList = xmlDom.getBooklist(url.openStream());

		return bookList;
	}

	@Override
	public void insertBook(BookModel model, HttpServletRequest request)  {
		if (model.getQuantity() == 1) {
			bookDao.insertBook(model);
		} else if (model.getQuantity() > 1) {
			for (int i = 0; i < model.getQuantity(); i++) {
				model.setBook_cd(model.getBook_cd() + "(" + (i + 1) + ")");
				bookDao.insertBook(model);
			}
		}List<Map<String, Object>> list;
		try {
			list = fileUtils.parseInsertFileInfo(model, request);
			for(int i=0, size=list.size(); i<size; i++){
	            bookDao.insertFile(list.get(i));
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}

	@Override
	public List<BookModel> searchBook(Dto dto) {
		dto.setKeyword(dto.getKeyword().trim());
		dto.setB_group(dto.getB_group().trim());
		dto.setC_group(dto.getC_group().trim());
		
		switch (dto.getB_group()){
		case "전체": 
			dto.setB_group("");
			break;
		case "": 
			dto.setB_group("");
			break;
		default:
			dto.setB_group(dto.getB_group().substring(0, 1));
			break;
		}
		switch (dto.getC_group()){
		case "전체": 
			dto.setC_group("");
			break;		
		case "": 
			dto.setC_group("");
			break;
		default:
			dto.setC_group(dto.getC_group().substring(0, 3));
			break;
		}
		
		if (dto.getField().equals("title")) {
			return bookDao.searchBook(dto);
		} else if (dto.getField().equals("author")) {
			return bookDao.searchAuthor(dto);
		} else if (dto.getField().equals("publish")) {
			return bookDao.searchPublisher(dto);
		} else {
			return bookDao.searchBook(dto);
		}
	}

	@Override
	public List<BookModel> listBook(String listType, String datepicker1,
			String datepicker2, String month) {

		Dto dto = new Dto();
		dto.setDate1(datepicker1);
		dto.setDate2(datepicker2);
		dto.setMonth(month);
		switch (listType) {
		case "new":
			return bookDao.newBook(dto);
		case "best":
			return bookDao.bestBook(dto);
		case "recommend":
			return bookDao.recommendBook();
		}
		return bookDao.listBook();
	}

	@Override
	public BookModel selectBook(String bookCode) {
		return bookDao.selectBook(bookCode);
	}

	@Override
	public void deleteBook(String bookCode) {

		bookDao.deleteBook(bookCode);
	}

	@Override
	public void updateBook(BookModel bookmodel) {

		bookDao.updateBook(bookmodel);

	}

	@Override
	public String selectname(String bookCode) {

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
		parameter = parameter + "&" + "maxResults=10";
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
		System.out.println(keyword);
		key = URLEncoder.encode(key, "UTF-8");
		keyword = URLEncoder.encode(keyword, "UTF-8");
		parameter = parameter + "&" + "query=" + keyword;
		parameter = parameter + "&" + "sort=salesPoint";
		parameter = parameter + "&" + "maxResults=100";

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

	@Override
	public List<BookModel> bookList(String listType) {
		return bookDao.listBook();
	}

	@Override
	public List<BookModel> selectBookAll() {

		return bookDao.selectBookAll();
	}

	@Override
	public List<CodeModel> selectBCodeList() {

		return bookDao.selectBCodeList();
	}

	@Override
	public List<CodeModel> selectCCodeList() {

		return bookDao.selectCCodeList();
	}

	public boolean isThisDateValid(String dateToValidate, String dateFromat) {

		if (dateToValidate == null) {
			return false;
		}

		SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
		sdf.setLenient(false);

		try {

			// if not valid, it will throw ParseException
			Date date = sdf.parse(dateToValidate);
			System.out.println(date);

		} catch (ParseException e) {

			e.printStackTrace();
			return false;
		}

		return true;
	}

	@Override
	public void updateDate() {

		List<BookModel> bookList = etcDao.copyDate();

		for (BookModel book : bookList) {
			SimpleDateFormat format = new SimpleDateFormat();
			if (isThisDateValid(book.getRcv_date(), "yyyyMMdd")) {
				etcDao.updateDate(book);
			} else {
				try {
					format.parse(book.getRcv_date());
					etcDao.updateDate(book);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			;
		}
	}

	@Override
	public List<BookModel> selectBookForImage() {
		return etcDao.selectBookForImage();
	}

	@Override
	public void setRecommend(BookModel bookmodel) {
		bookDao.setRecommend(bookmodel);
	}
 

	@Override
	public void uploadFile(MultipartFile file, String tid) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String download(File file, String tid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

 
}