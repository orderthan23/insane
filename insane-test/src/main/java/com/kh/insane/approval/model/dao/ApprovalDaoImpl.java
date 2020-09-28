package com.kh.insane.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.approval.model.vo.Document;


@Repository
public class ApprovalDaoImpl implements ApprovalDao {
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Document> loadDocumentTypeList(SqlSessionTemplate sqlSession, int companyNo) {

		return (ArrayList)sqlSession.selectList("approval.loadDocumentTypeList",companyNo);
	
	}
	
	
	/**
	 * @author 고종현
	 * @param  companyNo :로그인 된 회사 번호
	 * @return 이동할 뷰페이지 주소
	 * @see  교육 이수자 처리를 할 사원리스트를 불러오는 컨트롤러
	 * @since 2020.09.09
	 */
	@Override
	public ArrayList<Document> loadOutgoingApprovalList(SqlSessionTemplate sqlSession, int empNoSeq) {

		return (ArrayList)sqlSession.selectList("approval.loadOutgoingApprovalList",empNoSeq);
	}

}
