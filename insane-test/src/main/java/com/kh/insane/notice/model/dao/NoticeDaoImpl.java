package com.kh.insane.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.common.model.vo.Attachment;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.notice.model.exception.NoticeException;
import com.kh.insane.notice.model.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public int selectLastBoardNum(int companyNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("NoticeVo.selectBoardCount", companyNo);
	}

	@Override
	public int insertNotice(NoticeVo nv, SqlSessionTemplate sqlSession) throws NoticeException {
		// TODO Auto-generated method stub
		return sqlSession.insert("NoticeVo.insertNotice", nv);
	}

	@Override
	public int selectCurrentBoardSeq(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NoticeVo.selectCurrentBoardSeq");
	}

	@Override
	public int insertAttachment(Attachment attFile, SqlSessionTemplate sqlSession) throws NoticeException {
		// TODO Auto-generated method stub
		return sqlSession.insert("NoticeVo.insertAttachment", attFile);
	}

	@Override
	public NoticeVo selectOneNotice(int boardSeq, SqlSessionTemplate sqlSession) throws NoticeException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NoticeVo.selectOneBoard", boardSeq);
	}

	@Override
	public ArrayList<NoticeVo> selectList(NoticeVo nv, PageInfo pi, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int offSet = (pi.getCurrentPage() - 1) * pi.getLimits();
		
		RowBounds rowBounds = new RowBounds(offSet, pi.getLimits());
		
		return (ArrayList) sqlSession.selectList("NoticeVo.selectListBoard", nv, rowBounds);
	}

	@Override
	public Attachment selectOneAttachment(int attachSeq, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NoticeVo.selectAttachment", attachSeq);
	}

	@Override
	public int selectListCount(NoticeVo nv, SqlSessionTemplate sqlSession) {		
		return sqlSession.selectOne("NoticeVo.selectTypeBoardCount", nv);
	}

	@Override
	public int updateNotice(NoticeVo nv, SqlSessionTemplate sqlSession) throws NoticeException {
		// TODO Auto-generated method stub
		return sqlSession.update("NoticeVo.updateBoard", nv);
	}
//
	@Override
	public int updateAttachment(Attachment attFile, SqlSessionTemplate sqlSession) throws NoticeException {
		// TODO Auto-generated method stub
		return sqlSession.update("NoticeVo.updateAttach", attFile);
	}

	@Override
	public int deleteList(int boardSeq, SqlSessionTemplate sqlSession) throws NoticeException {
		return sqlSession.update("NoticeVo.deleteNotice", boardSeq);
	}

	@Override
	public int deleteOne(String boardSeq, SqlSessionTemplate sqlSession) throws NoticeException {
		// TODO Auto-generated method stub
		return sqlSession.update("NoticeVo.deleteNotice", boardSeq);
	}
	
}
