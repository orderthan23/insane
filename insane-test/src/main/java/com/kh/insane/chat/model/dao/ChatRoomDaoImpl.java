package com.kh.insane.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.vo.ChatRoomVo;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

@Repository
public class ChatRoomDaoImpl implements ChatRoomDao {

	@Override
	public int insertRoom(ChatRoomVo newRoom, SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		return sqlSession.insert("ChatRoomVo.insertChatRoom", newRoom);
	}

	@Override
	public int selectLastRoomSeq(SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ChatRoomVo.selectLastRoomSeq");
	}

	@Override
	public ArrayList<ChatRoomVo> selectAll(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("ChatRoomVo.selectAll");
	}

	@Override
	public ArrayList<ChatRoomVo> selectCompanyChatList(int companyNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("ChatRoomVo.selectCompanyChatList", companyNo);
	}

	@Override
	public ChatUser selectUser(ChatUser uv, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ChatRoomVo.selectJoinUser", uv);
	}

	@Override
	public int insertJoinUser(ChatUser uv, SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		return sqlSession.insert("ChatRoomVo.insertJoinUser", uv);
	}

	@Override
	public int updateJoinUser(ChatUser uv, SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		return sqlSession.update("ChatRoomVo.updateJoinUser", uv);
	}

	@Override
	public ChatRoomVo selectOneRoom(int roomSeq, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ChatRoomVo.selectOneRoom", roomSeq);
	}

	@Override
	public int insertChatHistory(HistoryVo hv, SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		return sqlSession.insert("ChatRoomVo.insertChatHistory", hv);
	}
	@Override
	public int updateChatUserOut(ChatUser uv, SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		return sqlSession.update("ChatRoomVo.updateOutUser", uv);
	}

	@Override
	public int selectChatUserCount(ChatUser uv, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ChatRoomVo.selectChatUserCount", uv);
	}

	@Override
	public int updateEmptyRoom(int roomSeq, SqlSessionTemplate sqlSession) throws ChatException {
		// TODO Auto-generated method stub
		int result = sqlSession.update("ChatRoomVo.updateEmptyRoom", roomSeq);
		return result;
	}

	@Override
	public ChatRoomVo selectOneRoomPwd(ChatRoomVo temp, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ChatRoomVo.selectOneRoomPwd", temp);
	}

}
