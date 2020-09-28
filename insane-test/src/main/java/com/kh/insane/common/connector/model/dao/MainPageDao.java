package com.kh.insane.common.connector.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.ProfileAttachment;

/**
 * Class : MainPageService
 * @author 고종현
 * @version 1.0.0
 * @since 2020.09.05
 * @apiNote 메인페이지와 타페이지의 연결을 담당하는 dao
 */
public interface MainPageDao {

	ProfileAttachment loadMyProfile(SqlSessionTemplate sqlSession, Employee emp);

	ArrayList<HashMap<String,Object>> loadNews(SqlSessionTemplate sqlSession, Employee emp, int index);

	String loadFirstPwd(SqlSessionTemplate sqlSession, int companyNo);

	int updatePwd(SqlSessionTemplate sqlSession, Employee updateEmp);

	int checkDuplicateData(SqlSessionTemplate sqlSession, HashMap<String, Object> workData);

	int insertExtraWork(SqlSessionTemplate sqlSession, HashMap<String, Object> workData);

}
