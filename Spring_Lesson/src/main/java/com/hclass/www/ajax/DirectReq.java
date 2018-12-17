package com.hclass.www.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hclass.www.DAO.MemberDAO;

@Controller
public class DirectReq extends HttpServlet {
	@Autowired
	MemberDAO mDAO;
	
	// 아이디 조회 요청 처리 함수
	@RequestMapping("member/IDCheck.class")
	public void idCheck(HttpServletRequest req, HttpServletResponse resp) {
		String sid = req.getParameter("id");
		int cnt = mDAO.countID(sid);
		PrintWriter pwr = null;
		try {
			pwr = resp.getWriter();
			pwr.print(cnt);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
