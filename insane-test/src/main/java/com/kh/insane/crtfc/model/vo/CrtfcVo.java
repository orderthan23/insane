package com.kh.insane.crtfc.model.vo;
import java.sql.Date;

public class CrtfcVo implements java.io.Serializable {
	
	int crtfcSeq;
	int crtfcNo;
	String crtfcType;
	Date applyDate; //신청일자
	Date crtfcEnrollDate; //등록일자(양식 변경 기준. 대표이사의 번호가 바뀔 수 있으므로 그걸 저장한다고 함.)
	int empNoSeq;
	String empName; //직원이름
	String residentNo;//주민번호
	int empPositionCode; //직급코드.
	String positionName; //직급명.	
	String address; //주소
	String phone; //전화번호(휴대폰)
	String empEnrollDate;
	String empRetireDate;
	int empDeptCode;
	String empDeptName;
	
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
  	String issuePositionName;
  	int issueEmpNo;
  	int issueEmpSeq;
  	
  	String processStatus;

	public CrtfcVo() {
	
	}

	public CrtfcVo(int crtfcSeq, int crtfcNo, String crtfcType, Date applyDate, Date crtfcEnrollDate, int empNoSeq,
			String empName, String residentNo, int empPositionCode, String positionName, String address, String phone,
			String empEnrollDate, String empRetireDate, int empDeptCode, String empDeptName, int companyNo,
			String companyName, String businessAddress, int ceoSeq, int ceoEmpNo, String ceoName, String ceoPhone,
			Date issueDate, String issueEmpRspofc, String issueDeptName, String issuePhone, String issueReason,
			String issueName, String issuePositionName, int issueEmpNo, int issueEmpSeq, String processStatus) {
		super();
		this.crtfcSeq = crtfcSeq;
		this.crtfcNo = crtfcNo;
		this.crtfcType = crtfcType;
		this.applyDate = applyDate;
		this.crtfcEnrollDate = crtfcEnrollDate;
		this.empNoSeq = empNoSeq;
		this.empName = empName;
		this.residentNo = residentNo;
		this.empPositionCode = empPositionCode;
		this.positionName = positionName;
		this.address = address;
		this.phone = phone;
		this.empEnrollDate = empEnrollDate;
		this.empRetireDate = empRetireDate;
		this.empDeptCode = empDeptCode;
		this.empDeptName = empDeptName;
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.businessAddress = businessAddress;
		this.ceoSeq = ceoSeq;
		this.ceoEmpNo = ceoEmpNo;
		this.ceoName = ceoName;
		this.ceoPhone = ceoPhone;
		this.issueDate = issueDate;
		this.issueEmpRspofc = issueEmpRspofc;
		this.issueDeptName = issueDeptName;
		this.issuePhone = issuePhone;
		this.issueReason = issueReason;
		this.issueName = issueName;
		this.issuePositionName = issuePositionName;
		this.issueEmpNo = issueEmpNo;
		this.issueEmpSeq = issueEmpSeq;
		this.processStatus = processStatus;
	}

	public int getCrtfcSeq() {
		return crtfcSeq;
	}

	public void setCrtfcSeq(int crtfcSeq) {
		this.crtfcSeq = crtfcSeq;
	}

	public int getCrtfcNo() {
		return crtfcNo;
	}

	public void setCrtfcNo(int crtfcNo) {
		this.crtfcNo = crtfcNo;
	}

	public String getCrtfcType() {
		return crtfcType;
	}

	public void setCrtfcType(String crtfcType) {
		this.crtfcType = crtfcType;
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

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
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

	public int getEmpPositionCode() {
		return empPositionCode;
	}

	public void setEmpPositionCode(int empPositionCode) {
		this.empPositionCode = empPositionCode;
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

	public int getEmpDeptCode() {
		return empDeptCode;
	}

	public void setEmpDeptCode(int empDeptCode) {
		this.empDeptCode = empDeptCode;
	}

	public String getEmpDeptName() {
		return empDeptName;
	}

	public void setEmpDeptName(String empDeptName) {
		this.empDeptName = empDeptName;
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

	public int getCeoEmpNo() {
		return ceoEmpNo;
	}

	public void setCeoEmpNo(int ceoEmpNo) {
		this.ceoEmpNo = ceoEmpNo;
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

	public String getIssueName() {
		return issueName;
	}

	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}

	public String getIssuePositionName() {
		return issuePositionName;
	}

	public void setIssuePositionName(String issuePositionName) {
		this.issuePositionName = issuePositionName;
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

	@Override
	public String toString() {
		return "CrtfcVo [crtfcSeq=" + crtfcSeq + ", crtfcNo=" + crtfcNo + ", crtfcType=" + crtfcType + ", applyDate="
				+ applyDate + ", crtfcEnrollDate=" + crtfcEnrollDate + ", empNoSeq=" + empNoSeq + ", empName=" + empName
				+ ", residentNo=" + residentNo + ", empPositionCode=" + empPositionCode + ", positionName="
				+ positionName + ", address=" + address + ", phone=" + phone + ", empEnrollDate=" + empEnrollDate
				+ ", empRetireDate=" + empRetireDate + ", empDeptCode=" + empDeptCode + ", empDeptName=" + empDeptName
				+ ", companyNo=" + companyNo + ", companyName=" + companyName + ", businessAddress=" + businessAddress
				+ ", ceoSeq=" + ceoSeq + ", ceoEmpNo=" + ceoEmpNo + ", ceoName=" + ceoName + ", ceoPhone=" + ceoPhone
				+ ", issueDate=" + issueDate + ", issueEmpRspofc=" + issueEmpRspofc + ", issueDeptName=" + issueDeptName
				+ ", issuePhone=" + issuePhone + ", issueReason=" + issueReason + ", issueName=" + issueName
				+ ", issuePositionName=" + issuePositionName + ", issueEmpNo=" + issueEmpNo + ", issueEmpSeq="
				+ issueEmpSeq + ", processStatus=" + processStatus + "]";
	}
	
	
}
