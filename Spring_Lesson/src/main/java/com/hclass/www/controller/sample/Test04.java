package com.hclass.www.controller.sample;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.hclass.www.vo.*;

@Controller
public class Test04 {
	
	/**
	 * @author		전은석
	 * @since		2018/11/30
	 * @version		v1.0
	 * @see
	 * 				2018/11/30	- Test04.class 요청 처리함수 작성 : 전은석
	 * 
	 *  이 함수는 /sample/Test04.class 라고 요청이 들어오면 실행되는 함수
	 *  
	 */
	@RequestMapping(value="/sample/Test04.class")
	public void test04(HttpServletRequest req, MemberVO vo) {
		vo.setId("min");
		req.setAttribute("DATA", vo);
		return;
	}
}
