package com.kh.insane.chat.model.service;

import java.util.ArrayList;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatRoomVo;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

public interface ChatRoomService {

	int insertRoom(ChatRoomVo newRoom) throws ChatException;

	int selectLastRoomSeq() throws ChatException;

	ArrayList<ChatRoomVo> selectAll();

	ArrayList<ChatRoomVo> selectCompanyChatList(int companyNo);

	ChatUser selectUser(ChatUser uv);

	int insertJoinUser(ChatUser uv) throws ChatException;

	ChatRoomVo selectOneRoom(int roomSeq);

	int updateJoinUser(ChatUser uv) throws ChatException;

	int insertChatHistory(HistoryVo hv) throws ChatException;

	int updateChatUserOut(ChatUser uv) throws ChatException;


	int selectChatUserCount(ChatUser uv);

	int updateEmptyRoom(int roomSeq) throws ChatException;

	ChatRoomVo selectOneRoomPwd(ChatRoomVo temp);


}
