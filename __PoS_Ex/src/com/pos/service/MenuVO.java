package com.pos.service;

public class MenuVO {

	private String mNum;
	private String name;
	private int price;
	
	
	public MenuVO(String mNum2, String name2, int price2) {
		
		this.mNum = mNum2;
		this.name = name2;
		this.price = price2;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
