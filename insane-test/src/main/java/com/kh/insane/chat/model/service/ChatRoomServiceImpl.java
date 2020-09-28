package com.kh.insane.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.chat.model.dao.ChatRoomDao;
import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatRoomVo;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {
	
	@Autowired
	ChatRoomDao cd;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertRoom(ChatRoomVo newRoom) throws ChatException {
		// TODO Auto-generated method stub
		int result = cd.insertRoom(newRoom, sqlSession);
		
		if(result <= 0) {
			throw new ChatException("방 생성 실패");
		}
		
		return result;
	}

	@Override
	public int selectLastRoomSeq() throws ChatException {
		
		int roomSeq = cd.selectLastRoomSeq(sqlSession);
		
		if(roomSeq <= 0) {
			throw new ChatException("존재하는 방 없음.");
		}
		
		return roomSeq;
	}

	@Override
	public ArrayList<ChatRoomVo> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<ChatRoomVo> list = cd.selectAll(sqlSession);
		return list;
	}

	@Override
	public ArrayList<ChatRoomVo> selectCompanyChatList(int companyNo) {
		// TODO Auto-generated method stub
		ArrayList<ChatRoomVo> list = cd.selectCompanyChatList(companyNo, sqlSession);
		return list;
	}

	@Override
	public ChatUser selectUser(ChatUser uv) {
		// TODO Auto-generated method stub
		ChatUser user = cd.selectUser(uv, sqlSession);
		return user;
	}

	@Override
	public int insertJoinUser(ChatUser uv) throws ChatException {
		// TODO Auto-generated method stub
		int result = cd.insertJoinUser(uv, sqlSession);
		
		if(result <= 0) {
			throw new ChatException("채팅방 입장 실패.");
		}
		
		return result;
		
	}

	@Override
	public int updateJoinUser(ChatUser uv) throws ChatException {
		// TODO Auto-generated method stub
		int result = cd.updateJoinUser(uv, sqlSession);
		
		if(result <= 0) {
			throw new ChatException("채팅방 입장 실패.");
		}
		
		return result;
	}
	
	@Override
	public ChatRoomVo selectOneRoom(int roomSeq) {
		// TODO Auto-generated method stub
		ChatRoomVo room = cd.selectOneRoom(roomSeq, sqlSession);
		
		return room;
	}

	@Override
	public int insertChatHistory(HistoryVo hv) throws ChatException {
		// TODO Auto-generated method stub
		int result = cd.insertChatHistory(hv, sqlSession);
		
		if(result <= 0) {
			throw new ChatException("채팅 전송 실패.");
		}
		
		return result;
	}

	@Override
	public int updateChatUserOut(ChatUser uv) throws ChatException {
		// TODO Auto-generated method stub
		int result = cd.updateChatUserOut(uv, sqlSession);
		
		if(result <= 0) {
			throw new ChatException("채팅 전송 실패.");
		}
		return result;
	}

	@Override
	public int selectChatUserCount(ChatUser uv) {
		int userCount = cd.selectChatUserCount(uv, sqlSession);
		return userCount;
	}

	@Override
	public int updateEmptyRoom(int roomSeq) throws ChatException {
		// TODO Auto-generated method stub
		int result = cd.updateEmptyRoom(roomSeq, sqlSession);
		
		if(result <= 0) {
			throw new ChatException("채팅방 폐쇄 실패.");
		}
		
		return result;
	}

	@Override
	public ChatRoomVo selectOneRoomPwd(ChatRoomVo temp) {
		// TODO Auto-generated method stub
		ChatRoomVo room = cd.selectOneRoomPwd(temp, sqlSession);
		
		return room;
	}

}
