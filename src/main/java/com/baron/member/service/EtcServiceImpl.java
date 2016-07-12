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
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	String nowDate = sdf.format(cal.getTime());

	@Autowired
	private EtcDao etcdao;

	@Override
	public List<String> dinnerList() {

		return etcdao.dinnerList();
	}

	@Override
	public List<String> lunchList() {

		return etcdao.lunchList();
	}

	@Override
	public List<String> breakfastList() {

		return etcdao.breakfastList();
	}

	@Override
	public List<ItDamage> damageList() {
		return etcdao.itDamageList();
	}

	@Override
	public void endDamage(ItDamage itDamage) {
		itDamage.setCtime(nowDate);
		 etcdao.endDamage(itDamage);		
	}

}
