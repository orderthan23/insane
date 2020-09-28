package com.kh.insane.crtfc.model.vo;

import java.sql.Date;

public class CtrfcVo implements java.io.Serializable {
	int crftcSeq;
	int crtfcNo;
	String crftType;
	Date applyDate; //신청일자
	Date crtfcEnrollDate; //등록일자(양식 변경 기준. 대표이사의 번호가 바뀔 수 있으므로 그걸 저장한다고 함.)
	int empNoSeq;
	String empName; //직원이름
	String residentNo;//주민번호
	String positionCode; //직급코드.
	String positionName; //직급명.	
	String address; //주소
	String phone; //전화번호(휴대폰)
	String empEnrollDate;
	String empRetireDate;
	String empDeptCode;

	int companyNo; //회사코드
	String companyName; //회사명
	String businessAddress; //소재지
	
	int ceoSeq; //ceo시퀀스
	int ceoEmpNo;
	String ceoName; //ceo 이름
	String ceoPhone; //ceo 폰번
	
	Date issueDate; //발급일
 	String issueEmpRspofc; //발급자 직책명
 	String issueDeptName; //발급부서
 	String issuePhone; //발급자 연락처
  	String issueReason; //발급사유
  	String issueName;
  	int issueEmpNo;
  	int issueEmpSeq;
  	String issueDeptCode;
  	
  	String processStatus;

	public CtrfcVo() {
	
	}	

	public CtrfcVo(int crftcSeq, int crtfcNo, String crftType, Date applyDate, Date crtfcEnrollDate, String empName,
			String residentNo, String positionCode, String positionName, String address, String phone, int companyNo,
			String companyName, String businessAddress, int ceoSeq, String ceoName, String ceoPhone, Date issueDate,
			String issueEmpRspofc, String issueDeptName, String issuePhone, String issueReason, int issueEmpNo,
			int issueEmpSeq, String processStatus) {
		super();
		this.crftcSeq = crftcSeq;
		this.crtfcNo = crtfcNo;
		this.crftType = crftType;
		this.applyDate = applyDate;
		this.crtfcEnrollDate = crtfcEnrollDate;
		this.empName = empName;
		this.residentNo = residentNo;
		this.positionCode = positionCode;
		this.positionName = positionName;
		this.address = address;
		this.phone = phone;
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.businessAddress = businessAddress;
		this.ceoSeq = ceoSeq;
		this.ceoName = ceoName;
		this.ceoPhone = ceoPhone;
		this.issueDate = issueDate;
		this.issueEmpRspofc = issueEmpRspofc;
		this.issueDeptName = issueDeptName;
		this.issuePhone = issuePhone;
		this.issueReason = issueReason;
		this.issueEmpNo = issueEmpNo;
		this.issueEmpSeq = issueEmpSeq;
		this.processStatus = processStatus;
	}	

	public int getCrftcSeq() {
		return crftcSeq;
	}

	public void setCrftcSeq(int crftcSeq) {
		this.crftcSeq = crftcSeq;
	}

	public int getCrtfcNo() {
		return crtfcNo;
	}

	public void setCrtfcNo(int crtfcNo) {
		this.crtfcNo = crtfcNo;
	}

	public String getCrftType() {
		return crftType;
	}

	public void setCrftType(String crftType) {
		this.crftType = crftType;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public Date getCrtfcEnrollDate() {
		return crtfcEnrollDate;
	}

	public void setCrtfcEnrollDate(Date crtfcEnrollDate) {
		this.crtfcEnrollDate = crtfcEnrollDate;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getResidentNo() {
		return residentNo;
	}

	public void setResidentNo(String residentNo) {
		this.residentNo = residentNo;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBusinessAddress() {
		return businessAddress;
	}

	public void setBusinessAddress(String businessAddress) {
		this.businessAddress = businessAddress;
	}

	public int getCeoSeq() {
		return ceoSeq;
	}

	public void setCeoSeq(int ceoSeq) {
		this.ceoSeq = ceoSeq;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public String getCeoPhone() {
		return ceoPhone;
	}

	public void setCeoPhone(String ceoPhone) {
		this.ceoPhone = ceoPhone;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public String getIssueEmpRspofc() {
		return issueEmpRspofc;
	}

	public void setIssueEmpRspofc(String issueEmpRspofc) {
		this.issueEmpRspofc = issueEmpRspofc;
	}

	public String getIssueDeptName() {
		return issueDeptName;
	}

	public void setIssueDeptName(String issueDeptName) {
		this.issueDeptName = issueDeptName;
	}

	public String getIssuePhone() {
		return issuePhone;
	}

	public void setIssuePhone(String issuePhone) {
		this.issuePhone = issuePhone;
	}

	public String getIssueReason() {
		return issueReason;
	}

	public void setIssueReason(String issueReason) {
		this.issueReason = issueReason;
	}

	public int getIssueEmpNo() {
		return issueEmpNo;
	}

	public void setIssueEmpNo(int issueEmpNo) {
		this.issueEmpNo = issueEmpNo;
	}

	public int getIssueEmpSeq() {
		return issueEmpSeq;
	}

	public void setIssueEmpSeq(int issueEmpSeq) {
		this.issueEmpSeq = issueEmpSeq;
	}

	public String getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
	}
	
	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getEmpEnrollDate() {
		return empEnrollDate;
	}

	public void setEmpEnrollDate(String empEnrollDate) {
		this.empEnrollDate = empEnrollDate;
	}

	public String getEmpRetireDate() {
		return empRetireDate;
	}

	public void setEmpRetireDate(String empRetireDate) {
		this.empRetireDate = empRetireDate;
	}

	public String getEmpDeptCode() {
		return empDeptCode;
	}

	public void setEmpDeptCode(String empDeptCode) {
		this.empDeptCode = empDeptCode;
	}

	public int getCeoEmpNo() {
		return ceoEmpNo;
	}

	public void setCeoEmpNo(int ceoEmpNo) {
		this.ceoEmpNo = ceoEmpNo;
	}

	public String getIssueName() {
		return issueName;
	}

	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}

	public String getIssueDeptCode() {
		return issueDeptCode;
	}

	public void setIssueDeptCode(String issueDeptCode) {
		this.issueDeptCode = issueDeptCode;
	}

	@Override
	public String toString() {
		return "CtrfcVo [crftcSeq=" + crftcSeq + ", crtfcNo=" + crtfcNo + ", crftType=" + crftType + ", applyDate="
				+ applyDate + ", crtfcEnrollDate=" + crtfcEnrollDate + ", empName=" + empName + ", residentNo="
				+ residentNo + ", positionCode=" + positionCode + ", positionName=" + positionName + ", address="
				+ address + ", phone=" + phone + ", companyNo=" + companyNo + ", companyName=" + companyName
				+ ", businessAddress=" + businessAddress + ", ceoSeq=" + ceoSeq + ", ceoName=" + ceoName + ", ceoPhone="
				+ ceoPhone + ", issueDate=" + issueDate + ", issueEmpRspofc=" + issueEmpRspofc + ", issueDeptName="
				+ issueDeptName + ", issuePhone=" + issuePhone + ", issueReason=" + issueReason + ", issueEmpNo="
				+ issueEmpNo + ", issueEmpSeq=" + issueEmpSeq + ", processStatus=" + processStatus + "]";
	}
  	
  	
}
