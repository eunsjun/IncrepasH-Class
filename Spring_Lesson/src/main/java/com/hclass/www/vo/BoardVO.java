package com.hclass.www.vo;

public class BoardVO {
	private int rno;
	private int no;
	private String title;
	private String id;
	private String body;
	private String reBody;
	private String sDate;
	private int hit;
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
