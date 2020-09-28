package com.kh.insane.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

public interface ChatHistoryDao {

	int insertChatHistory(HistoryVo hv, SqlSession session) throws ChatException;
	//ArrayList<HistoryVo> selectChatHistory(HistoryVo hv, SqlSession session);
	ArrayList<HistoryVo> selectChatHistory(ChatUser uv, SqlSession session);

}
