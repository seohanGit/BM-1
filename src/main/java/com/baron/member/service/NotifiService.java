package com.baron.member.service;

import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;

public interface NotifiService {

	void notifiReser(String book_cd);

	void notifiReturnConfirm(String book_cd);

	void notifiReq(BookModel book);

	void notifiRent(String book_cd);

	void notifiReturn(SmsModel sms);

	void notifiExtend(SmsModel sms);


}
