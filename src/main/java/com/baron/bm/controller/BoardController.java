package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.baron.member.model.BoardModel;
import com.baron.member.service.BoardService;

@SessionAttributes({ "kname", "jikb", "team_nm", "permission", "id",
		"chief", "chiefId", "adminMode" })
@Controller
public class BoardController {
	/**
 * 
 */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	@Autowired
	private BoardService boardService;

	@RequestMapping("/board")
	public String board(Model model) {
		List<BoardModel> boardList = boardService.selectBoard();
		model.addAttribute("boardList", boardList);
		return "board/board";
	}

	@RequestMapping("/boardList")
	public String boardList(Model model) {
		List<BoardModel> boardList = boardService.selectBoard();
		model.addAttribute("boardList", boardList);
		return "board/boardList";
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
	public String selectBoardnum(int boardnum, Model model, BoardModel board, HttpServletRequest request) {		
		String id =""; 
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				id = cookie.getValue();
			}
		}		
		board = boardService.selectBoardnum(boardnum); 
		model.addAttribute("id", id);
		model.addAttribute("board", board);
		return "board/modifyBoard";
	}

	@RequestMapping("/modifyBoard")
	public String modifyBoard(BoardModel board) {
		Calendar cal = Calendar.getInstance();
		Date nowDate = cal.getTime();

		board.setModifidate(sdf.format(nowDate));
		boardService.modifyBoard(board);
		return "redirect:board";
	}

	@RequestMapping("/boardsuccess")
	public String boardsuccess(BoardModel model, HttpServletRequest request) {
		Calendar cal = Calendar.getInstance();
		Date nowDate = cal.getTime();

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				model.setId(cookie.getValue());
			}
		}
		model.setModifidate(sdf.format(nowDate));
		model.setBoardType("0");
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
		Calendar cal = Calendar.getInstance();
		Date nowDate = cal.getTime();

		boardmodel.setRegisdate(sdf.format(nowDate));
		boardmodel.setBoardType("1");
		boardmodel.setId("admin");
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
		Calendar cal = Calendar.getInstance();
		Date nowDate = cal.getTime();

		content.setModifidate(sdf.format(nowDate));
		boardService.modifyNotice(content);
		return "redirect:noticeListByAdmin";
	}

}
