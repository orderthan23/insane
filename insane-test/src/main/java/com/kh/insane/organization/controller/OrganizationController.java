package com.kh.insane.organization.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.organization.model.exception.DepartmentSetFailedException;
import com.kh.insane.organization.model.exception.OrganizationChartFailedException;
import com.kh.insane.organization.model.exception.deptSetFailed.UpdateDeptInfoFailed;
import com.kh.insane.organization.model.service.OrganizationService;
import com.kh.insane.organization.model.vo.Department;
import com.kh.insane.organization.model.vo.OrganizationChart;

@Controller
public class OrganizationController {
	
	@Autowired
	private OrganizationService os;
	
	@RequestMapping("insertDept.or")
	public String insertDeptInfo(Model model, Department dept, HttpServletRequest request) {
		
		int companyNo = ((CompanyAccount)request.getSession().getAttribute("loginUser")).getCompanyNo();
		
		System.out.println("dept : " + dept);
		
		dept.setCompanyNo(companyNo);				// 임시 회사번호 입력 -> session에서 받아오기
		
		if(dept.getDeptPresent() == null) {
			dept.setDeptPresent(0);
		}
		
		try {
			os.insertDept(dept);
			
			return "redirect:deptset.or";
		} catch (DepartmentSetFailedException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("deptset.or")
	public String deptSetList(Model model, HttpServletRequest request) {
		
		
		int companyNo = ((CompanyAccount)request.getSession().getAttribute("loginUser")).getCompanyNo();
		
		try {
			ArrayList<Department> list = os.selectDeptSetList(companyNo);
			
			model.addAttribute("list", list);
			
			return "adminSetting/deptSetting/deptSetting";
		} catch (DepartmentSetFailedException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("selectOneDept.or")
	public ModelAndView selectOneDept(ModelAndView mv, HttpServletResponse response, HttpServletRequest request, String num) {
		
		int companyNo = ((CompanyAccount)request.getSession().getAttribute("loginUser")).getCompanyNo();
		
		System.out.println("ajax : " + num);
		
		Department dept = new Department();
		dept.setDeptCodeSeq(Integer.parseInt(num));
		dept.setCompanyNo(companyNo);
		
		try {
			Department selectDept = os.selectOneDept(dept);
			
			mv.addObject("dept", selectDept);
			mv.setViewName("jsonView");
			
		} catch (DepartmentSetFailedException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	@RequestMapping("updateDeptInfo.or")
	public String updateDeptInfo(Model model, Department dept) {
		
		System.out.println("updateDept : " + dept);
		
		if(dept.getDeptPresent() == null) {
			dept.setDeptPresent(0);
		}
		
		try {
			os.updateDeptInfo(dept);
			
			return "redirect:deptset.or";
		} catch (UpdateDeptInfoFailed e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("organizationChart.or")
	public String showOrganizationChart(Model model, HttpServletRequest request) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		int companyNo = emp.getCompanyNo();
		
		try {
			ArrayList<OrganizationChart> list = os.showOrganizationChart(companyNo);
			
			model.addAttribute("list", list);
			
			return "organization/organizationInfo";
		} catch (OrganizationChartFailedException e) {
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("selectOrChartInfo.or")
	public ModelAndView selectOrChartInfo(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, String deptCodeSeqNum) {
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		System.out.println("조직도 부서코드 : " + deptCodeSeqNum);
		System.out.println("companyNo : " + emp.getCompanyNo());
		
		Department dept = new Department();
		dept.setDeptCodeSeq(Integer.parseInt(deptCodeSeqNum));
		dept.setCompanyNo(emp.getCompanyNo());
		
		try {
			HashMap<String, Object> hmap = os.selectOrChartInfo(dept);
			
			mv.addObject("hmap", hmap);
			mv.setViewName("jsonView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	
}
