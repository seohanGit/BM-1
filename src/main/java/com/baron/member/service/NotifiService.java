package com.baron.member.service;

import com.baron.member.model.SmsModel;

public interface NotifiService {

	void notifiReser(SmsModel sms);

	void notifiReq(SmsModel sms);

	void notifiRent(SmsModel sms);

	void notifiReturn(SmsModel sms);
}
