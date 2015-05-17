package com.baron.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.NotifiDao;
import com.baron.member.model.SmsModel;

@Service
public class NotifiServiceImpl implements NotifiService {

	@Autowired
	private NotifiDao notifiDao;

	@Override
	public void notifiReser(SmsModel sms) {
		// TODO Auto-generated method stub
		notifiDao.notifiReser(sms);
	}

	@Override
	public void notifiReq(SmsModel sms) {
		// TODO Auto-generated method stub
		notifiDao.notifiReq(sms);
	}

	@Override
	public void notifiRent(SmsModel sms) {
		// TODO Auto-generated method stub
		notifiDao.notifiRent(sms);
	}

	@Override
	public void notifiReturn(SmsModel sms) {
		// TODO Auto-generated method stub
		notifiDao.notifiReturn(sms);	
	}
}
