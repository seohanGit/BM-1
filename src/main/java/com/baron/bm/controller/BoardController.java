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
		List<BoardModel> boardList =boardService.selectBoard();
		model.addAttribute("boardList", boardList);
		return "board";
	}
	
	@RequestMapping("/boardwrite")
	public String writeboard(){
		return "boardinsert";
	}
	
	@RequestMapping("/boardsuccess")
	public String boardsuccess(BoardModel model,HttpServletRequest request){
		
		for(Cookie cookie: request.getCookies()){
			if(cookie.getName().equals("bm_id")){
				model.setId(cookie.getValue());
			}
		}
		boardService.insertBoard(model);
		return "boardsuccess";
	}
	
	@RequestMapping("/selectboard")
	public String selectboard(String per,Model model){
		if(per.equals("register")){
			List<BoardModel> boardList= boardService.selectBoardregister();
			model.addAttribute("boardList",boardList);
			
		}
		else if(per.equals("title")){
			List<BoardModel> boardList=boardService.selecBoardtitle();
			model.addAttribute("boardList",boardList);
		}
		
		return "selectboard";
			
	}
}
