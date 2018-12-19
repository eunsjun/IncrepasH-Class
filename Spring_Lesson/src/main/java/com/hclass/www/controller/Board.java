package com.hclass.www.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.hclass.www.DAO.*;
import com.hclass.www.vo.*;

@Controller
@RequestMapping("board/")
public class Board {
	@Autowired
	BoardDAO bDAO;
	
	// 게시판 글쓰기 폼 요청 함수
	@RequestMapping("BoardWriteForm.class")
	public ModelAndView boardWriteForm(HttpSession session, ModelAndView mv) {
		String view = "board/BoardWriteForm";
		String sid = (String) session.getAttribute("SID");
		if(sid == null || sid.length() == 0) {
			view = "board/board";
			
			ArrayList<BoardVO> list = bDAO.boardAllDao();
			mv.addObject("LIST", list);
		}
		
		mv.setViewName(view);
		return mv;
	}
	
	// 게시판 상세보기 요청 함수
	@RequestMapping("BoardView.class")
	public ModelAndView boardView(ModelAndView mv, BoardVO bVO) {
		String view = "board/BoardView";
		// 할일 
		// 데이터 받고
		int bno = bVO.getNo();
		// 데이터 만들고
		HashMap map = bDAO.boardDetail(bno);
		// 데이터 보내고
		mv.addObject("DATA", map);
		// 뷰 호출하고
		mv.setViewName(view);
		return mv;
	}
	
	// 게시판 글 수정 폼 요청
	@RequestMapping("BoardEdit.class")
	public ModelAndView boardEditView(ModelAndView mv, BoardVO bVO, HttpServletRequest req) {
		String view = "board/BoardEdit";
		// 할일
		// 데이터 받고
		String sno = req.getParameter("no");
		int bno = Integer.parseInt(sno);
		// 데이터 만들고
		bVO = bDAO.boardBno(bno);
		// 데이터 보내고
		mv.addObject("DATA", bVO);
		// 뷰 부르고
		mv.setViewName(view);
		return mv;
	}
}
