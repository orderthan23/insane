package com.kh.insane.approval.model.service;

import java.util.ArrayList;

import com.kh.insane.approval.model.vo.Document;

public interface ApprovalService {

	ArrayList<Document> loadDocumentTypeList(int companyNo);

	ArrayList<Document> loadOutgoingApprovalList(int empNoSeq);

}
