package com.hclass.www.util;
/**
 * @author	전은석
 * @since	2018/10/27
 * @version	v1.0
 * @see		
 * 			2018/10/27	- 클래스 제작 		- 전은석
 * 			2018/12/01	- 스프링으로 포팅 	- 전은석
 * 
 * 
 * 이 클래스는 커넥션 풀에 있는 커넥션을 이용해서 데이터베이스 작업을 할 유틸리티 클래스...
 *
 */

import java.sql.*;
import javax.sql.*;

import org.springframework.beans.factory.annotation.Autowired;


public class WebDBCP {
	// 커넥션 풀을 관리할 변수를 만든다.
	/*@Autowired*/
	public DataSource ds ;
	
	/*
	 * 
	 */
	
	@Autowired
	/*
	 * WebDBCP db =new WebDBCP(dataSource);
	 */
	public WebDBCP(DataSource dataSource) {
		try {
			ds = dataSource;
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 아직은 커넥션 풀을 찾는데만 성공했고
	 * 커넥션을 얻어 온 상태는 아니다.
	 * 따라서 필요한 순간에 커넥션 풀을 찾아야 겠다.
	 * 한마디로 풀에서 하나만 꺼내오는 것이다.
	 */
	public Connection getCON() {
		Connection con = null;
		try {
			con = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public Statement getSTMT(Connection con) {
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	public PreparedStatement getPSTMT(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public void close(Object o) {
		try {
			if( o instanceof Connection) {
				((Connection) o).close();
			} else if(o instanceof Statement) {
				((Statement) o).close();
			} else if(o instanceof PreparedStatement) {
				((PreparedStatement) o).close();
			} else if(o instanceof ResultSet) {
				((ResultSet) o).close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
