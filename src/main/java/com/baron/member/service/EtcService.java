package com.baron.member.service;

import java.util.List;

import com.baron.member.model.ItDamage;

public interface EtcService {

	public List<String> dinnerList(String nowDate);

	public List<String> lunchList(String nowDate);

	public List<String> breakfastList(String nowDate);

	public List<ItDamage> damageList();

	public void endDamage(ItDamage itDamage);
}
