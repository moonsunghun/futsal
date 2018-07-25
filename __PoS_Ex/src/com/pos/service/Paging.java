package com.pos.service;

public class Paging {

	public int pageSize=5;
	public int pageBlock =5;
	public int cPage;
	public int total;
	public int endNo;
	public int startNo;
	public int totalPage;
	public int prevBlock;
	public int nextBlock;
	public Paging()
	{
	}
	public Paging(int cPage, int total) {
		this.cPage = cPage;
		this.total = total;
		this.endNo = this.pageSize * this.cPage;
		this.startNo = this.endNo - this.pageSize;
		this.totalPage = (int)(((this.total-1)/this.pageSize)+1);
		this.prevBlock = (int)Math.floor((this.cPage-1)/this.pageBlock)*this.pageBlock;
		this.nextBlock = this.prevBlock + this.pageBlock  + 1;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getcPage() {
		return cPage;
	}
	public void setcPage(int cPage) {
		this.cPage = cPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

}
