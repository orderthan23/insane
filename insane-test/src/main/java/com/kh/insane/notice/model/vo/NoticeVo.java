package com.kh.insane.notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.insane.common.model.vo.Attachment;

public class NoticeVo implements java.io.Serializable {
	//
	private int boardSeq;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private int writerEmpNo;
	private int companyNo;
	private String status; //공개, 삭제, 비공개.
	private int boardNo;
	private Date enrollDate;	
	private String writerName;
	private String writerNo;
	private ArrayList<Attachment> attachList;
	
	public NoticeVo() {
		super();
	}

	public NoticeVo(int boardSeq, String boardType, String boardTitle, String boardContent, int writerEmpNo,
			int companyNo, String status, int boardNo, Date enrollDate, String writerName, String writerNo,
			ArrayList<Attachment> attachList) {
		super();
		this.boardSeq = boardSeq;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.writerEmpNo = writerEmpNo;
		this.companyNo = companyNo;
		this.status = status;
		this.boardNo = boardNo;
		this.enrollDate = enrollDate;
		this.writerName = writerName;
		this.writerNo = writerNo;
		this.attachList = attachList;
	}

	
	
	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getWriterEmpNo() {
		return writerEmpNo;
	}

	public void setWriterEmpNo(int writerEmpNo) {
		this.writerEmpNo = writerEmpNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
	}

	public ArrayList<Attachment> getAttachList() {
		return attachList;
	}

	public void setAttachList(ArrayList<Attachment> attachList) {
		this.attachList = attachList;
	}

	@Override
	public String toString() {
		return "NoticeVo [boardSeq=" + boardSeq + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", writerEmpNo=" + writerEmpNo + ", companyNo=" + companyNo
				+ ", status=" + status + ", boardNo=" + boardNo + ", enrollDate=" + enrollDate + ", writerName="
				+ writerName + ", writerNo=" + writerNo + ", attachList=" + attachList + "]";
	}

	
	
}
