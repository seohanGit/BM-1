package com.baron.member.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.baron.member.dao.JoinDao;
import com.baron.member.dao.NotifiDao;
import com.baron.member.dao.RentDao;
import com.baron.member.dao.SmsDao;
import com.baron.member.model.BookModel;
import com.baron.member.model.SmsModel;

@Service
public class ReportingServiceImpl implements ReportingService {
	private static final Logger logger = Logger
			.getLogger(ReportingServiceImpl.class);

	@Autowired
	private JoinDao joinDao;

	@Autowired
	private RentDao rentDao;
	
	@Autowired
	private SmsDao smsDao;

	@Autowired
	private NotifiDao notifiDao;

	Calendar cal = java.util.Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	@Override
	// Every night at 1 AM
	@Scheduled(cron = "0 0 11 * 1-5 ?")
	public void generateAndEmailReport() {
		logger.info("Starting report at "
				+ new Date(System.currentTimeMillis()));

		List<BookModel> rentList = rentDao.rentListAll();
		for (BookModel bookModel : rentList) {
			cal.add(Calendar.DATE, 5);
			
			System.out.println(bookModel.getReturndate());
			System.out.println(cal.getTime());
			if (sdf.format(cal.getTime()) == bookModel.getReturndate()) {
				System.out.println(bookModel.getReturndate());
				System.out.println(cal.getTime());
				// TEST
				SmsModel sms = new SmsModel();
				String Cell = joinDao.selectMember(bookModel.getId())
						.getMobi_no().substring(1);
				sms.setTitle(bookModel.getTitle());
				sms.setPhone(Cell);
				System.out.println(Cell);
				smsDao.notifiReturn(sms);
				notifiDao.notifiReturn(sms);
			}

		}

		
		
		logger.info("Report sent at " + new Date(System.currentTimeMillis()));
	}
}
