package com.hclass.www.vo;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int max;
	private int rno;
	private int no;
	private String title;
	private String id;
	private String body;
	private String reBody;
	private String sDate;
	private int hit;
/*
	private ArrayList<FileVO> fList;
	
	public ArrayList<FileVO> getfList() {
		return fList;
	}
	public void setfList(ArrayList<FileVO> fList) {
		this.fList = fList;
	}
*/
	/*
	 * 핵심
	 * 		업로드된 파일을 기억할 변수는
	 * 		MultipartFile 이라는 클래스 형태로 만들어야 한다.
	 * 		이렇게 만들면 이 변수안에 스트림 형태로 파일의 내용이 기억 되게 된다.
	 * 		
	 * 		이때 주의해야될 것은
	 * 			만약 같은 name값이 하나이면 일반 변수로 만들면 되고
	 * 			만약 같은 name값이 여러개이면(다중업로드로 처리했다면) 배열변수로 만들면 된다.
	 * 		예]
	 * 			MultipartFile upfile; 		==> 하나짜리
	 * 			MultipartFile[] upfile;		==> 다중 업로드 처리변수
	 */
	private MultipartFile[] upfile;
	
	public MultipartFile[] getUpfile() {
		return upfile;
	}
	public void setUpfile(MultipartFile[] upfile) {
		this.upfile = upfile;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	// 줄바꿈 문자 처리함수
	public String getReBody() {
		return reBody;
	}
	public void setReBody(String reBody) {
		this.reBody = reBody.replaceAll("\r\n", "<br>");
		this.body = this.reBody;
	}
	
	
}
