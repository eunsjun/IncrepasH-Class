package com.hclass.www.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.*;

import com.hclass.www.vo.*;

/*
 *  이 클래스는 컨트롤러를 대신해서 데이터베이스에 접속해서 질의명령을 수행하기 위한 전담 클래스이다.
 * 	이 역할은 JSP 프로젝트에서와 같이 작동한다.
 *  다만
 *  	JSP 프로젝트에서는 DataSource를 직접받아서 직접 처리했지만
 *  	Spring 에서는 myBatis 가 해준다.
 */
public class MemberDAO {

	/*
	 * 이 클래스는 데이터 베이스를 사용해야 하고
	 * 커넥션 풀에있는 커넥션을 가지고 와서 사용해야 한다.
	 * 그런데, myBatis에서는 이 커넥션을 커넥션이라 하지 않고 세션이라 부른다.
	 * 다행히도 myBatis에서 세션을 얻어주는 클래스를 만들어 놓았고
	 * 이것을 <bean> 처리까지 해 놓았다.
	 * 그것이
	 * 		==> SqlSessionTemplate 이고
	 * 우리는 이클래스는 반드시 SqlSessionTemplate 이 필요하고
	 * 그말은 SqlSessionTemplate 에 의존한다는 이야기 이다.
	 * 그러면 우리는 의존 주입을 해줘야 될텐데
	 * 자동 의존 주입을 해주면 될 것이다.
	 */
	@Autowired
	SqlSessionTemplate sqlSession ;
	/*
	 * SqlSessionTemplate sqlSession 이 자동 의존 주입을 했다는 이야기는 
	 * sqlSession 변수에 <bean> 처리된 SqlSessionTemplate 을 의존 주입을 했다는 이야기 이므로
	 * 이제 sqlSession 변수를 사용해서 
	 * 모든 데이터베이스 처리를 해주면 될 것이다.
	 */
	
	public int loginProc(MemberVO mData) {
		int cnt = 0;
		
		// System.out.println("##### ID : " + mData.getId());
		cnt = sqlSession.selectOne("memberSQL.Login", mData);
		return cnt;
	}
	
	public void insertMember(MemberVO mVO) {
		// 할일
		// 		질의 명령 보낸다.
		 sqlSession.insert("memberSQL.insertMbr", mVO);
	}
	
	public MemberVO selectMbrInfo(String id) {
		
		return (MemberVO) sqlSession.selectOne("memberSQL.selectMbr", id);
	}
	
	/* 아이디 조회 처리 함수 */
	public int countID(String id) {
		int cnt = 0;
		cnt = sqlSession.selectOne("memberSQL.countID", id);
		return cnt;
	}
	
	// 회원 정보 업데이트 처리 함수
	public void updateID(MemberVO mVO) {
		System.out.println("############### mail : " + mVO.getMail());
		sqlSession.update("memberSQL.updateMbr", mVO);
	}
}
