package com.baron.member.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baron.member.model.SmsModel;

@Repository
public class NotifiDaoImpl implements NotifiDao {

	private static final String NAMESPACE = "com.baron.member.smsModel.";

	@Autowired
	@Resource(name="smsSession")
	private SqlSession smsSession;

	@Override
	public void notifiRent(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiRent", sms);
	}

	@Override
	public void notifiReturn(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiReturn", sms);

	}

	@Override
	public void notifiReser(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiReser", sms);
	}

	@Override
	public void notifiReq(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiReq", sms);

	}

	@Override
	public void notifiReturnConfirm(SmsModel sms) {
		smsSession.insert(NAMESPACE + "returnConfirm", sms);
		
	}

	@Override
	public void notifiExtend(SmsModel sms) {
		smsSession.insert(NAMESPACE + "notifiExtend", sms);
		
	}
}
