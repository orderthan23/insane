package com.kh.insane.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.common.model.vo.Attachment;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.notice.model.exception.NoticeException;
import com.kh.insane.notice.model.vo.NoticeVo;

public interface NoticeDao {
//
	int selectLastBoardNum(int companyNo, SqlSessionTemplate sqlSession);

	int insertNotice(NoticeVo nv, SqlSessionTemplate sqlSession) throws NoticeException;

	int selectCurrentBoardSeq(SqlSessionTemplate sqlSession);

	int insertAttachment(Attachment attFile, SqlSessionTemplate sqlSession) throws NoticeException;

	NoticeVo selectOneNotice(int boardSeq, SqlSessionTemplate sqlSession) throws NoticeException;

	ArrayList<NoticeVo> selectList(NoticeVo nv, PageInfo pi, SqlSessionTemplate sqlSession);

	Attachment selectOneAttachment(int attachSeq, SqlSessionTemplate sqlSession);

	int selectListCount(NoticeVo nv, SqlSessionTemplate sqlSession);

	int updateNotice(NoticeVo nv, SqlSessionTemplate sqlSession) throws NoticeException;

	int updateAttachment(Attachment attFile, SqlSessionTemplate sqlSession) throws NoticeException;

	int deleteList(int boardSeq, SqlSessionTemplate sqlSession) throws NoticeException;

	int deleteOne(String boardSeq, SqlSessionTemplate sqlSession) throws NoticeException;
	
}
