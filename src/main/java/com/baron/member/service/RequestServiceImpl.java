package com.baron.member.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.dao.JoinDao;
import com.baron.member.dao.NotifiDao;
import com.baron.member.dao.RequestDao;
import com.baron.member.dao.SmsDao;
import com.baron.member.model.ApprovalModel;
import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SmsModel;

@Service
public class RequestServiceImpl implements RequestService {
	Calendar cal =  Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");	
	String nowDate = sdf.format(cal.getTime());
	
	@Autowired
	private RequestDao requestDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private SmsDao smsDao;

	@Autowired
	private JoinDao joinDao;

	@Autowired
	NotifiDao notifiDao;

	@Override
	public List<BookModel> requestList() { 
//		cal.add(cal.MONTH, -1);
//		String monthago = sdf.format(cal.getTime());
		return requestDao.requestList();
	}

	@Override
	public void deleteRequest(BookModel model) {
		requestDao.deleteRequest(model);
	}

	@Override
	public void requestBook(BookModel model  ) {
		ApprovalModel approval = new ApprovalModel(); 
		Calendar cal =  Calendar.getInstance();
		
		MemberModel member = new MemberModel();
		String nowDate = sdf.format(cal.getTime());  		
		int max = selectMaxSer();
		String maxser = String.format("%03d",max);

		member = joinDao.selectMember(model.getId()); 
		member.setId(model.getId());
		
		model.setB_group(model.getB_group().trim());
		model.setC_group(model.getC_group().trim());
		model.setReqdate(nowDate);
		model.setKname(model.getKname().trim());
		model.setBook_cd(model.getB_group().substring(0, 1)
				+ model.getC_group().substring(0, 3) + "-");
		model.setReq_cd(maxser);
		model.setReqstatus("0");
		
		if (model.getPrice() > 100000){
			approval.setCompanyGroup(member.getCo_gb());
			approval.setTableName("BOOKREQ");
			approval.setDocumentId(model.getReqdate() + "-" + model.getReq_cd());
			approval.setChiefId(member.getChiefid());
			approval.setDescription1("[도서구매신청]");
			approval.setDescription2(model.getReason());
			approval.setNowDate(nowDate);
			approval.setId(member.getId());			
			requestDao.approveChief(approval);
			
			model.setReqstatus("3");
		} 
		requestDao.requestBook(model);
		
	}

	@Override
	public void confirmBuy(BookModel model) {
		SmsModel sms = new SmsModel();
		String mobi_no = joinDao.selectMember(model.getId()).getMobi_no()
				.substring(1);

		sms.setTitle(model.getTitle());
		sms.setPhone(mobi_no);
		model.setB_group(model.getB_group().trim());
		model.setC_group(model.getC_group().trim());
		model.setBook_cd(model.getB_group().substring(0, 1)
				+ model.getC_group().substring(0, 3) + "-" + model.getBook_cd());
		

		if (bookDao.selectBook(model.getBook_cd()) == null) {
			if (model.getQuantity() > 1) {
				for (int i = 0; i < model.getQuantity(); i++) {
					model.setBook_cd(model.getBook_cd().substring(0, 8));
					model.setBook_cd(model.getBook_cd() + "(" + (i + 1) + ")"); 

					bookDao.insertBook(model);
				}

			} else {
				bookDao.insertBook(model);
			}
			notifiDao.notifiReq(sms);
		}
	}

	@Override
	public BookModel selectBook(BookModel book) {
		return requestDao.selectBook(book);

	}

	@Override
	public List<BookModel> requestRecord(String id) { 
		return requestDao.requestRecord(id);
	}

	@Override
	public void modifiBook(BookModel book) {
		requestDao.modifiBook(book);
	}

	@Override
	public void rejectRequest(BookModel book) {
		requestDao.rejectRequest(book);

	}

	@Override
	public String selectB_code(String b_group) {
		return requestDao.selectB_code(b_group);
	}

	@Override
	public String selectC_code(String c_group) {
		return requestDao.selectC_code(c_group);
	}

	@Override
	public int selectMaxSer() {
		return requestDao.selectMaxSer();
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
 
}
