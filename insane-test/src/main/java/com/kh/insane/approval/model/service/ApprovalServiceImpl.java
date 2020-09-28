package com.kh.insane.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.approval.model.dao.ApprovalDao;
import com.kh.insane.approval.model.vo.Document;


@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao apd;
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Document> loadDocumentTypeList(int companyNo) {

		return apd.loadDocumentTypeList(sqlSession,companyNo);
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Document> loadOutgoingApprovalList(int empNoSeq) {

		return apd.loadOutgoingApprovalList(sqlSession, empNoSeq);
	}
}
