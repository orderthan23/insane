package com.kh.insane.organization.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.exception.OrganizationChartFailed.ShowOrganizationChartFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.InsertDeptSetFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectDeptSetListFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectOneDeptFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.UpdateDeptInfoFailed;
import com.kh.insane.organization.model.vo.Department;
import com.kh.insane.organization.model.vo.OrganizationChart;

public interface OrganizationDao {

	int insertDept(SqlSessionTemplate sqlSession, Department dept) throws InsertDeptSetFailed;

	ArrayList<Department> selectDeptSetList(SqlSessionTemplate sqlSession, int companyNo) throws SelectDeptSetListFailed;

	Department selectOneDept(SqlSessionTemplate sqlSession, Department dept) throws SelectOneDeptFailed;

	int updateDeptInfo(SqlSessionTemplate sqlSession, Department dept) throws UpdateDeptInfoFailed;

	ArrayList<OrganizationChart> showOrganizationChart(SqlSessionTemplate sqlSession, int companyNo) throws ShowOrganizationChartFailed;

	ArrayList<OrganizationChart> selectOneOrChart(SqlSessionTemplate sqlSession, Department dept);

	Employee selectOneDirector(SqlSessionTemplate sqlSession, Department dept);

	ArrayList<Employee> selectDeptEmpList(SqlSessionTemplate sqlSession, ArrayList<OrganizationChart> orChartList);

	ArrayList<Employee> selectAllOrChart(SqlSessionTemplate sqlSession, int companyNo);

}
