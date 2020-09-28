package com.kh.insane.education.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.education.model.vo.Education;
import com.kh.insane.education.model.vo.Evaluation;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.PageInfo;

public interface EducationDao {

	ArrayList<Education> loadEduList(SqlSessionTemplate sqlSession, int companyNo, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession, int companyNo);

	int updateEduStatus(SqlSessionTemplate sqlSession, Education education);

	Education loadEduDetail(SqlSessionTemplate sqlSession, int eduScheduleSeq);

	int cancleEdu(SqlSessionTemplate sqlSession, int eduScheduleSeq);

	ArrayList<Education> loadCompleteEducation(SqlSessionTemplate sqlSession, int companyNo);

	ArrayList<Employee> getLoadOurCompanyEmp(SqlSessionTemplate sqlSession, HashMap<String, Object> keywordInfo);

	int insertCompleteEmp(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	ArrayList<Evaluation> loadEvaluation(SqlSessionTemplate sqlSession, Education edu);

	int updateCompleteInfo(SqlSessionTemplate sqlSession, Evaluation evaluation);

	int deleteCompleteInfo(SqlSessionTemplate sqlSession, Evaluation evaluation);

	int updateChangeIssue(SqlSessionTemplate sqlSession, Education edu);

	ArrayList<HashMap<String, Object>> loadNoticeEduInfo(SqlSessionTemplate sqlSession, int companyNo, PageInfo pi);

	int getNoticeEduListCount(SqlSessionTemplate sqlSession, int companyNo);

	HashMap<String, Object> loadEduNoticeDetail(SqlSessionTemplate sqlSession, int boardSeq);

	int updateEduNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> eduNotice);

	int removeEduNotice(SqlSessionTemplate sqlSession, int boardSeq);

	ArrayList<Education> loadAllEducationCode(SqlSessionTemplate sqlSession, int companyNo);

	int insertEduNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> eduMap);

	int getLastBoardNum(SqlSessionTemplate sqlSession, Integer integer);

	int insertEducationPlan(SqlSessionTemplate sqlSession, Education edu);





	

	
	

}
