package com.kh.insane.chat.model.vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class ChatRoomVo {
	
	//private ArrayList<ChatUser> userList;
	//private Set<ChatUser> userList;
	private List<ChatUser> userList;
	private int chatSeq;
	private int companyNo;
	private String password;
	private String chatRoomName;
	private int makeUserSeq;
	private String status;
	private String makerName;
	private int userNum;
	
	public ChatRoomVo() {
		userList = Collections.synchronizedList(new ArrayList<>());//new ArrayList<ChatUser>();
	}
	
	public void InitUserList() {
		userList = Collections.synchronizedList(new ArrayList<>());//new ArrayList<ChatUser>();
	}

	public ChatRoomVo(List<ChatUser> userList, int chatSeq, int companyNo, String password, String chatRoomName,
			int makeUserSeq, String status, String makerName, int userNum) {
		super();
		this.userList = userList;
		this.chatSeq = chatSeq;
		this.companyNo = companyNo;
		this.password = password;
		this.chatRoomName = chatRoomName;
		this.makeUserSeq = makeUserSeq;
		this.status = status;
		this.makerName = makerName;
		this.userNum = userNum;
	}

	public List<ChatUser> getUserList() {
		return userList;
	}

	public void setUserList(List<ChatUser> userList) {
		this.userList = userList;
	}

	public int getChatSeq() {
		return chatSeq;
	}

	public void setChatSeq(int chatSeq) {
		this.chatSeq = chatSeq;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getChatRoomName() {
		return chatRoomName;
	}

	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}

	public int getMakeUserSeq() {
		return makeUserSeq;
	}

	public void setMakeUserSeq(int makeUserSeq) {
		this.makeUserSeq = makeUserSeq;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMakerName() {
		return makerName;
	}

	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [userList=" + userList + ", chatSeq=" + chatSeq + ", companyNo=" + companyNo + ", password="
				+ password + ", chatRoomName=" + chatRoomName + ", makeUserSeq=" + makeUserSeq + ", status=" + status
				+ ", makerName=" + makerName + ", userNum=" + userNum + "]";
	}

	
}
