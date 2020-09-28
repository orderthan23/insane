package com.kh.insane.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.approval.model.vo.Document;

public interface ApprovalDao {

	ArrayList<Document> loadDocumentTypeList(SqlSessionTemplate sqlSession, int companyNo);

	ArrayList<Document> loadOutgoingApprovalList(SqlSessionTemplate sqlSession, int empNoSeq);

}
