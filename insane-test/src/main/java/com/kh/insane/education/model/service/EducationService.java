package com.kh.insane.education.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.insane.company.model.exception.FailedDeleteCodeException;
import com.kh.insane.company.model.exception.FailedInsertCodeException;
import com.kh.insane.company.model.exception.FailedUpdateCodeException;
import com.kh.insane.education.model.vo.Education;
import com.kh.insane.education.model.vo.Evaluation;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.PageInfo;

public interface EducationService {

	int getListCount(int companyNo);
	
	ArrayList<Education> loadEduList(int companyNo, PageInfo pi) throws FailedUpdateCodeException;

	Education loadEduDetail(int eduScheduleSeq);

	void cancleEdu(int eduScheduleSeq) throws FailedUpdateCodeException;

	ArrayList<Education> loadCompleteEducation(int companyNo);

	ArrayList<Employee> getLoadOurCompanyEmp(HashMap<String, Object> keywordInfo);

	void insertCompleteEmp(ArrayList<Integer> empNoSeq, int eduScheduleSeq, int companyNo) throws FailedUpdateCodeException;

	void updateCompleteInfo(Evaluation evaluation) throws FailedUpdateCodeException;

	void deleteCompleteInfo(Evaluation evaluation) throws FailedDeleteCodeException;

	void updateChangeIssue(Education edu) throws FailedUpdateCodeException;

	ArrayList<HashMap<String, Object>> loadNoticeEduInfo(int companyNo, PageInfo pi);

	int getNoticeEduListCount(int companyNo);

	HashMap<String, Object> loadEduNoticeDetail(int boardSeq);

	void updateEduNotice(HashMap<String, Object> eduNotice) throws FailedUpdateCodeException;

	void removeEduNotice(int boardSeq) throws FailedUpdateCodeException;

	ArrayList<Education> loadAllEducationCode(int companyNo);

	void insertEduNotice(HashMap<String, Object> eduMap) throws FailedInsertCodeException;

	void insertEducationPlan(Education edu) throws FailedInsertCodeException;



}
