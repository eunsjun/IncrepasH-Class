package com.hclass.www.controller.member;

import java.util.ArrayList;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.hclass.www.DAO.*;
import com.hclass.www.services.*;
import com.hclass.www.vo.*;

@RequestMapping("member/")
@Controller
public class Member {
	@Autowired
	MemberDAO mDAO;
	@Autowired
	BoardDAO bDAO;
	@Autowired
	MemberService mSrvc;
	
	@RequestMapping("Login.class")
	public String loginView() {
		String view = "member/login";
		return view;
	}
	
	@RequestMapping("joinView.class")
	public String joinView() {
		String view = "member/join";
		return view;
	}
	
	@RequestMapping("LoginProc.class")
	public ModelAndView loginProc(ModelAndView mv, /*HttpServletRequest req ,*/ HttpSession session, MemberVO mVO) {

		/*
		String view = "board/board";
		
		int cnt = mDAO.loginProc(mVO);
		
		if(cnt == 1) {
			// 이 경우는 아이디와 비밀번호가 같은 회원이 한명 존재한다는 이야기 이므로
			// 정상적으로 로그인 처리를 해줘야겠다.
			// 세션 처리도 여기서 하면 되겠다.
			//HttpSession session = req.getSession();
			session.setAttribute("SID", mVO.getId());
			
			// 게시판 뷰에 넘겨줄 데이터를 다시 만들어서 넘겨주면 될 것이다.
		} else {
			// 회원정보가 틀린경우가 될 것이다.
			view = "member/login";
		}
		 */
		String view = mSrvc.sessionProc(session, mVO);
		ArrayList<BoardVO> list = bDAO.boardAllDao();
		
		// list를  ModelAndView 에 담는다.
		mv.addObject("LIST", list);
		mv.setViewName(view);
		return mv;
	}
	
	@RequestMapping("Logout.class")
	public String logoutProc(HttpSession session) {
		String view ="member/login";
		mSrvc.logout(session);
		return view;
	}
	// 회원 가입 처리 함수
	@RequestMapping("joinProc.class")
	public ModelAndView joinProc(ModelAndView mv, MemberVO mVO) {
		// 이 함수는 회원가입 양식을 작성한 사람이 요청하는 함수이다.
		String view = "board/board";
		
		// 데이터 보내고
		mDAO.insertMember(mVO);
		// 데이터 받고
		
		// 데이터 넘기고
		
		// 뷰 보내고
		mv.setViewName(view);
		return mv;
	}
	
	// 회원정보 뷰 보기 요청
	@RequestMapping("MemberEdit.class")
	public ModelAndView memberInfo(ModelAndView mv, HttpSession session, MemberVO mVO) {
		String view = "member/memberEdit";
		// 할일
		// 세션에서 아이디 얻어오고
		String id = (String) session.getAttribute("SID");
		// 질의 명령 보내서 데이터 가져오고
		mVO = mDAO.selectMbrInfo(id);
		// 데이터 모델에 담고
		mv.addObject("VO", mVO);
		// 뷰를 부른다.
		mv.setViewName(view);
		return mv;
	}
}
