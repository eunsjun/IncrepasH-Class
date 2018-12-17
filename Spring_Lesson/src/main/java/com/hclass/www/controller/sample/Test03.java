package com.hclass.www.controller.sample;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test03 {
/*	
	@RequestMapping("/Test03.class")
	public String test03() {
		return "sample/Test03";
	}
	@RequestMapping("/Test03.class")
	public ModelAndView test03(ModelAndView mv) {
		mv.addObject("mgr", "전은석");
		mv.setViewName("sample/Test03");
		return mv;
	}
 */	
	
	@RequestMapping("/Test03.class")
	public String test03(HttpServletRequest req) {
		req.setAttribute("mgr", "전은석");
		String view = "sample/Test03";
		return view;
	}
}
