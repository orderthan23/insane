package com.kh.insane.employee.model.vo;

public class AcademicCareer implements java.io.Serializable {
	
	private int academicCareerSeq;
	private int empNoSeq;
	private String institutionName;
	private String major;
	private String subMajor;
	private String entscDate;
	private String graduDate;
	private String graduYN;
	private String degree;
	private int companyNo;
	
	public AcademicCareer() {}

	public AcademicCareer(int academicCareerSeq, int empNoSeq, String institutionName, String major, String subMajor,
			String entscDate, String graduDate, String graduYN, String degree, int companyNo) {
		super();
		this.academicCareerSeq = academicCareerSeq;
		this.empNoSeq = empNoSeq;
		this.institutionName = institutionName;
		this.major = major;
		this.subMajor = subMajor;
		this.entscDate = entscDate;
		this.graduDate = graduDate;
		this.graduYN = graduYN;
		this.degree = degree;
		this.companyNo = companyNo;
	}

	public int getAcademicCareerSeq() {
		return academicCareerSeq;
	}

	public void setAcademicCareerSeq(int academicCareerSeq) {
		this.academicCareerSeq = academicCareerSeq;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getInstitutionName() {
		return institutionName;
	}

	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSubMajor() {
		return subMajor;
	}

	public void setSubMajor(String subMajor) {
		this.subMajor = subMajor;
	}

	public String getEntscDate() {
		return entscDate;
	}

	public void setEntscDate(String entscDate) {
		this.entscDate = entscDate;
	}

	public String getGraduDate() {
		return graduDate;
	}

	public void setGraduDate(String graduDate) {
		this.graduDate = graduDate;
	}

	public String getGraduYN() {
		return graduYN;
	}

	public void setGraduYN(String graduYN) {
		this.graduYN = graduYN;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	@Override
	public String toString() {
		return "AcademicCareer [academicCareerSeq=" + academicCareerSeq + ", empNoSeq=" + empNoSeq
				+ ", institutionName=" + institutionName + ", major=" + major + ", subMajor=" + subMajor
				+ ", entscDate=" + entscDate + ", graduDate=" + graduDate + ", graduYN=" + graduYN + ", degree="
				+ degree + ", companyNo=" + companyNo + "]";
	}
	
}
