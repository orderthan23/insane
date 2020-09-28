package com.kh.insane.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import com.kh.insane.common.model.vo.PageInfo;

public class CustomUtil {
	//불러다 쓰일 static 변수.
	private static CustomUtil instance;
	private PageInfo pageInfo;
	
	public static CustomUtil Inst() {
		//instance가 null이면 instance를 할당한다.		
		if(instance == null) {
			instance = new CustomUtil();
		}
		//instance 객체를 반환한다.
		return instance;
	}
	
	public int randNum(int range) {
		return (int)(Math.random() * range);
	}
	
	public int randNum(int min, int max) {
		return (int)(Math.random() * max + min);
	}
	
	public PageInfo getPageInfo(int limits, int currentPage, int totalCount, int btnCount) {
		
		double current = (double)totalCount / limits;
		double offset = (double)(limits - 1) / limits;
		
		//int maxPage = (int) ((double)totalCount / limits + (double) ((limits - 1) / limits));
		//int maxPage = (int) ((double)totalCount / limits + 0.9);
		
		int maxPage = (int) (double)(current + offset);
		
		int startPage = (int) (((double)currentPage / btnCount + 0.9) - 1) * btnCount + 1;
		
		int endPage = (int) startPage + btnCount - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		if(pageInfo == null) {			
			pageInfo = new PageInfo(maxPage, limits, startPage, endPage, totalCount, currentPage);
		} else {
			pageInfo.setMaxPage(maxPage);
			pageInfo.setLimits(limits);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setTotalCount(totalCount);
			pageInfo.setCurrentPage(currentPage);
		}
		
		return pageInfo;
	}
	
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	public void createFile(String path) {
		File file = new File(path);
		
		try {
			file.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String readFile(File file) {
		String str = "";
		int nBuffer;
		
		try {
			BufferedReader bufRead = new BufferedReader(new FileReader(file));
			while((nBuffer = bufRead.read()) != -1) {
				str += (char)nBuffer;
			}
			bufRead.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return str;
	}
	
	public void UpdateFile(String path, String contents) {
		File file = new File(path);
		
		if(!file.exists()) {
			createFile(path);
		}
		
		String str = readFile(file);
		
		try {
			BufferedWriter bufWrite = new BufferedWriter(new FileWriter(file));
			
			bufWrite.write(contents, 0, contents.length());
			
			bufWrite.flush();
			bufWrite.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
