package com.baron.bm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.SmsModel;
import com.baron.member.service.NotifiService;

@Controller
public class NotifyContorller {

	@Autowired
	private NotifiService notifiService;

	/*@RequestMapping("/notifiReser")
	public void NotifiReser(SmsModel sms) {
		notifiService.notifiReser(sms);
	}*/
	
	@RequestMapping("/notifiReser")
	public void NotifiReser(String book_cd) {

		notifiService.notifiReser(book_cd);
	}
}
