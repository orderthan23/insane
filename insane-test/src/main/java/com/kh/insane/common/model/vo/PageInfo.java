package com.kh.insane.common.model.vo;

public class PageInfo {
	private int maxPage;
	private int limits;
	private int startPage;
	private int endPage;
	private int totalCount;
	private int currentPage;
	
	public PageInfo() {
		
	}
	
	public PageInfo(int maxPage, int limits, int startPage, int endPage, int totalCount, int currentPage) {
		this.maxPage = maxPage;
		this.limits = limits;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getLimits() {
		return limits;
	}

	public void setLimits(int limits) {
		this.limits = limits;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "PageInfo [minPage=" + ", maxPage=" + maxPage + ", limits=" + limits + ", startPage="
				+ startPage + ", endPage=" + endPage + ", totalCount=" + totalCount + ", currentPage=" + currentPage
				+ "]";
	}	
	
}
