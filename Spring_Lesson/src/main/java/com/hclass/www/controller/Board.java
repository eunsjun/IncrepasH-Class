package com.hclass.www.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.RedirectView;

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
	@Autowired
	FileService fSrvc;
	
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
	public ModelAndView boardWriteProc(BoardVO bVO, FileVO fileVO, ModelAndView mv, RedirectView rv) {
		// 할일
		// 데이터 받고
		/*
		 * 파라미터를 받는데
		 * 지금까지 배웠던 방식으로도 얼마든지 파리미터를 받을 수 있다.
		 * 그런데 이번에는 파일을 전송해야되는 기능이 추가가 되어서
		 * 파일 전송은 스트림으로 해결을 해야한다.
		 * 파라미터의 양이 많으므로 VO에 담아서 받기로 하자.
		 */
		
		// 첫번째로 파일을 업로드 한다.
		String[] saveName = fSrvc.uploadSrvc(bVO.getUpfile());
		// 데이터베이스에 보내고
		bSrvc.insertBrd(bVO, fileVO);
		// 데이터 받고
		// 데이터 넘기고
		// 그런데 지금 처리작업은 데이터 베이스에 insert 명령이 실행되므로 
		// 요청이 남아있다면 한버더 추가명령이 실행될 오류가 발생할 수 있다.
		// 따라서 이 경우는 요청이 새롭게 바뀌어야 될 것이다.
		
		// 뷰 부르고 	<==  Redirect 방식으로 부른다.
		rv.setUrl("../board/Board.class");
		mv.setView(rv);
		return mv;
	}
	
	// 게시판 리스트 가져오기 요청 함수
	@RequestMapping("Board.class")
	public ModelAndView boardList(ModelAndView mv) {
		mv.addObject("LIST", bDAO.boardAllDao());
		mv.setViewName("board/board");
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
