package com.kh.insane.company.model.vo;

/**
 * Class : CompanyController
 * @author 고종현
 * @version 1.0.1
 * @since 2020.08.20
 * @apiNote 계약된 회사의 관리자 계정의 정보를 담고있는 VO 객체
 */
public class CompanyAccount implements java.io.Serializable {

	private int companyNo; 		//회사번호
	private String companyName; //회사명
	private String cadminId; 	//회사관리자아이디
	private String cadminPwd;	//회사관리자비밀번호
	private String companyStatus; //회사 활성화 여부 체크 
	
	public CompanyAccount() {
		// TODO Auto-generated constructor stub
	}

	public CompanyAccount(int companyNo, String companyName, String cadminId, String cadminPwd, String companyStatus) {
		super();
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.cadminId = cadminId;
		this.cadminPwd = cadminPwd;
		this.companyStatus = companyStatus;
	}

	@Override
	public String toString() {
		return "CompanyAccount [companyNo=" + companyNo + ", companyName=" + companyName + ", cadminId=" + cadminId
				+ ", cadminPwd=" + cadminPwd + ", companyStatus=" + companyStatus + "]";
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

	public String getCadminId() {
		return cadminId;
	}

	public void setCadminId(String cadminId) {
		this.cadminId = cadminId;
	}

	public String getCadminPwd() {
		return cadminPwd;
	}

	public void setCadminPwd(String cadminPwd) {
		this.cadminPwd = cadminPwd;
	}

	public String getCompanyStatus() {
		return companyStatus;
	}

	public void setCompanyStatus(String companyStatus) {
		this.companyStatus = companyStatus;
	}
	
	
	
	
}
