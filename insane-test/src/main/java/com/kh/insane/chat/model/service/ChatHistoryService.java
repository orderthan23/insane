package com.kh.insane.chat.model.service;

import java.util.ArrayList;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

public interface ChatHistoryService {

	int insertChatHistory(HistoryVo hv) throws ChatException;

	ArrayList<HistoryVo> selectChatHistory(ChatUser uv);

	//int updateOutUser(ChatUser currentUser) throws ChatException;

}
