package com.baron.member.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.EtcDao;
import com.baron.member.model.ItDamage;

@Service
public class EtcServiceImpl implements EtcService {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

	@Autowired
	private EtcDao etcdao;

	@Override
	public List<String> dinnerList(String nowDate) {

		return etcdao.dinnerList(nowDate);
	}

	@Override
	public List<String> lunchList(String nowDate) {

		return etcdao.lunchList(nowDate);
	}

	@Override
	public List<String> breakfastList(String nowDate) {

		return etcdao.breakfastList(nowDate);
	}

	@Override
	public List<ItDamage> damageList() {
		return etcdao.itDamageList();
	}

	@Override
	public void endDamage(ItDamage itDamage) { 
		Calendar cal = Calendar.getInstance();
		String nowDate = sdf.format(cal.getTime());
		 
		itDamage.setCtime(nowDate);
		 etcdao.endDamage(itDamage);		
	}

}
