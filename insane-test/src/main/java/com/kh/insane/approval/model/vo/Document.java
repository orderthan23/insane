package com.kh.insane.approval.model.vo;

import java.sql.Date;

public class Document {
	
	private int documentHistorySeq;
	private int empNoSeq;
	private String documentType;
	private String documentName;
	private Date documentSubmitDate;
	private String sanctners;
	private String cooperators;
	private String referrers;
	private int companyNo;
	private int sanctionLogSeq;
	private int sanctionStatus;
	
	
	
	public Document() {

	}



	public Document(int documentHistorySeq, int empNoSeq, String documentType, String documentName,
			Date documentSubmitDate, String sanctners, String cooperators, String referrers, int companyNo,
			int sanctionLogSeq, int sanctionStatus) {
		super();
		this.documentHistorySeq = documentHistorySeq;
		this.empNoSeq = empNoSeq;
		this.documentType = documentType;
		this.documentName = documentName;
		this.documentSubmitDate = documentSubmitDate;
		this.sanctners = sanctners;
		this.cooperators = cooperators;
		this.referrers = referrers;
		this.companyNo = companyNo;
		this.sanctionLogSeq = sanctionLogSeq;
		this.sanctionStatus = sanctionStatus;
	}



	@Override
	public String toString() {
		return "Document [documentHistorySeq=" + documentHistorySeq + ", empNoSeq=" + empNoSeq + ", documentType="
				+ documentType + ", documentName=" + documentName + ", documentSubmitDate=" + documentSubmitDate
				+ ", sanctners=" + sanctners + ", cooperators=" + cooperators + ", referrers=" + referrers
				+ ", companyNo=" + companyNo + ", sanctionLogSeq=" + sanctionLogSeq + ", sanctionStatus="
				+ sanctionStatus + "]";
	}



	public int getDocumentHistorySeq() {
		return documentHistorySeq;
	}



	public void setDocumentHistorySeq(int documentHistorySeq) {
		this.documentHistorySeq = documentHistorySeq;
	}



	public int getEmpNoSeq() {
		return empNoSeq;
	}



	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}



	public String getDocumentType() {
		return documentType;
	}



	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}



	public String getDocumentName() {
		return documentName;
	}



	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}



	public Date getDocumentSubmitDate() {
		return documentSubmitDate;
	}



	public void setDocumentSubmitDate(Date documentSubmitDate) {
		this.documentSubmitDate = documentSubmitDate;
	}



	public String getSanctners() {
		return sanctners;
	}



	public void setSanctners(String sanctners) {
		this.sanctners = sanctners;
	}



	public String getCooperators() {
		return cooperators;
	}



	public void setCooperators(String cooperators) {
		this.cooperators = cooperators;
	}



	public String getReferrers() {
		return referrers;
	}



	public void setReferrers(String referrers) {
		this.referrers = referrers;
	}



	public int getCompanyNo() {
		return companyNo;
	}



	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}



	public int getSanctionLogSeq() {
		return sanctionLogSeq;
	}



	public void setSanctionLogSeq(int sanctionLogSeq) {
		this.sanctionLogSeq = sanctionLogSeq;
	}



	public int getSanctionStatus() {
		return sanctionStatus;
	}



	public void setSanctionStatus(int sanctionStatus) {
		this.sanctionStatus = sanctionStatus;
	}


	
	
	
	

}
