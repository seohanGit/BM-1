/*
 * @(#)ErrorController.java $version 2014. 11. 23.
 *
 * Copyright 2007 NHN Corp. All rights Reserved. 
 * NHN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.baron.bm.controller;

import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author pokbab
 */
@Controller
public class ErrorController {
	
	/**
	 * 오류가 발생하면 실행 web.xml에 정의되어 있음
	 */
	@RequestMapping("/error")
	public String throwException(HttpServletRequest request, HttpServletResponse response, Model model) {
		int statusCode = (int)request.getAttribute("javax.servlet.error.status_code");

		String requestUri = (String)request.getAttribute("javax.servlet.error.request_uri");
		if (requestUri == null) {
			requestUri = "알 수 없는 오류"; //Unknown
		}

		String message;

		if (statusCode == 400) {
			message = MessageFormat.format(ErrorType.ERROR_400.getMessage(), requestUri);
		} else if (statusCode == 403) {
			message = MessageFormat.format(ErrorType.ERROR_403.getMessage(), requestUri);
		} else if (statusCode == 404) {
			message = MessageFormat.format(ErrorType.ERROR_404.getMessage(), requestUri);
		} else if (statusCode == 500) {
			message = MessageFormat.format(ErrorType.ERROR_500.getMessage(), requestUri);
		} else {
			message = MessageFormat.format(ErrorType.ERROR_ELSE.getMessage(), requestUri);
		}

		model.addAttribute("errorMessage", message);
		return "/common/error";
	}
	
	enum ErrorType {
		ERROR_VALIDATION("유효하지 않은 값이 입력되었습니다. 다시 작성해주세요"),
		ERROR_400("원인 : {0}<br/>요청이 실패했습니다. 주소에 오류가 없는지 확인해주세요!"),
		ERROR_403("원인 : {0}<br/>접근이 금지된 페이지입니다"),
		ERROR_404("원인 : {0}<br/>문서를 찾을 수 없습니다. 주소가 정확한지 확인해주세요!"),
		ERROR_500("원인 : {0}<br/>서버에서 요청을 완료하지 못했습니다. 관리자에게 문의해주세요."),
		ERROR_ELSE("원인 : {0}<br/>원인이 파악되지 않은 에러입니다. 다시 시도해보시고 안될 시 관리자에게 문의해 주세요!");
	
		private String message;
		
		private ErrorType(String message) {
			this.message = message;
		}
		
		public String getMessage() {
			return message;
		}
	}
}
