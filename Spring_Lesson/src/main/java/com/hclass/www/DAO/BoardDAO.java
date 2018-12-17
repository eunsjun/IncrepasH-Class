package com.hclass.www.DAO;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.hclass.www.vo.*;

public class BoardDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시판 테이블 목록 가져오기 함수
	public ArrayList<BoardVO> boardAllDao() {
		ArrayList<BoardVO> list = (ArrayList) sqlSession.selectList("bSQL.boardAll");
		return list;
	}
}
