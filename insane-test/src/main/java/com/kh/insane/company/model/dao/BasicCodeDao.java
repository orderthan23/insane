package com.kh.insane.company.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

/**
 * Class : BasicCodeDao
 * @author 고종현
 * @version 1.0.1
 * @since 2020.09.01
 * @implNote 회사의 기초 코드들을 관리하는  dao
 */
public interface BasicCodeDao {

	ArrayList<HashMap<String, String>> loadCodeList(SqlSessionTemplate sqlSession, int companyNo, String codeType);

	int insertCode(SqlSessionTemplate sqlSession, String codeType, HashMap<String, Object> insertInfo);

	int updateCode(SqlSessionTemplate sqlSession, String codeType, HashMap<String, Object> statusMap);

	int findMaxPayStep(SqlSessionTemplate sqlSession, int companyNo);

	int howManyUpdateCount(SqlSessionTemplate sqlSession, String codeType, HashMap<String, Object> statusMap);

	int findRealMax(SqlSessionTemplate sqlSession, int companyNo);

	int countPayStep(SqlSessionTemplate sqlSession, int companyNo);



}
