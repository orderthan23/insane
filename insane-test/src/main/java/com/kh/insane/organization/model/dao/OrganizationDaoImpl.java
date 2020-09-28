package com.kh.insane.organization.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.exception.OrganizationChartFailed.ShowOrganizationChartFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.InsertDeptSetFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectDeptSetListFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectOneDeptFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.UpdateDeptInfoFailed;
import com.kh.insane.organization.model.vo.Department;
import com.kh.insane.organization.model.vo.OrganizationChart;

@Repository
public class OrganizationDaoImpl implements OrganizationDao {

	@Override
	public int insertDept(SqlSessionTemplate sqlSession, Department dept) throws InsertDeptSetFailed   {
		
		int result = sqlSession.insert("Organization.insertDept", dept);
		
		if(result < 0) {
			throw new InsertDeptSetFailed("부서 추가 실패");
		}
		
		return result;
	}

	@Override
	public ArrayList<Department> selectDeptSetList(SqlSessionTemplate sqlSession, int companyNo) throws SelectDeptSetListFailed {
		
		ArrayList<Department> list = (ArrayList) sqlSession.selectList("Organization.selectDeptSetList", companyNo);
		
		if(list == null) {
			throw new SelectDeptSetListFailed("부서설정 부서리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public Department selectOneDept(SqlSessionTemplate sqlSession, Department dept) throws SelectOneDeptFailed {
		
		Department result = sqlSession.selectOne("Organization.selectOneDept", dept);
		
		if(result == null) {
			throw new SelectOneDeptFailed("부서설정 정보 리스트 조회 실패");
		}
		
		return result;
	}

	@Override
	public int updateDeptInfo(SqlSessionTemplate sqlSession, Department dept) throws UpdateDeptInfoFailed {

		int result = sqlSession.update("Organization.updateDeptInfo", dept);
		
		if(result < 0) {
			throw new UpdateDeptInfoFailed("부서설정 정보 수정 실패");
		}
		
		return result;
	}

	@Override
	public ArrayList<OrganizationChart> showOrganizationChart(SqlSessionTemplate sqlSession, int companyNo) throws ShowOrganizationChartFailed {
		
		ArrayList<OrganizationChart> list = (ArrayList) sqlSession.selectList("Organization.showOrganizationChart", companyNo);
		
		if(list == null) {
			throw new ShowOrganizationChartFailed("조직도 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<OrganizationChart> selectOneOrChart(SqlSessionTemplate sqlSession, Department dept) {
		
		ArrayList<OrganizationChart> list = (ArrayList) sqlSession.selectList("Organization.selectOneOrChart", dept);
		
		return list;
	}

	@Override
	public Employee selectOneDirector(SqlSessionTemplate sqlSession, Department dept) {

		Employee director = sqlSession.selectOne("Organization.selectOneDirector", dept);
		
		return director;
	}

	@Override
	public ArrayList<Employee> selectDeptEmpList(SqlSessionTemplate sqlSession,
			ArrayList<OrganizationChart> orChartList) {
		
		ArrayList<Employee> list = (ArrayList) sqlSession.selectList("Organization.selectDeptEmpList", orChartList);
		
		return list;
	}

	@Override
	public ArrayList<Employee> selectAllOrChart(SqlSessionTemplate sqlSession, int companyNo) {
		
		ArrayList<Employee> list = (ArrayList) sqlSession.selectList("Organization.selectAllOrChart", companyNo);
		
		return list;
	}

}
