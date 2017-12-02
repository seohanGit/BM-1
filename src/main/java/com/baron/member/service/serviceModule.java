package com.baron.member.service;

import java.util.Calendar;
import java.util.Date;

public class serviceModule {
	public static Date addDays(Date date, int days)
	{
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    cal.add(Calendar.DATE, days); //minus number would decrement the days
	    return cal.getTime();
	} 
	public static Date addMonths(Date date, int months)
	{
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    cal.add(Calendar.MONTH, months);
	    return cal.getTime();
	}
}
