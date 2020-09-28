package com.kh.insane.education.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Education implements java.io.Serializable {
	private String eduStatus;
	private int documentHistorySeq;
	private int educationSeq;
	private String changeIssue;
	private String educationType;
	private String eduTitle;
	private String eduContent;
	private Date eduStartDate;
	private Date eduEndDate;
	private String eduPlace;
	private String inOfficeYn;
	private int targetAmount;
	private String instrInfo;
	private int eduScheduleSeq;
	private int eduCost;
	private int companyNo;
	
	private ArrayList<Evaluation> evaluations;

	public Education() {

	}
	
	

	public Education(String eduStatus, int documentHistorySeq, int educationSeq, String changeIssue,
			String educationType, String eduTitle, String eduContent, Date eduStartDate, Date eduEndDate,
			String eduPlace, String inOfficeYn, int targetAmount, String instrInfo, int eduScheduleSeq, int eduCost,
			int companyNo, ArrayList<Evaluation> evaluations) {
		super();
		this.eduStatus = eduStatus;
		this.documentHistorySeq = documentHistorySeq;
		this.educationSeq = educationSeq;
		this.changeIssue = changeIssue;
		this.educationType = educationType;
		this.eduTitle = eduTitle;
		this.eduContent = eduContent;
		this.eduStartDate = eduStartDate;
		this.eduEndDate = eduEndDate;
		this.eduPlace = eduPlace;
		this.inOfficeYn = inOfficeYn;
		this.targetAmount = targetAmount;
		this.instrInfo = instrInfo;
		this.eduScheduleSeq = eduScheduleSeq;
		this.eduCost = eduCost;
		this.companyNo = companyNo;
		this.evaluations = evaluations;
	}



	@Override
	public String toString() {
		return "Education [eduStatus=" + eduStatus + ", documentHistorySeq=" + documentHistorySeq + ", educationSeq="
				+ educationSeq + ", changeIssue=" + changeIssue + ", educationType=" + educationType + ", eduTitle="
				+ eduTitle + ", eduContent=" + eduContent + ", eduStartDate=" + eduStartDate + ", eduEndDate="
				+ eduEndDate + ", eduPlace=" + eduPlace + ", inOfficeYn=" + inOfficeYn + ", targetAmount="
				+ targetAmount + ", instrInfo=" + instrInfo + ", eduScheduleSeq=" + eduScheduleSeq + ", eduCost="
				+ eduCost + ", companyNo=" + companyNo + ", evaluations=" + evaluations + "]";
	}



	public String getEduStatus() {
		return eduStatus;
	}



	public void setEduStatus(String eduStatus) {
		this.eduStatus = eduStatus;
	}



	public int getDocumentHistorySeq() {
		return documentHistorySeq;
	}



	public void setDocumentHistorySeq(int documentHistorySeq) {
		this.documentHistorySeq = documentHistorySeq;
	}



	public int getEducationSeq() {
		return educationSeq;
	}



	public void setEducationSeq(int educationSeq) {
		this.educationSeq = educationSeq;
	}



	public String getChangeIssue() {
		return changeIssue;
	}



	public void setChangeIssue(String changeIssue) {
		this.changeIssue = changeIssue;
	}



	public String getEducationType() {
		return educationType;
	}



	public void setEducationType(String educationType) {
		this.educationType = educationType;
	}



	public String getEduTitle() {
		return eduTitle;
	}



	public void setEduTitle(String eduTitle) {
		this.eduTitle = eduTitle;
	}



	public String getEduContent() {
		return eduContent;
	}



	public void setEduContent(String eduContent) {
		this.eduContent = eduContent;
	}



	public Date getEduStartDate() {
		return eduStartDate;
	}



	public void setEduStartDate(Date eduStartDate) {
		this.eduStartDate = eduStartDate;
	}



	public Date getEduEndDate() {
		return eduEndDate;
	}



	public void setEduEndDate(Date eduEndDate) {
		this.eduEndDate = eduEndDate;
	}



	public String getEduPlace() {
		return eduPlace;
	}



	public void setEduPlace(String eduPlace) {
		this.eduPlace = eduPlace;
	}



	public String getInOfficeYn() {
		return inOfficeYn;
	}



	public void setInOfficeYn(String inOfficeYn) {
		this.inOfficeYn = inOfficeYn;
	}



	public int getTargetAmount() {
		return targetAmount;
	}



	public void setTargetAmount(int targetAmount) {
		this.targetAmount = targetAmount;
	}



	public String getInstrInfo() {
		return instrInfo;
	}



	public void setInstrInfo(String instrInfo) {
		this.instrInfo = instrInfo;
	}



	public int getEduScheduleSeq() {
		return eduScheduleSeq;
	}



	public void setEduScheduleSeq(int eduScheduleSeq) {
		this.eduScheduleSeq = eduScheduleSeq;
	}



	public int getEduCost() {
		return eduCost;
	}



	public void setEduCost(int eduCost) {
		this.eduCost = eduCost;
	}



	public int getCompanyNo() {
		return companyNo;
	}



	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}



	public ArrayList<Evaluation> getEvaluations() {
		return evaluations;
	}



	public void setEvaluations(ArrayList<Evaluation> evaluations) {
		this.evaluations = evaluations;
	}
	
	
	
	
	
	
	

}