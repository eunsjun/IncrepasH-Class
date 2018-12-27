package com.hclass.www.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private int fno;
	private int max;
	private int bno;
	private String oName;
	private String sName;
	private long len;
	private String dir;
	private int down;
	
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
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public void setUpfile(MultipartFile[] upfile) {
		this.upfile = upfile;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
}
