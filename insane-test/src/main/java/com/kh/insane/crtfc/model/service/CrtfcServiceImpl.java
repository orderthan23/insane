package com.kh.insane.crtfc.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.crtfc.model.dao.CrtfcDao;
import com.kh.insane.crtfc.model.exception.CrtfcException;
import com.kh.insane.crtfc.model.vo.CrtfcVo;
import com.kh.insane.crtfc.model.vo.SearchCondition;
import com.kh.insane.employee.model.vo.Employee;

@Service
public class CrtfcServiceImpl implements CrtfcService {
//
	@Autowired
	private CrtfcDao cd;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Employee tempUser() {

		Employee emp= cd.tempUser(sqlSession);
		
		return emp;
	}

	@Override
	public int insertCareer(CrtfcVo cv) throws CrtfcException {
		
		int result = cd.insertCareer(cv, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("증명서 등록 실패!");
		}
		
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public ArrayList<CrtfcVo> selectList(SearchCondition sc, PageInfo pi) throws CrtfcException {
		ArrayList<CrtfcVo> list = cd.selectList(sc, pi, sqlSession);
		
		if(list == null) {
			throw new CrtfcException("List 페이지 불러오기 실패!");
		}
		
		return list;
	}
	
	@Override
	public ArrayList<CrtfcVo> selectSpecificList(SearchCondition sc, PageInfo pi) throws CrtfcException {
		
		ArrayList<CrtfcVo> list = cd.selectSpecificList(sc, pi, sqlSession);//cd.selectCarrerList(companyNo, sqlSession);
		
		if(list == null) {
			throw new CrtfcException("List 페이지 불러오기 실패!");
		}
		
		return list;
	}

	@Override
	public int selectListCount(SearchCondition sc) throws CrtfcException {
		
		int resultCount = cd.selectListCount(sc, sqlSession);
		
		return resultCount;
	}

	@Override
	public int selectSpecificListCount(SearchCondition sc) throws CrtfcException {
		// TODO Auto-generated method stub
		int resultCount = cd.selectSpecificListCount(sc, sqlSession);
		
		return resultCount;
	}

	@Override
	public CrtfcVo selectOneCrtfc(int crtfcSeq) throws CrtfcException {
		
		CrtfcVo cv = cd.selectOneCrtfc(crtfcSeq, sqlSession);
		
		return cv;
	}

	@Override
	public Employee selectRequestor(int empNoSeq) throws CrtfcException {
		
		Employee emp = cd.selectRequestor(empNoSeq, sqlSession);
		
		return emp;
	}

	@Override
	public CrtfcVo selectOneCrtfcDetail(int crtfcSeq) throws CrtfcException {
		CrtfcVo cv = cd.selectOneCrtfcDetail(crtfcSeq, sqlSession);
		
		return cv;
	}

	@Override
	public int insertReWritecrtfc(CrtfcVo crtfc) throws CrtfcException {
		
		int result = cd.insertReWritecrtfc(crtfc, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("결재처리 실패!-Insert");
		}
		
		return result;
	}

	@Override
	public int updateCrtfc(CrtfcVo crtfc) throws CrtfcException {
		
		int result = cd.updateCrtfc(crtfc, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("결재처리 실패!-Update");
		}
		
		return result;
	}

	@Override
	public int insertEmployment(CrtfcVo cv) throws CrtfcException {
		int result = cd.insertEmployment(cv, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("증명서 등록 실패!");
		}
		
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int insertLeaving(CrtfcVo cv) throws CrtfcException {
		int result = cd.insertLeaving(cv, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("증명서 등록 실패!");
		}
		
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public CrtfcVo requestLeaving(CrtfcVo cv) throws CrtfcException {
		// TODO Auto-generated method stub
		CrtfcVo result = cd.requestLeaving(cv, sqlSession);
		
		if(result != null) {
			
		} else {
			throw new CrtfcException("증명서 등록 실패!");
		}
		
		// TODO Auto-generated method stub
		return result;		
	}

	@Override
	public CrtfcVo selectRequestCrtfc(CrtfcVo cv) {
		CrtfcVo result = cd.selectRequestCrtfc(cv, sqlSession);
		return result;
	}

	@Override
	public CrtfcVo selectOneBefore(CrtfcVo cv) {
		CrtfcVo result = cd.selectOneBefore(cv, sqlSession);
		return result;
	}

	@Override
	public CrtfcVo selectCrtfcInfo(CrtfcVo cv) {
		CrtfcVo result = cd.selectCrtfcInfo(cv, sqlSession);
		return result;
	}

	@Override
	public int updateCrtfcCancle(CrtfcVo crtfc) throws CrtfcException {
		// TODO Auto-generated method stub
		int result = cd.updateCrtfcCancle(crtfc, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("결재거부처리 실패!-Update");
		}
		
		return result;
	}

	@Override
	public int insertLeavingCancle(CrtfcVo crtfc) throws CrtfcException {
		// TODO Auto-generated method stub
		int result = cd.insertLeavingCancle(crtfc, sqlSession);
		
		if(result > 0) {
			
		} else {
			throw new CrtfcException("증명서 등록 실패!");
		}
		
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int selectListCountEmp(SearchCondition sc) throws CrtfcException {
		int resultCount = cd.selectListCountEmp(sc, sqlSession);
		
		return resultCount;
	}

	@Override
	public int selectSpecificListCountEmp(SearchCondition sc) throws CrtfcException {
		// TODO Auto-generated method stub
		int resultCount = cd.selectSpecificListCountEmp(sc, sqlSession);
		
		return resultCount;
	}

	@Override
	public ArrayList<CrtfcVo> selectListEmp(SearchCondition sc, PageInfo pi) throws CrtfcException {
		// TODO Auto-generated method stub
		ArrayList<CrtfcVo> list = cd.selectListEmp(sc, pi, sqlSession);
		
		if(list == null) {
			throw new CrtfcException("List 페이지 불러오기 실패!");
		}
		
		return list;
	}

	@Override
	public ArrayList<CrtfcVo> selectSpecificListEmp(SearchCondition sc, PageInfo pi) throws CrtfcException {
		// TODO Auto-generated method stub
		ArrayList<CrtfcVo> list = cd.selectSpecificListEmp(sc, pi, sqlSession);//cd.selectCarrerList(companyNo, sqlSession);
		
		if(list == null) {
			throw new CrtfcException("List 페이지 불러오기 실패!");
		}
		
		return list;
	}

	@Override
	public ArrayList<Employee> selectRetireEmp(int companyNo) {
		ArrayList<Employee> list = cd.selectRetireEmp(companyNo, sqlSession);
		return list;
	}	
	
}
