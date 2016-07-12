package com.baron.member.service;

import java.util.List;

import com.baron.member.model.ItDamage;

public interface EtcService {

	public List<String> dinnerList();

	public List<String> lunchList();

	public List<String> breakfastList();

	public List<ItDamage> damageList();

	public void endDamage(ItDamage itDamage);
}
