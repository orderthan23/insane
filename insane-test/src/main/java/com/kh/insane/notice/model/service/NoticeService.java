package com.kh.insane.notice.model.service;

import java.util.ArrayList;

import com.kh.insane.common.model.vo.Attachment;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.notice.model.exception.NoticeException;
import com.kh.insane.notice.model.vo.NoticeVo;

public interface NoticeService {

	int selectLastBoardNum(int companyNo);

	int insertNotice(NoticeVo nv) throws NoticeException;

	int selectCurrentBoardSeq();

	int insertAttachment(Attachment attFile) throws NoticeException;

	NoticeVo selectOneNotice(int boardSeq) throws NoticeException;

	ArrayList<NoticeVo> selectList(NoticeVo nv, PageInfo pi);

	Attachment selectOneAttachment(int attachSeq);
//
	int selectListCount(NoticeVo nv);

	int updateNotice(NoticeVo nv) throws NoticeException;

	int updateAttachment(Attachment attFile) throws NoticeException;

	int deleteList(int[] seqList) throws NoticeException;

	int deleteOne(String boardSeq) throws NoticeException;

}
