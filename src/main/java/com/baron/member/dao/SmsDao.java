package com.baron.member.dao;

import com.baron.member.model.SmsModel;

public interface SmsDao {

	public void notifiReser(SmsModel sms);

	public void notifiRent(SmsModel sms);

	public void notifiReturn(SmsModel sms);

	
}
