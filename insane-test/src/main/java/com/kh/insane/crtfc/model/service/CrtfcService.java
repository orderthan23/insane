package com.kh.insane.crtfc.model.service;

import java.util.ArrayList;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.crtfc.model.exception.CrtfcException;
import com.kh.insane.crtfc.model.vo.CrtfcVo;
import com.kh.insane.crtfc.model.vo.SearchCondition;
import com.kh.insane.employee.model.vo.Employee;

public interface CrtfcService {

	Employee tempUser();

	int insertCareer(CrtfcVo cv) throws CrtfcException;

	ArrayList<CrtfcVo> selectSpecificList(SearchCondition sc, PageInfo pi) throws CrtfcException;

	ArrayList<CrtfcVo> selectList(SearchCondition sc, PageInfo pi) throws CrtfcException;

	int selectListCount(SearchCondition sc) throws CrtfcException;

	int selectSpecificListCount(SearchCondition sc) throws CrtfcException;

	CrtfcVo selectOneCrtfc(int crtfcSeq) throws CrtfcException;

	Employee selectRequestor(int empNoSeq) throws CrtfcException;

	CrtfcVo selectOneCrtfcDetail(int crtfcSeq) throws CrtfcException;

	int insertReWritecrtfc(CrtfcVo crtfc) throws CrtfcException;

	int updateCrtfc(CrtfcVo crtfc) throws CrtfcException;

	int insertEmployment(CrtfcVo cv) throws CrtfcException;

	int insertLeaving(CrtfcVo cv) throws CrtfcException;

	CrtfcVo requestLeaving(CrtfcVo cv) throws CrtfcException;

	CrtfcVo selectRequestCrtfc(CrtfcVo cv);

	CrtfcVo selectOneBefore(CrtfcVo cv);

	CrtfcVo selectCrtfcInfo(CrtfcVo cv);

	int updateCrtfcCancle(CrtfcVo crtfc) throws CrtfcException;

	int insertLeavingCancle(CrtfcVo crtfc) throws CrtfcException;

	int selectListCountEmp(SearchCondition sc) throws CrtfcException;

	int selectSpecificListCountEmp(SearchCondition sc) throws CrtfcException;

	ArrayList<CrtfcVo> selectListEmp(SearchCondition sc, PageInfo pi) throws CrtfcException;

	ArrayList<CrtfcVo> selectSpecificListEmp(SearchCondition sc, PageInfo pi) throws CrtfcException;

	ArrayList<Employee> selectRetireEmp(int companyNo);
}
