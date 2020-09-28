package com.kh.insane.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.common.model.vo.Attachment;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.notice.model.dao.NoticeDao;
import com.kh.insane.notice.model.exception.NoticeException;
import com.kh.insane.notice.model.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//
	@Autowired
	private NoticeDao nd;

	@Override
	public int selectLastBoardNum(int companyNo) {
		
		int num = nd.selectLastBoardNum(companyNo, sqlSession);
		
		return num;
	}

	@Override
	public int insertNotice(NoticeVo nv) throws NoticeException {
		int result = nd.insertNotice(nv, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new NoticeException("공지사항 추가 실패");
		}
		
		return 0;
	}

	@Override
	public int selectCurrentBoardSeq() {
		int result = nd.selectCurrentBoardSeq(sqlSession);
		return result;
	}

	@Override
	public int insertAttachment(Attachment attFile) throws NoticeException {
		int result = nd.insertAttachment(attFile, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new NoticeException("파일첨부 에러");
		}
		
		return result;
	}

	@Override
	public NoticeVo selectOneNotice(int boardSeq) throws NoticeException {
		NoticeVo nv = nd.selectOneNotice(boardSeq, sqlSession);
		
		if(nv != null) {
			
		} else {
			throw new NoticeException("게시물을 가져오지 못했습니다.");
		}
		
		return nv;
	}

	@Override
	public ArrayList<NoticeVo> selectList(NoticeVo nv, PageInfo pi) {
		// TODO Auto-generated method stub
		ArrayList<NoticeVo> list = nd.selectList(nv, pi, sqlSession);
		
		return list;
	}

	@Override
	public Attachment selectOneAttachment(int attachSeq) {
		Attachment attach = nd.selectOneAttachment(attachSeq, sqlSession);
		
		return attach;
	}

	@Override
	public int selectListCount(NoticeVo nv) {
		int listCount = nd.selectListCount(nv, sqlSession);
		return listCount;
	}

	@Override
	public int updateNotice(NoticeVo nv) throws NoticeException {
		int result = nd.updateNotice(nv, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new NoticeException("게시물 수정 실패");
		}
		
		return result;
	}

	@Override
	public int updateAttachment(Attachment attFile) throws NoticeException {
		int result = nd.updateAttachment(attFile, sqlSession);

		if(result > 0) {
			
		} else {
			throw new NoticeException("게시물 수정 실패");
		}
		
		return result;
	}

	@Override
	public int deleteList(int[] seqList) throws NoticeException {
		int count = 0;
		
		for(int i = 0; i < seqList.length; i++) {
			int result = nd.deleteList(seqList[i], sqlSession);
			
			if(result <= 0) {
				throw new NoticeException("삭제 실패");
			}
			
			count += result;
		}
		
		if(count < seqList.length) {
			throw new NoticeException("삭제 실패");
		}
		
		return count;
	}

	@Override
	public int deleteOne(String boardSeq) throws NoticeException {
		int result = nd.deleteOne(boardSeq, sqlSession);
		
		if(result <= 0) {
			throw new NoticeException("삭제 실패");
		}
		
		return result;
	}
}
