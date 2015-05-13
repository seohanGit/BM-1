package com.baron.bm.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baron.member.model.BoardModel;
import com.baron.member.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

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
		model.addAttribute("board", board );
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
}
