package com.kh.insane.crtfc.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.crtfc.model.exception.CrtfcException;
import com.kh.insane.crtfc.model.vo.CrtfcVo;
import com.kh.insane.crtfc.model.vo.SearchCondition;
import com.kh.insane.employee.model.vo.Employee;

import static com.kh.insane.common.CustomUtil.Inst;

@Repository
public class CrtfcDaoImpl implements CrtfcDao {
//
	@Override
	public Employee tempUser(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		Employee emp = new Employee();
		
		emp.setEmpNo("100098");
		emp.setEmpPwd("pass01");
		emp.setCompanyNo(1001);
		
		return sqlSession.selectOne("Employee.loginEmployeeCheck", emp);
	}		

	@Override
	public int insertCareer(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		return sqlSession.insert("CrtfcVo.insertCareer", cv);
	}
	
	@Override
	public ArrayList<CrtfcVo> selectList(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession) throws CrtfcException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimits();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimits());
		
		ArrayList<CrtfcVo> list = (ArrayList) sqlSession.selectList("CrtfcVo.selectList", sc, rowBounds);
		
		//selectEmploymentList
		//selectLeavingList
		return list;
	}

	@Override
	public ArrayList<CrtfcVo> selectSpecificList(SearchCondition sc, PageInfo pi,  SqlSessionTemplate sqlSession) {
		
		//ArrayList<CtrfcVo> list = (ArrayList) sqlSession.selectList("CtrfcVo.selectList", companyNo);
		
//		CtrfcVo cv = new CtrfcVo();
//		cv.setCompanyNo(sc.getCompanyNo());
//		cv.setCrtfcNo(sc.getCrtfcNo());
		
		//currentPage는 1부터 시작하므로 1을 빼고 Limits를 곱해서 시작 위치를 정해준다.
		int offset = (pi.getCurrentPage() - 1) * pi.getLimits();
		
		//페이지에서 보여질 시작~끝.
		RowBounds rowBounds = new RowBounds(offset, pi.getLimits());
		
		ArrayList<CrtfcVo> list = (ArrayList) sqlSession.selectList("CrtfcVo.selectSpecificList", sc, rowBounds);
		//selectEmploymentList
		//selectLeavingList
		return list;
	}

	@Override
	public int selectListCount(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException {
		
		int resultCount = sqlSession.selectOne("CrtfcVo.selectListCount", sc);
		
		return resultCount;
	}
	
	@Override
	public int selectSpecificListCount(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException {
		int resultCount = sqlSession.selectOne("CrtfcVo.selectSpecificListCount", sc);
		
		return resultCount;
	}

	@Override
	public CrtfcVo selectOneCrtfc(int crtfcSeq, SqlSessionTemplate sqlSession) throws CrtfcException {
		CrtfcVo cv = sqlSession.selectOne("CrtfcVo.selectOneCrtfc", crtfcSeq);
		return cv;
	}

	@Override
	public Employee selectRequestor(int empNoSeq, SqlSessionTemplate sqlSession) throws CrtfcException {
		
		Employee emp = sqlSession.selectOne("Employee.selectEmployeeUseSeq", empNoSeq);
		
		return emp;
	}

	@Override
	public CrtfcVo selectOneCrtfcDetail(int crtfcSeq, SqlSessionTemplate sqlSession) throws CrtfcException {
		CrtfcVo cv = sqlSession.selectOne("CrtfcVo.selectOneCrtfcDetail", crtfcSeq);		
		return cv;
	}

	@Override
	public int insertReWritecrtfc(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("CrtfcVo.insertReWriteCrtfc", crtfc);
		
		return result;
	}

	@Override
	public int updateCrtfc(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		int result = sqlSession.update("CrtfcVo.updateCrtfc", crtfc);
		
		return result;
	}

	@Override
	public int insertEmployment(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		return sqlSession.insert("CrtfcVo.insertEmployment", cv);
	}

	@Override
	public int insertLeaving(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		return sqlSession.insert("CrtfcVo.insertLeaving", cv);
	}

	@Override
	public CrtfcVo requestLeaving(CrtfcVo cv, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CrtfcVo.selectOneLevaingFirst", cv);
	}

	@Override
	public CrtfcVo selectRequestCrtfc(CrtfcVo cv, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CrtfcVo.selectCrtfcRequest", cv);
	}

	@Override
	public CrtfcVo selectOneBefore(CrtfcVo cv, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CrtfcVo.selectOneCrtfcDetailBefore", cv);
	}

	@Override
	public CrtfcVo selectCrtfcInfo(CrtfcVo cv, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CrtfcVo.selectCrtfcType", cv);
	}

	@Override
	public int updateCrtfcCancle(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		int result = sqlSession.update("CrtfcVo.updateCancleCrtfc", crtfc);
		
		return result;
	}

	@Override
	public int insertLeavingCancle(CrtfcVo crtfc, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		return sqlSession.insert("CrtfcVo.insertLeavingCancle", crtfc);
	}

	@Override
	public int selectListCountEmp(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		int resultCount = sqlSession.selectOne("CrtfcVo.selectListCountEmp", sc);
		
		return resultCount;
	}

	@Override
	public int selectSpecificListCountEmp(SearchCondition sc, SqlSessionTemplate sqlSession) throws CrtfcException {
		// TODO Auto-generated method stub
		int resultCount = sqlSession.selectOne("CrtfcVo.selectSpecificListCountEmp", sc);
		
		return resultCount;
	}

	@Override
	public ArrayList<CrtfcVo> selectListEmp(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession)
			throws CrtfcException {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getLimits();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimits());
		
		ArrayList<CrtfcVo> list = (ArrayList) sqlSession.selectList("CrtfcVo.selectListEmp", sc, rowBounds);
		
		//selectEmploymentList
		//selectLeavingList
		return list;
	}

	@Override
	public ArrayList<CrtfcVo> selectSpecificListEmp(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession)
			throws CrtfcException {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getLimits();
		
		//페이지에서 보여질 시작~끝.
		RowBounds rowBounds = new RowBounds(offset, pi.getLimits());
		
		ArrayList<CrtfcVo> list = (ArrayList) sqlSession.selectList("CrtfcVo.selectSpecificListEmp", sc, rowBounds);
		//selectEmploymentList
		//selectLeavingList
		return list;
	}

	@Override
	public ArrayList<Employee> selectRetireEmp(int companyNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		
		return (ArrayList)sqlSession.selectList("CrtfcVo.selectRetireEmp", companyNo);
	}
	
}
