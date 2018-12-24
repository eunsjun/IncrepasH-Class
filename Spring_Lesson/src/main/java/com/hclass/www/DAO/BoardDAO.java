package com.hclass.www.DAO;

import java.util.*;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.hclass.www.util.WebDBCP;
import com.hclass.www.vo.*;

public class BoardDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
/*
	@Autowired
	DataSource dataSource;
	WebDBCP ds = new WebDBCP(dataSource);
 */	
	
	// 게시판 테이블 목록 가져오기 함수
	public ArrayList<BoardVO> boardAllDao() {
		ArrayList<BoardVO> list = (ArrayList) sqlSession.selectList("bSQL.boardAll");
		return list;
	}
	
	public HashMap boardDetail(int bno) {
		return (HashMap) sqlSession.selectOne("bSQL.selectDetail", bno);
	}
	
	public BoardVO boardBno(int bno) {
		return sqlSession.selectOne("bSQL.selBno", bno);
	}
	
	// 파일 정보 가져오기 함수
	public List<FileVO> fileInfo(int bno) {
		return sqlSession.selectList("bSQL.fileInfo", bno);
	}
	
	// 파일 다운수 처리 함수
	public void updateHit(FileVO fileVO) {
		sqlSession.update("bSQL.addHit", fileVO);
		return;
	}
}
