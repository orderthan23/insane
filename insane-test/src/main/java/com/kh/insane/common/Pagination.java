package com.kh.insane.common;

import com.kh.insane.employee.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;
		
		int limit = 20;
		int buttonCount = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / buttonCount + 0.9)) - 1) * buttonCount + 1;
		
		endPage = startPage + buttonCount - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		return pi;
	}
	
	public static PageInfo getPageInfo(int currentPage, int listCount, int limit) {
		PageInfo pi = null;
		
		
		int buttonCount = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / buttonCount + 0.9)) - 1) * buttonCount + 1;
		
		endPage = startPage + buttonCount - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		return pi;
	}
	
}
