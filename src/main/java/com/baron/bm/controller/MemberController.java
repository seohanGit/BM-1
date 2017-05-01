/*
 * @(#)SampleController.java $version 2014. 11. 3.
 *
 * Copyright 2007 NHN Corp. All rights Reserved. 
 * NHN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.baron.bm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.baron.member.model.BoardModel;
import com.baron.member.model.BookModel;
import com.baron.member.model.Dto;
import com.baron.member.model.MemberModel;
import com.baron.member.model.SearchResult;
import com.baron.member.service.BoardService;
import com.baron.member.service.BookService;
import com.baron.member.service.JoinService;
import com.baron.member.service.StatisticService;

@SessionAttributes({ "kname", "jikb", "team_nm", "permission", "id", "chief", "chiefId", "adminMode" })
@Controller
public class MemberController {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	@Autowired
	private JoinService joinService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private StatisticService statisticService;

	String year = Integer.toString(Calendar.getInstance().get(Calendar.YEAR)); 
	String month = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH)+1);
	
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
	public String index(Model model, HttpSession session) throws Exception {
		session.setAttribute("adminMode", "user");
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		param.setField("title");
		param.setKeyword(""); 
		List<BoardModel> notice = boardService.noticeList();
		List<BookModel> bestBook = bookService.listBook("recommend", "", "", "");
		List<MemberModel> bestTeam = statisticService.selectBestTeam(year);
		List<BookModel> newBook = statisticService.getNewbook();
		List<BookModel> bookList = bookService.searchBook(param);
		
		model.addAttribute("bookList", bookList);
		String permission = "";
		model.addAttribute("noticeList", notice);
		model.addAttribute("bestBook", bestBook);
		model.addAttribute("bestTeam", bestTeam);
		model.addAttribute("newBook", newBook);
		return "index";
	}

	@RequestMapping("/")
	public String loginForm(String id) {

		return "start";
	}

//	@RequestMapping("/login")
//	public ModelAndView login(HttpServletResponse response, MemberModel model) {
//
//		// LDAP Context
//		String url = "LDAP://iseohan.com:389";
//		Hashtable<String, String> env = new Hashtable<String, String>();
//		env.put(Context.INITIAL_CONTEXT_FACTORY,
//				"com.sun.jndi.ldap.LdapCtxFactory");
//		env.put(Context.PROVIDER_URL, url);
//		env.put(Context.SECURITY_AUTHENTICATION, "none");
//
//		env.put(Context.SECURITY_PRINCIPAL, model.getId());
//		env.put(Context.SECURITY_CREDENTIALS, model.getPassword());
//
//		try {
//			DirContext ctx = new InitialDirContext(env);
//			Object obj = new Object();
//			// want to print all users from the LDAP server
//			System.out.println(obj.toString());
//			ctx.close();
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//
//		ModelAndView mav = new ModelAndView("/member/loginResult");
//		joinService.login(model.getId());
//
//		String info = model.getTeam_nm() + model.getJikb() + model.getKname();
//		mav.addObject("info", info);
//		mav.addObject("permission", model.getPermission());
//		return mav;
//	}

	// 서한 주소용 서버
	// MEMBER TABLE (사번, 권한) 에서 사번, 권한 대조 후 로그인
	// login?id="id"

	@RequestMapping("/autologin")
	public ModelAndView login2(HttpServletResponse response,
			HttpServletRequest request, HttpSession session, ModelAndView mav, String id) {
		String adminchk = ""; 
		
		MemberModel membermodel = new MemberModel();
		membermodel.setId(id);
		membermodel.setServiceName("공통20_연구소통합관리메뉴");
		membermodel = joinService.login(membermodel) ;
		
		if (membermodel.getKname() == null) {
			mav.setViewName("/member/loginfail");
		} else {	
			membermodel.setId(id);			
			mav.addObject("kname", membermodel.getKname());
			mav.addObject("team_nm", membermodel.getTeam_nm());
			mav.addObject("jikb", membermodel.getJikb());
			mav.addObject("chief", membermodel.getChief());
			mav.addObject("chiefId", membermodel.getChiefid());
			mav.addObject("id", membermodel.getId());
			adminchk = membermodel.getAdminChk();
			
			session.setAttribute("id", membermodel.getId());
			session.setAttribute("chief", membermodel.getChief());
			session.setAttribute("chiefId", membermodel.getChiefid());
			session.setAttribute("adminMode", "user"); 
			 
			if (adminchk.equals("Y")) {
				response.addCookie(new Cookie("bm_id", id));
				response.addCookie(new Cookie("bm_permission", "1"));
				session.setAttribute("adminMode", "admin"); 
				mav.setViewName("redirect:index");

				mav.addObject("permission", "1");
				System.out.println();
				return mav;
			} else {
				response.addCookie(new Cookie("bm_id", id));
				response.addCookie(new Cookie("bm_permission", "0"));
				mav.setViewName("redirect:index");

				mav.addObject("permission", "0");

			}
			
		}
		return mav;

	}

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
   
	@RequestMapping("/admin")
	public String admin(HttpServletRequest request, HttpSession session, Model model)
			throws Exception {
		Dto param = new Dto();
		param.setYear(year);
		param.setMonth(month);
		session.setAttribute("adminMode", "admin");
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("bm_permission")) { 
				if ( cookie.getValue().equals("1")) {

					List<Dto> bestMember = statisticService
							.selectBestPerson(param);
					List<BookModel> bestBook = statisticService
							.selectBestBook(param);
					List<MemberModel> bestTeam = statisticService
							.selectBestTeam(year);

					model.addAttribute("bestMember", bestMember);
					model.addAttribute("bestBook", bestBook);
					model.addAttribute("bestTeam", bestTeam);

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

	@RequestMapping("/memberList")
	public String memberList(Model model) {
		Calendar cal =  Calendar.getInstance();
		String nowDate = sdf.format(cal.getTime());
		cal.add(cal.MONTH, -1);
		String rentdate = sdf.format(cal);
		List<MemberModel> memberList = joinService.memberList(rentdate);
		model.addAttribute("memberList", memberList);
		return "/member/memberList";
	}

	@RequestMapping("/start")
	public String start() {
		return "start";
	}

	@RequestMapping("/startAdmin")
	public String startAdmin() {
		return "startAdmin";
	}

}
