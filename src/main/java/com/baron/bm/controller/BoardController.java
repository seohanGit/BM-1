package com.baron.bm.controller;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baron.member.model.BoardModel;
import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.service.BoardService;
import com.baron.member.service.StatisticService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private StatisticService statisticService;
	String year = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));

	@RequestMapping("/board")
	public String board(Model model) {
		List<BoardModel> boardList = boardService.selectBoard();
		model.addAttribute("boardList", boardList);
		return "board/board";
	}

	@RequestMapping("/boardwrite")
	public String writeboard() {
		return "board/boardinsert";
	}

	@RequestMapping("/deleteBoard")
	public String deleteboard(int boardnum) {
		boardService.deleteBoard(boardnum);
		return "redirect:boardList";
	}

	@RequestMapping("/selectBoardnum")
	public String selectBoardnum(int boardnum, Model model, BoardModel board) {
		board = boardService.selectBoardnum(boardnum);
		model.addAttribute("board", board);
		return "board/modifyBoard";
	}

	@RequestMapping("/modifyBoard")
	public String modifyBoard(BoardModel board) {
		boardService.modifyBoard(board);

		return "redirect:boardList";
	}

	@RequestMapping("/boardsuccess")
	public String boardsuccess(BoardModel model, HttpServletRequest request) {

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				model.setId(cookie.getValue());
			}
		}
		boardService.insertBoard(model);
		return "board/boardsuccess";
	}

	@RequestMapping("/selectboard")
	public String selectboard(String per, Model model) {
		if (per.equals("register")) {
			List<BoardModel> boardList = boardService.selectBoardregister();
			model.addAttribute("boardList", boardList);

		} else if (per.equals("title")) {
			List<BoardModel> boardList = boardService.selecBoardtitle();
			model.addAttribute("boardList", boardList);
		}
		return "board/selectboard";
	}

	@RequestMapping("/boardList")
	public String boardList(Model model) {
		List<BoardModel> boardList = boardService.selectBoard();
		model.addAttribute("boardList", boardList);
		return "board/boardList";
	}

	@RequestMapping("/noticeListByAdmin")
	public String noticeListByAdmin(Model model) {
		List<BoardModel> noticeList = boardService.noticeList();

		model.addAttribute("noticeList", noticeList);

		return "board/noticeListByAdmin";

	}

	@RequestMapping("/noticeList")
	public String noticeList(Model model) {
		List<BoardModel> noticeList = boardService.noticeList();

		model.addAttribute("noticeList", noticeList);

		return "board/noticeList";

	}

	@RequestMapping("/writeNotice")
	public String writeNotice() {
		return "board/insertNotice";
	}

	@RequestMapping("/insertNotice")
	public String insertNotice(BoardModel boardmodel) {
		boardService.insertNotice(boardmodel);
		return "redirect:noticeListByAdmin";
	}

	@RequestMapping("/deleteNotice")
	public String deleteNotice(int boardnum) {
		boardService.deleteNotice(boardnum);
		return "redirect:noticeListByAdmin";
	}

	@RequestMapping("/modifyNotice")
	public String modifyNotice(BoardModel content) {
		boardService.modifyNotice(content);
		return "redirect:noticeListByAdmin";
	}

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
	public String statistic(Model model)
			throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth("");
		List<Dto> bestPerson = statisticService.selectBestPerson(param);
		model.addAttribute("bestPerson", bestPerson);

		return "statistic/statistic";
	}

	@RequestMapping("/rentByPerson")
	public String rentByPerson(Model model, String year, String month) throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		List<Dto> bestPerson = statisticService.selectBestPerson(param);
		model.addAttribute("bestPerson", bestPerson);
		return "/statistic/rentByPerson";
	}

	@RequestMapping("/bookTeamCount")
	public String bookCount(String year, Model model) throws Exception {
		List<BookModel> bookCount = statisticService.selectBookCount();
		model.addAttribute("bookCount", bookCount);
		List<MemberModel> teamCount = statisticService.selectBestTeam(year);
		model.addAttribute("teamCount", teamCount);
		return "/statistic/bookTeamCount";
	}

	@RequestMapping("/selectSumPurchase")
	public String selectSumPurchase(String year, Model model) {
		Dto dto = new Dto();
		List<Dto> SumPurchase = new ArrayList<Dto>();
		for (int i = 0; i < 11; i++) {
			dto.setMonth(Integer.toString(i));
			dto.setCount("0");
			SumPurchase.add(i, dto);
			int last = statisticService.selectSumPurchase(year).lastIndexOf(
					statisticService.selectSumPurchase(year).get(i));
			if (last == i) {
				break;
			} else if (statisticService.selectSumPurchase(year).get(i)
					.getMonth() != null) {
				SumPurchase.add(i, statisticService.selectSumPurchase(year)
						.get(i));
			}
		}
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

	@RequestMapping("/selectGroupByB")
	public String selectGroupByB(String year, String month, Model model)
			throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		List<BookModel> bestBook = statisticService.selectBestBook(param);
		model.addAttribute("bestBook", bestBook);
		List<Dto> selectGroupByB = statisticService.selectGroupByB(param);
		model.addAttribute("selectGroupByB", selectGroupByB);
		return "/statistic/rentByB_group";
	}
}
