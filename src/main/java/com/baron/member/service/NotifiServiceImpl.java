package com.baron.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.dao.JoinDao;
import com.baron.member.dao.NotifiDao;
import com.baron.member.dao.RentDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;

@Service
public class NotifiServiceImpl implements NotifiService {

	@Autowired
	private NotifiDao notifiDao;

	@Autowired
	private RentDao rentDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private JoinDao joinDao;

	@Override
	public void notifiReser(String book_cd) {
		SmsModel sms = new SmsModel();

		BookModel book = rentDao.selectReservation(book_cd);
		String title = rentDao.selectBook(book_cd).getTitle();
		String mobi_no = book.getMobi_no().substring(1);

		sms.setPhone(mobi_no);
		sms.setTitle(title);

		notifiDao.notifiReser(sms);
	}

	@Override
	public void notifiReq(SmsModel sms) { 
		notifiDao.notifiReq(sms);
	}

	@Override
	public void notifiRent(String book_cd) {
		SmsModel sms = new SmsModel();
		BookModel book = rentDao.selectRent(book_cd);
		String title = bookDao.selectBook(book_cd).getTitle();
		String mobi_no = book.getMobi_no().substring(1);
		sms.setPhone(mobi_no);
		sms.setTitle(title);
		notifiDao.notifiRent(sms);
	}

	@Override
	public void notifiReturn(SmsModel sms) { 
		notifiDao.notifiReturn(sms);
	}

	@Override
	public void notifiReturnConfirm(String book_cd)  {
		SmsModel sms = new SmsModel();		
		BookModel book = rentDao.selectRent(book_cd);
		String title = bookDao.selectBook(book_cd).getTitle();
		sms.setTitle(title);
		sms.setPhone("");
		if(book.getMobi_no().length()>0){
			sms.setPhone(book.getMobi_no().substring(1));
		}
		
		notifiDao.notifiReturnConfirm(sms);

	}

	@Override
	public void notifiExtend(SmsModel sms) {
		notifiDao.notifiExtend(sms);
	}
}
