package com.kh.insane.employee.model.vo;

public class ProfileAttachment implements java.io.Serializable{
	
	private int attachmentSeq;
	private int companyNo;
	private int empNoSeq;
	private String filePath;
	private String originName;
	private String changeName;
	private String attStatus;
	private String boardSeq;
	private String documentHistorySeq;
	
	public ProfileAttachment() {}

	public ProfileAttachment(int attachmentSeq, int companyNo, int empNoSeq, String filePath, String originName,
			String changeName, String attStatus, String boardSeq, String documentHistorySeq) {
		super();
		this.attachmentSeq = attachmentSeq;
		this.companyNo = companyNo;
		this.empNoSeq = empNoSeq;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.attStatus = attStatus;
		this.boardSeq = boardSeq;
		this.documentHistorySeq = documentHistorySeq;
	}

	public int getAttachmentSeq() {
		return attachmentSeq;
	}

	public void setAttachmentSeq(int attachmentSeq) {
		this.attachmentSeq = attachmentSeq;
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

	public String getAttStatus() {
		return attStatus;
	}

	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}

	public String getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getDocumentHistorySeq() {
		return documentHistorySeq;
	}

	public void setDocumentHistorySeq(String documentHistorySeq) {
		this.documentHistorySeq = documentHistorySeq;
	}

	@Override
	public String toString() {
		return "ProfileAttachment [attachmentSeq=" + attachmentSeq + ", companyNo=" + companyNo + ", empNoSeq="
				+ empNoSeq + ", filePath=" + filePath + ", originName=" + originName + ", changeName=" + changeName
				+ ", attStatus=" + attStatus + ", boardSeq=" + boardSeq + ", documentHistorySeq=" + documentHistorySeq
				+ "]";
	}
	
}
