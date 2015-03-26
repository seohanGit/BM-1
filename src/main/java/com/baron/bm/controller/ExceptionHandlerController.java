/*
 * @(#)ExceptionHandlerController.java $version 2014. 11. 23.
 *
 * Copyright 2007 NHN Corp. All rights Reserved. 
 * NHN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.baron.bm.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author pokbab
 */
@ControllerAdvice
public class ExceptionHandlerController {
	
	@ExceptionHandler(BindException.class)
	public ModelAndView handleException(BindException error, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/common/backScript");
		mav.addObject("errorMessage", error.getFieldError().getDefaultMessage());
		return mav;
	}
}
