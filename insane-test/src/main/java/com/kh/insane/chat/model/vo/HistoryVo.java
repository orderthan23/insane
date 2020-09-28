package com.kh.insane.chat.model.vo;

import java.sql.Date;

public class HistoryVo {
	
	int historySeq;
	int empSeq;
	String chatMsg;
	Date msgTime;
	int companyNo;
	int chatRoomSeq;
	String empNo;
	String empName;
	
	public HistoryVo() {
		
	}

	public HistoryVo(int historySeq, int empSeq, String chatMsg, Date msgTime, int companyNo, int chatRoomSeq,
			String empNo, String empName) {
		super();
		this.historySeq = historySeq;
		this.empSeq = empSeq;
		this.chatMsg = chatMsg;
		this.msgTime = msgTime;
		this.companyNo = companyNo;
		this.chatRoomSeq = chatRoomSeq;
		this.empNo = empNo;
		this.empName = empName;
	}

	public int getHistorySeq() {
		return historySeq;
	}

	public void setHistorySeq(int historySeq) {
		this.historySeq = historySeq;
	}

	public int getEmpSeq() {
		return empSeq;
	}

	public void setEmpSeq(int empSeq) {
		this.empSeq = empSeq;
	}

	public String getChatMsg() {
		return chatMsg;
	}

	public void setChatMsg(String chatMsg) {
		this.chatMsg = chatMsg;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getChatRoomSeq() {
		return chatRoomSeq;
	}

	public void setChatRoomSeq(int chatRoomSeq) {
		this.chatRoomSeq = chatRoomSeq;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "HistoryVo [historySeq=" + historySeq + ", empSeq=" + empSeq + ", chatMsg=" + chatMsg + ", msgTime="
				+ msgTime + ", companyNo=" + companyNo + ", chatRoomSeq=" + chatRoomSeq + ", empNo=" + empNo
				+ ", empName=" + empName + "]";
	}

}
