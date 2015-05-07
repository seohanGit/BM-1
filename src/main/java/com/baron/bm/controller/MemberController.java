/*
 * @(#)SampleController.java $version 2014. 11. 3.
 *
 * Copyright 2007 NHN Corp. All rights Reserved. 
 * NHN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.baron.bm.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.baron.member.model.BoardModel;
import com.baron.member.model.BookModel;
import com.baron.member.model.ContentModel;
import com.baron.member.model.MemberModel;
import com.baron.member.service.BoardService;
import com.baron.member.service.BookService;
import com.baron.member.service.JoinService;

@Controller
public class MemberController {

	@Autowired
	private JoinService joinService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BoardService boardService;

	@RequestMapping("/test")
	public String test(Model model) {
		System.out.println(joinService.test());
		List<String> team = joinService.test();
		List<BookModel> bookList = bookService.selectBookAll();
		model.addAttribute("bookList", bookList);
		model.addAttribute("team", team);
		return "test";

	}

	@RequestMapping("/index")
	public String index(Model model) throws Exception {

		List<BoardModel> notice = boardService.noticeList();
		// List<MemberModel> bestList = joinService.selectBest();
		// List<BookModel> newBook = bookService.getNewbook();
		// List<BookModel> bestSeller = bookService.getBestSeller();

		model.addAttribute("noticeList", notice);
		// model.addAttribute("bestList", bestList);

		// model.addAttribute("bestseller", bestSeller);
		// model.addAttribute("newbook", newBook);
		return "index";
	}

	@RequestMapping("/")
	public String loginForm() {
		return "/member/login";
	}

	
	 @RequestMapping("/login") public ModelAndView login(HttpServletResponse
	  response, MemberModel model) {
	  
	  ModelAndView mav = new ModelAndView("/member/loginResult"); model =
	  joinService.login(model); if (model != null) {
	  System.out.println(model.getId() + model.getPermission());
	  response.addCookie(new Cookie("bm_id", model.getId()));
	  System.out.println(model.getId() + "login Success");
	  
	  response.addCookie(new Cookie("bm_permission", model .getPermission()));
	  mav.addObject("result", true); } else { mav.addObject("result", false); }
	  return mav; }
	 
	// 서한 주소용 서버
	// MEMBER TABLE (사번, 권한) 에서 사번, 권한 대조 후 로그인
	/*
	 @RequestMapping("/login")
	public String login2(HttpServletResponse response, String id) {

		// ModelAndView mav = new ModelAndView("/index");
		System.out.println(id);
		if (id != null) {
			response.addCookie(new Cookie("bm_id", id));
			System.out.println(id + "login Success");
			if (id.equals("4150149")) {

				response.addCookie(new Cookie("bm_permission", "1"));
			} else {
				response.addCookie(new Cookie("bm_permission", "0"));
			}

		}
		return "redirect:index";
	}
	*/

	@RequestMapping("/logout")
	// 쿠키 삭제
	public String logout(HttpServletRequest request, MemberModel model,
			HttpServletResponse response) {

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				cookie.setMaxAge(0);
				model.setId("0");
				response.addCookie(new Cookie("bm_id", model.getId()));
			} else if (cookie.getName().equals("bm_permission")) {
				cookie.setMaxAge(0);
				model.setPermission("0");
				response.addCookie(new Cookie("bm_permission", model
						.getPermission()));
			}
		}
		return "/member/logout";
	}

	@RequestMapping("/identify")
	public String identify() {

		return "/member/identify";
	}

	@RequestMapping("/joinForm")
	public String joinForm() {
		return "/member/join";
	}

	@RequestMapping("/join")
	public String join(@Valid MemberModel memberModel) throws Exception {
		if (joinService.selectMemberById(memberModel.getId()) == 0) {
			joinService.join(memberModel);
			return "/member/joinSuccess";
		} else
			return "/member/joinFail";
	}

	@RequestMapping("/modify")
	public String modifyidentity(String password, HttpServletRequest request,
			Model model) {
		String pass = null;

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				System.out.println(cookie.getValue() + "modify");
				pass = joinService.identify(cookie.getValue());
				MemberModel memberModel = new MemberModel();
				memberModel.setId(cookie.getValue());
				memberModel.setPassword(pass);
				memberModel = joinService.login(memberModel);
				model.addAttribute("Member", memberModel);
			}
		}

		return (pass.equals(password)) ? "/member/modifyidentity"
				: "/member/identifyfail";
	}

	@RequestMapping("/modifySuccess")
	public String modifySuccess(@Valid MemberModel model,
			HttpServletRequest request) {

		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_id")) {
				model.setId(cookie.getValue());
			}
		}

		joinService.updateMember(model);

		return "/member/modifySuccess";
	}

	@RequestMapping("/admin")
	public String admin(HttpServletRequest request, Model model)
			throws Exception {
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) {
				System.out.println(cookie.getValue());
				if ("1".equals(cookie.getValue())) {

					/*
					 * List<MemberModel> memberList = joinService.selectBest();
					 * List<BookModel> bestSeller = bookService.getBestSeller();
					 * List<BookModel> newBook = bookService.getNewbook();
					 * 
					 * model.addAttribute("bestList", memberList);
					 * model.addAttribute("bestseller", bestSeller);
					 * model.addAttribute("newbook", newBook);
					 */
					return "/member/admin";
				} else
					return "/member/adminfail";
			}
		}
		return null;
	}

	@RequestMapping("/adminfail")
	public String adminfail() {
		return "/member/adminfail";
	}

	@RequestMapping("/searchLate")
	public String searchLate(Model model) {
		List<MemberModel> memberList = joinService.selectLate();
		model.addAttribute("lateList", memberList);
		return "/member/late";
	}

	@RequestMapping("/memberList")
	public String memberList(Model model) {
		List<MemberModel> memberList = joinService.memberList();
		model.addAttribute("memberList", memberList);
		return "/member/memberList";
	}

}
