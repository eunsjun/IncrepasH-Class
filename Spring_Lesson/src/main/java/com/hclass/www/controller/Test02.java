package com.hclass.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class Test02 {
/*	
 * @RequestMapping("/Test/Test02.class")
	public void test02() {
		
		return;
	}
*/
	@RequestMapping(path= {"/Test/Test02.class", "/Test.home"})
	public void test02() {
		return;
	}
	
	@RequestMapping(value="/board/BoardWriteProc.class", method=RequestMethod.POST)
	public void getU() {
		
		return ;
	}
}
