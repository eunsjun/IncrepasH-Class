package com.hclass.www.services;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;

import com.hclass.www.DAO.MemberDAO;
import com.hclass.www.vo.*;

public class MemberService {
	@Autowired
	MemberDAO mDAO;
	
	public String sessionProc(HttpSession session, MemberVO mVO) {
		String view = "board/board";
		
		int cnt = mDAO.loginProc(mVO);
		
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
		} else {
			view = "member/login";
		}
		return view;
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
