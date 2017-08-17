package com.baron.member.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.BookDao;
import com.baron.member.dao.JoinDao;
import com.baron.member.dao.NotifiDao;
import com.baron.member.dao.RentDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SmsModel;

@Service
public class NotifiServiceImpl implements NotifiService {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
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
		sms.setTitle(title);

		notifiDao.notifiReser(sms);
	}

	@Override
	public void notifiReq(BookModel book) { 
		SmsModel sms = new SmsModel();		
		MemberModel member = joinDao.selectMember(book.getId());
				
		sms.setPhone(member.getMobi_no().substring(1));
		sms.setTitle(book.getTitle());		
		notifiDao.notifiReq(sms);
	}

	@Override
	public void notifiRent(String book_cd) {
		SmsModel sms = new SmsModel();
		BookModel book = rentDao.selectRent(book_cd);
		MemberModel member = joinDao.selectMember(book.getId());
				
		sms.setPhone(member.getMobi_no().substring(1));
		sms.setTitle(book.getTitle());
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
		MemberModel member = joinDao.selectMember(book.getId()); 
		
		sms.setTitle(book.getTitle());  
		sms.setPhone(member.getMobi_no().substring(1)); 
		notifiDao.notifiReturnConfirm(sms);

	}

	@Override
	public void notifiExtend(SmsModel sms) {
		notifiDao.notifiExtend(sms);
	}
}
