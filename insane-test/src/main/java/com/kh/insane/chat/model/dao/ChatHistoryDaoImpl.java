package com.kh.insane.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

public class ChatHistoryDaoImpl implements ChatHistoryDao {

	@Override
	public int insertChatHistory(HistoryVo hv, SqlSession session) throws ChatException {
		// TODO Auto-generated method stub
		int result = session.insert("ChatRoomVo.insertChatHistory", hv);
		
		if(result <= 0) {
			session.rollback();
			session.close();
			
			throw new ChatException("메시지 전송 실패");
		}
		return result;
	}

	@Override
	public ArrayList<HistoryVo> selectChatHistory(ChatUser uv, SqlSession session) {
		// TODO Auto-generated method stub
		return (ArrayList)session.selectList("ChatRoomVo.selectChatHistory", uv);
	}
	
}
