package com.kh.insane.chat.model.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.insane.chat.model.dao.ChatHistoryDao;
import com.kh.insane.chat.model.dao.ChatHistoryDaoImpl;
import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;
import static com.kh.insane.chat.Template.getSession;

import java.util.ArrayList;

public class ChatHistoryServiceImpl implements ChatHistoryService {

	ChatHistoryDao chd = new ChatHistoryDaoImpl();
	
	@Override
	public int insertChatHistory(HistoryVo hv)  throws ChatException {
		SqlSession session = getSession();
		int result = chd.insertChatHistory(hv, session);
		
		if(result > 0) {
			session.commit();
			session.close();
		}
		
		return 0;
	}

	@Override
	public ArrayList<HistoryVo> selectChatHistory(ChatUser uv) {
		SqlSession session = getSession();
		ArrayList<HistoryVo> list = chd.selectChatHistory(uv, session);
		
		return list;
	}

}
