package com.hclass.www.DAO;

import java.util.*;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.hclass.www.vo.*;

public class FileDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 파일 정보 등록 질의 실행 함수
	public void insertFiBoard(FileVO fileVO) {
		sqlSession.insert("fileSQL.insertFBoard", fileVO);
	}
	
	// 파일 정보 조회 질의 실행 함수
	public ArrayList selFiBoard(int bno) {
		return (ArrayList) sqlSession.selectList("fileSQL.selFiBoard", bno);
	}
}
