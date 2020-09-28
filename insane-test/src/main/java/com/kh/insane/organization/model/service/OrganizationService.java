package com.kh.insane.organization.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.insane.organization.model.exception.OrganizationChartFailed.ShowOrganizationChartFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.InsertDeptSetFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectDeptSetListFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.SelectOneDeptFailed;
import com.kh.insane.organization.model.exception.deptSetFailed.UpdateDeptInfoFailed;
import com.kh.insane.organization.model.vo.Department;
import com.kh.insane.organization.model.vo.OrganizationChart;

public interface OrganizationService {

	int insertDept(Department dept) throws InsertDeptSetFailed;

	ArrayList<Department> selectDeptSetList(int companyNo) throws SelectDeptSetListFailed;

	Department selectOneDept(Department dept) throws SelectOneDeptFailed;

	int updateDeptInfo(Department dept) throws UpdateDeptInfoFailed;

	ArrayList<OrganizationChart> showOrganizationChart(int companyNo) throws ShowOrganizationChartFailed;

	HashMap<String, Object> selectOrChartInfo(Department dept) throws Exception;

}
