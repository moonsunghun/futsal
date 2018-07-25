package com.pos.service;

public class PosTableVO {

	private int tNum;
	private String status;
	private String mNum;
	private String name;
	private int count = 1;
	private int price;
	private int year;
	private int month;
	private int day;
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	MenuVO menuVO = null;
	public PosTableVO() {
	}
	public PosTableVO(int tNum2, String status2) {
		this.tNum = tNum2;
		this.status=status2;
	}
	public PosTableVO(int tNum2, String status2, MenuVO menuVO) {
		this.tNum = tNum2;
		this.status=status2;
		this.mNum = menuVO.getmNum();
		this.name = menuVO.getName();
		this.price = menuVO.getPrice();
	}
	public PosTableVO(String name2, int tNum2) {
		this.name = name2;
		this.tNum = tNum2;
	}
	public PosTableVO(int tNum2) {
		
		this.tNum = tNum2;
	}
	public PosTableVO(int year2, int month2, int day2,String mNum,String name) {
		this.year=year2;
		this.month = month2;
		this.day = day2;
		this.mNum = mNum;
		this.name= name;
	}
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
