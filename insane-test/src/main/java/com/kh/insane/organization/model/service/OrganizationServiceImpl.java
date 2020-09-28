package com.kh.insane.organization.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.insane.employee.model.dao.EmployeeDao;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.ProfileAttachment;
import com.kh.insane.organization.model.dao.OrganizationDao;
import com.kh.insane.organization.model.exception.OrganizationChartFailed.ShowOrganizationChartFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.InsertDeptSetFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectDeptSetListFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectOneDeptFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.UpdateDeptInfoFailed;
import com.kh.insane.organization.model.vo.Department;
import com.kh.insane.organization.model.vo.OrganizationChart;

@Service
public class OrganizationServiceImpl implements OrganizationService {
	
	@Autowired
	private OrganizationDao od;
	@Autowired
	private EmployeeDao ed;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertDept(Department dept) throws InsertDeptSetFailed  {
		
		return od.insertDept(sqlSession, dept);
	}

	@Override
	public ArrayList<Department> selectDeptSetList(int companyNo) throws SelectDeptSetListFailed {
		
		return od.selectDeptSetList(sqlSession, companyNo);
	}

	@Override
	public Department selectOneDept(Department dept) throws SelectOneDeptFailed {
		
		return od.selectOneDept(sqlSession, dept);
	}

	@Override
	public int updateDeptInfo(Department dept) throws UpdateDeptInfoFailed {
		
		return od.updateDeptInfo(sqlSession, dept);
	}

	@Override
	public ArrayList<OrganizationChart> showOrganizationChart(int companyNo) throws ShowOrganizationChartFailed {
		
		return od.showOrganizationChart(sqlSession, companyNo);
	}

	@Override
	public HashMap<String, Object> selectOrChartInfo(Department dept) throws Exception {
		
		// dept 가지고 dept정보 가져오기
		// dept 가지고 organizationChart정보 가져오기
		// dept 가지고 director history정보에서 부서장 사원번호 가져오기 -> 사원번호로 부서장 사원정보 가지고 오기
		// empCodeSeq 가지고 부서장 얼굴 가지고 오기
		// dept 가지고 employee에서 해당 부서 사람들 불러오기
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		Department resultDept = null;
		ArrayList<OrganizationChart> orChartList = null; 
		Employee director = null;
		ProfileAttachment profile = null;
		ArrayList<Employee> list = null;
		
		if(dept.getDeptCodeSeq() == 999999) {
			list = od.selectAllOrChart(sqlSession, dept.getCompanyNo());
		} else {
			resultDept = od.selectOneDept(sqlSession, dept);
			orChartList = od.selectOneOrChart(sqlSession, resultDept);
			director = od.selectOneDirector(sqlSession, dept);
			
			if(director != null) {
				ProfileAttachment reqProfile = new ProfileAttachment();
				reqProfile.setEmpNoSeq(director.getEmpNoSeq());
				reqProfile.setAttStatus("profile");
				
				profile = ed.selectEmpOneProfile(sqlSession, reqProfile);
			}
			
			list = od.selectDeptEmpList(sqlSession, orChartList);
		}
		
		
		
		
		System.out.println("resultDept : " + resultDept);
		System.out.println("orChartList : " + orChartList);
		System.out.println("director : " + director);
		System.out.println("directorImg : " + profile);
		System.out.println("list : " + list);
		
		hmap.put("dept", resultDept);
		hmap.put("orChart", orChartList);
		hmap.put("director", director);
		hmap.put("profile", profile);
		hmap.put("list", list);
		
		return hmap;
	}

}
