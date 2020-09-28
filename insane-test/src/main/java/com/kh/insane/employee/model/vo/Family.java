package com.kh.insane.employee.model.vo;

public class Family implements java.io.Serializable {
	
	private int familySeq;
	private String insertDate;
	private int empNoSeq;
	private String relation;
	private String residentNo;
	private String basicDeductionYN;
	private String hshldrYN;
	private String womenHshldrYN;
	private String onePrntYN;
	private String disorderYN;
	private String olderYN;
	private String ageSixYN;
	private String childAdoptYN;
	private int companyNo;
	private String famName;
	
	public Family() {}

	public Family(int familySeq, String insertDate, int empNoSeq, String relation, String residentNo,
			String basicDeductionYN, String hshldrYN, String womenHshldrYN, String onePrntYN, String disorderYN,
			String olderYN, String ageSixYN, String childAdoptYN, int companyNo, String famName) {
		super();
		this.familySeq = familySeq;
		this.insertDate = insertDate;
		this.empNoSeq = empNoSeq;
		this.relation = relation;
		this.residentNo = residentNo;
		this.basicDeductionYN = basicDeductionYN;
		this.hshldrYN = hshldrYN;
		this.womenHshldrYN = womenHshldrYN;
		this.onePrntYN = onePrntYN;
		this.disorderYN = disorderYN;
		this.olderYN = olderYN;
		this.ageSixYN = ageSixYN;
		this.childAdoptYN = childAdoptYN;
		this.companyNo = companyNo;
		this.famName = famName;
	}

	public int getFamilySeq() {
		return familySeq;
	}

	public void setFamilySeq(int familySeq) {
		this.familySeq = familySeq;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public int getEmpNoSeq() {
		return empNoSeq;
	}

	public void setEmpNoSeq(int empNoSeq) {
		this.empNoSeq = empNoSeq;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getResidentNo() {
		return residentNo;
	}

	public void setResidentNo(String residentNo) {
		this.residentNo = residentNo;
	}

	public String getBasicDeductionYN() {
		return basicDeductionYN;
	}

	public void setBasicDeductionYN(String basicDeductionYN) {
		this.basicDeductionYN = basicDeductionYN;
	}

	public String getHshldrYN() {
		return hshldrYN;
	}

	public void setHshldrYN(String hshldrYN) {
		this.hshldrYN = hshldrYN;
	}

	public String getWomenHshldrYN() {
		return womenHshldrYN;
	}

	public void setWomenHshldrYN(String womenHshldrYN) {
		this.womenHshldrYN = womenHshldrYN;
	}

	public String getOnePrntYN() {
		return onePrntYN;
	}

	public void setOnePrntYN(String onePrntYN) {
		this.onePrntYN = onePrntYN;
	}

	public String getDisorderYN() {
		return disorderYN;
	}

	public void setDisorderYN(String disorderYN) {
		this.disorderYN = disorderYN;
	}

	public String getOlderYN() {
		return olderYN;
	}

	public void setOlderYN(String olderYN) {
		this.olderYN = olderYN;
	}

	public String getAgeSixYN() {
		return ageSixYN;
	}

	public void setAgeSixYN(String ageSixYN) {
		this.ageSixYN = ageSixYN;
	}

	public String getChildAdoptYN() {
		return childAdoptYN;
	}

	public void setChildAdoptYN(String childAdoptYN) {
		this.childAdoptYN = childAdoptYN;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getFamName() {
		return famName;
	}

	public void setFamName(String famName) {
		this.famName = famName;
	}

	@Override
	public String toString() {
		return "Family [familySeq=" + familySeq + ", insertDate=" + insertDate + ", empNoSeq=" + empNoSeq
				+ ", relation=" + relation + ", residentNo=" + residentNo + ", basicDeductionYN=" + basicDeductionYN
				+ ", hshldrYN=" + hshldrYN + ", womenHshldrYN=" + womenHshldrYN + ", onePrntYN=" + onePrntYN
				+ ", disorderYN=" + disorderYN + ", olderYN=" + olderYN + ", ageSixYN=" + ageSixYN + ", childAdoptYN="
				+ childAdoptYN + ", companyNo=" + companyNo + ", famName=" + famName + "]";
	}
	
}
