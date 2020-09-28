package com.kh.insane.chat.model.vo;

public class ChatVo {
	int empSeqNo;
	String empNo;
	String message;
	
	public ChatVo() {
		
	}
	
	public ChatVo(int empSeqNo, String empNo, String message) {
		super();
		this.empSeqNo = empSeqNo;
		this.empNo = empNo;
		this.message = message;
	}

	public int getEmpSeqNo() {
		return empSeqNo;
	}

	public void setEmpSeqNo(int empSeqNo) {
		this.empSeqNo = empSeqNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ChatVo [empSeqNo=" + empSeqNo + ", empNo=" + empNo + ", message=" + message + "]";
	}
	
}
