package com.kh.insane.crtfc.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.crtfc.model.exception.CrtfcException;
import com.kh.insane.crtfc.model.vo.CrtfcVo;
import com.kh.insane.crtfc.model.vo.SearchCondition;
import com.kh.insane.employee.model.vo.Employee;

public interface CrtfcDao {
	//
	Employee tempUser(SqlSessionTemplate sqlSession);

	int insertCareer(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException;

	ArrayList<CrtfcVo> selectList(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession) throws CrtfcException;
	
	ArrayList<CrtfcVo> selectSpecificList(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession) throws CrtfcException;

	int selectListCount(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException;
	
	int selectSpecificListCount(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException;

	CrtfcVo selectOneCrtfc(int crtfcSeq, SqlSessionTemplate sqlSession) throws CrtfcException;

	Employee selectRequestor(int empNoSeq, SqlSessionTemplate sqlSession) throws CrtfcException;

	CrtfcVo selectOneCrtfcDetail(int crtfcSeq, SqlSessionTemplate sqlSession) throws CrtfcException;

	int insertReWritecrtfc(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException;

	int updateCrtfc(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException;

	int insertEmployment(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException;

	int insertLeaving(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException;

	CrtfcVo requestLeaving(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException;

	CrtfcVo selectRequestCrtfc(CrtfcVo cv, SqlSessionTemplate sqlSession);
	
	CrtfcVo selectOneBefore(CrtfcVo cv, SqlSessionTemplate sqlSession);

	CrtfcVo selectCrtfcInfo(CrtfcVo cv, SqlSessionTemplate sqlSession);

	int updateCrtfcCancle(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException;

	int insertLeavingCancle(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException;

	int selectListCountEmp(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException;

	int selectSpecificListCountEmp(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException;

	ArrayList<CrtfcVo> selectListEmp(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession) throws CrtfcException;
	
	ArrayList<CrtfcVo> selectSpecificListEmp(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession) throws CrtfcException;

	ArrayList<Employee> selectRetireEmp(int companyNo, SqlSessionTemplate sqlSession);
}
