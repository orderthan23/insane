package com.kh.insane.chat.model.vo;

import java.sql.Date;

import javax.websocket.Session;

public class ChatUser {

	private int userSeq;
	private int roomSeq;
	private String userNo; //사원번호 받기 위한 용도.
	private Session userSession; //세션.
	private String message; 
	private String status;
	private Date joinDate;
	private String joinDateStr;
	private String userName;
	
	
	public ChatUser() {
		
	}

	public ChatUser(int userSeq, int roomSeq, String userNo, Session userSession, String message, String status,
			Date joinDate, String joinDateStr, String userName) {
		super();
		this.userSeq = userSeq;
		this.roomSeq = roomSeq;
		this.userNo = userNo;
		this.userSession = userSession;
		this.message = message;
		this.status = status;
		this.joinDate = joinDate;
		this.joinDateStr = joinDateStr;
		this.userName = userName;
	}


	public int getUserSeq() {
		return userSeq;
	}


	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}


	public int getRoomSeq() {
		return roomSeq;
	}


	public void setRoomSeq(int roomSeq) {
		this.roomSeq = roomSeq;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public Session getUserSession() {
		return userSession;
	}


	public void setUserSession(Session userSession) {
		this.userSession = userSession;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	public String getJoinDateStr() {
		return joinDateStr;
	}


	public void setJoinDateStr(String joinDateStr) {
		this.joinDateStr = joinDateStr;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Override
	public String toString() {
		return "ChatUser [userSeq=" + userSeq + ", roomSeq=" + roomSeq + ", userNo=" + userNo + ", userSession="
				+ userSession + ", message=" + message + ", status=" + status + ", joinDate=" + joinDate
				+ ", joinDateStr=" + joinDateStr + ", userName=" + userName + "]";
	}
	
	
}
