package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.service.EtcService;

@Controller
public class EtcController {

	@Autowired
	private EtcService etcService;

	@RequestMapping("/food")
	public String todayFood(Model model) {

		List<String> breakfastList = new ArrayList<String>();
		List<String> lunchList = new ArrayList<String>();
		List<String> dinnerList = new ArrayList<String>();
		breakfastList = etcService.breakfastList();
		lunchList = etcService.lunchList();
		dinnerList = etcService.dinnerList();

		model.addAttribute("List1", breakfastList);
		model.addAttribute("List2", lunchList);
		model.addAttribute("List3", dinnerList);

		return "food";
	}
}
