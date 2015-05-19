package com.baron.member.dao;

import com.baron.member.model.SmsModel;

public interface NotifiDao {
	void notifiRent(SmsModel sms);

	void notifiReturn(SmsModel sms);

	void notifiReq(SmsModel sms);

	void notifiReser(SmsModel sms);

	void notifiExtend(SmsModel sms);


	void notifiReturnConfirm(SmsModel sms);
}
