package com.hclass.www.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.hclass.www.DAO.*;
import com.hclass.www.services.*;
import com.hclass.www.vo.*;

@Controller
@RequestMapping("board/")
public class Board {
	@Autowired
	BoardDAO bDAO;
	@Autowired
	BoardService bSrvc;
	
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
	
	// 게시판 글등록 요청 처리함수
	@RequestMapping("BoardWriteProc.class")
	public ModelAndView boardWriteProc(BoardVO bVO, FileVO fileVO, ModelAndView mv) {
		// 할일
		// 데이터 받고
		
		// 데이터베이스에 보내고
		
		// 데이터 받고
		
		// 데이터 넘기고
		
		// 뷰 부르고
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
		/*HashMap map = bDAO.boardDetail(bno);
		List<FileVO> list = bDAO.fileInfo(bno);
		// 데이터 보내고
		mv.addObject("DATA", map);
		mv.addObject("LIST", list);
		
		// 이 과정을 서비스 크래스에서 처리해주면 코드가 간결해질 것 같다.
		*/
		mv = bSrvc.boardGet(bno, mv);
		// 뷰 호출하고
		mv.setViewName(view);
		return mv;
	}
	
	// 게시판 글 수정 폼 요청
	@RequestMapping("BoardEdit.class")
	public ModelAndView boardEditView(ModelAndView mv, BoardVO bVO) {
		System.out.println("############## bno : " + bVO.getNo());
		String view = "board/BoardEdit";
		// 할일
		// 데이터 받고
		/*
		 * String sno = req.getParameter("no");
		int bno = Integer.parseInt(sno);
		*/
		
		// 데이터 만들고
		bVO = bDAO.boardBno(bVO.getNo());
		// 데이터 보내고
		mv.addObject("DATA", bVO);
		// 뷰 부르고
		mv.setViewName(view);
		return mv;
	}
	
	// 파일 다운로드 수 증가 요청
	@RequestMapping("FiHit.class")
	public void addDown(FileVO fileVO, HttpServletResponse resp) {
		bDAO.updateHit(fileVO);
		/*try {
			resp.sendRedirect("../img/" + fileVO.getsName());
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		return;
	}
}
