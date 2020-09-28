package com.kh.insane.common.model.vo;

public class Attachment {
	int attachSeq;
	int companyNo;
	int empNoSeq;
	String filePath;
	String originName;
	String changeName;
	String status;
	int boardSeq;
	int documentHistorySeq;
	
	public Attachment() {
	}

	public Attachment(int attachSeq, int companyNo, int empNoSeq, String filePath, String originName, String changeName,
			String status, int boardSeq, int documentHistorySeq) {
		super();
		this.attachSeq = attachSeq;
		this.companyNo = companyNo;
		this.empNoSeq = empNoSeq;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.status = status;
		this.boardSeq = boardSeq;
		this.documentHistorySeq = documentHistorySeq;
	}

	public int getAttachSeq() {
		return attachSeq;
	}

	public void setAttachSeq(int attachSeq) {
		this.attachSeq = attachSeq;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public int getDocumentHistorySeq() {
		return documentHistorySeq;
	}

	public void setDocumentHistorySeq(int documentHistorySeq) {
		this.documentHistorySeq = documentHistorySeq;
	}

	@Override
	public String toString() {
		return "Attachment [attachSeq=" + attachSeq + ", companyNo=" + companyNo + ", empNoSeq=" + empNoSeq
				+ ", filePath=" + filePath + ", originName=" + originName + ", changeName=" + changeName + ", status="
				+ status + ", boardSeq=" + boardSeq + ", documentHistorySeq=" + documentHistorySeq + "]";
	}
}