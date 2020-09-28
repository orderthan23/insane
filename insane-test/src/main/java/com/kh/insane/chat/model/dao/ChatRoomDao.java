package com.kh.insane.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatRoomVo;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;


public interface ChatRoomDao {

	int insertRoom(ChatRoomVo newRoom, SqlSessionTemplate sqlSession) throws ChatException ;

	int selectLastRoomSeq(SqlSessionTemplate sqlSession) throws ChatException;

	ArrayList<ChatRoomVo> selectAll(SqlSessionTemplate sqlSession);

	ArrayList<ChatRoomVo> selectCompanyChatList(int companyNo, SqlSessionTemplate sqlSession);

	ChatUser selectUser(ChatUser uv, SqlSessionTemplate sqlSession);

	int insertJoinUser(ChatUser uv, SqlSessionTemplate sqlSession) throws ChatException;

	int updateJoinUser(ChatUser uv, SqlSessionTemplate sqlSession) throws ChatException;

	ChatRoomVo selectOneRoom(int roomSeq, SqlSessionTemplate sqlSession);

	int insertChatHistory(HistoryVo hv, SqlSessionTemplate sqlSession) throws ChatException;

	int updateChatUserOut(ChatUser uv, SqlSessionTemplate sqlSession) throws ChatException;

	int selectChatUserCount(ChatUser uv, SqlSessionTemplate sqlSession);

	int updateEmptyRoom(int roomSeq, SqlSessionTemplate sqlSession) throws ChatException;

	ChatRoomVo selectOneRoomPwd(ChatRoomVo temp, SqlSessionTemplate sqlSession);

}
