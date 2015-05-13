package com.baron.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baron.member.dao.EtcDao;

@Service
public class EtcServiceImpl implements EtcService {

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

}
