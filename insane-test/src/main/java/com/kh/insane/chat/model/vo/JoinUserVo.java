package com.kh.insane.chat.model.vo;

public class JoinUserVo {
	int roomSeq;
	int userSeq;
	
	public JoinUserVo() {
		
	}
	
	public JoinUserVo(int roomSeq, int userSeq) {
		this.roomSeq = roomSeq;
		this.userSeq = userSeq;
	}
	
	public int getRoomSeq() {
		return roomSeq;
	}
	public void setRoomSeq(int roomSeq) {
		this.roomSeq = roomSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	@Override
	public String toString() {
		return "JoinUserVo [roomSeq=" + roomSeq + ", userSeq=" + userSeq + "]";
	}
	
}
