package com.pos.service;

public class MemberVO {

	private String id;
	private String pw;
	private int grade;
	public MemberVO()
	{
		
	}
	public MemberVO(String id2, String pw2, int grade2) {
		this.id = id2;
		this.pw = pw2;
		this.grade = grade2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
}
