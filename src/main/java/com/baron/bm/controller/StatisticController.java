package com.baron.bm.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.service.BoardService;
import com.baron.member.service.StatisticService;

@Controller
public class StatisticController {
	@Autowired
	private BoardService boardService;

	@Autowired
	private StatisticService statisticService;
	String year = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));

	@ResponseBody
	@RequestMapping("/countList")
	public String countList() throws Exception {
		List<BookModel> countList = statisticService.selectBookCount();
		String data = "", categories = "";
		for (BookModel bookModel : countList) {
			categories = categories + "," + bookModel.getB_group();
			data = bookModel.getCount() + "," + data;
		}
		data = data.substring(0, data.length() - 1);
		/*
		 * ArrayList<Object> pieDataSet = new ArrayList<Object>();
		 * pieDataSet.add(piedata1); pieDataSet.add(piedata2);
		 * pieDataSet.add(piedata3);
		 */
		return data;
	}

	@RequestMapping("/statistic")
	public String statistic(Model model) throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth("");
		List<Dto> bestPerson = statisticService.selectBestPerson(param);
		model.addAttribute("bestPerson", bestPerson);

		return "statistic/statistic";
	}

	@RequestMapping("/rentByPerson")
	public String rentByPerson(Model model, String year, String month)
			throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		List<Dto> bestPerson = statisticService.selectBestPerson(param);
		model.addAttribute("bestPerson", bestPerson);
		return "/statistic/rentByPerson";
	}

	@RequestMapping("/bookCount")
	public String bookCount(String year, Model model) throws Exception {
		List<BookModel> bookCount = statisticService.selectBookCount();
		model.addAttribute("bookCount", bookCount);
		return "/statistic/bookCount";
	}

	@RequestMapping("/teamCount")
	public String teamCount(String year, Model model) throws Exception {
		List<MemberModel> teamCount = statisticService.selectBestTeam(year);
		model.addAttribute("teamCount", teamCount);
		return "/statistic/teamCount";
	}

	@RequestMapping("/selectSumPurchase")
	public String selectSumPurchase(String year, Model model) {
		Dto dto = new Dto();
		dto.setYear(year);
		List<Dto> SumPurchase = new ArrayList<Dto>();
		SumPurchase = statisticService.selectSumPurchase(dto);

		model.addAttribute("SumPurchase", SumPurchase);
		return "/statistic/purchaseByMonth";
	}

	@RequestMapping("/rentByMonth")
	public String rentByMonth(String year, String month, Model model) {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		List<Dto> rentByMonth = statisticService.rentByMonth(param);
		model.addAttribute("rentByMonth", rentByMonth);
		return "/statistic/rentByMonth";
	}

	
	@RequestMapping("/rankGroupByB")
	public String selectGroupByB(String year, String month, Model model)
			throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		List<Dto> selectGroupByB = statisticService.selectGroupByB(param);
		model.addAttribute("rankGroupByB", selectGroupByB);
		return "/statistic/rankGroupByB";
	}

	@RequestMapping("/rankGroupByBook")
	public String selectGroupByBook(String year, String month, Model model)
			throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		List<BookModel> bestBook = statisticService.selectBestBook(param);
		model.addAttribute("bestBook", bestBook);
		return "/statistic/rankGroupByBook";
	}

}
