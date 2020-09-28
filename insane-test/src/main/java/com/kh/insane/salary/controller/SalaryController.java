package com.kh.insane.salary.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.insane.common.Pagination;
import com.kh.insane.employee.model.exception.HrInfoManagementException;
import com.kh.insane.employee.model.service.EmployeeService;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.PageInfo;
import com.kh.insane.salary.model.service.SalaryService;
import com.kh.insane.salary.model.vo.Deduction;
import com.kh.insane.salary.model.vo.Provision;
import com.kh.insane.salary.model.vo.Salary;

@Controller
public class SalaryController {

	@Autowired
	private SalaryService ss;
	@Autowired
	private EmployeeService es;

	@RequestMapping("mySalReport.sal")
	public String showSalary(HttpSession session, HttpServletRequest request) {

		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int empNoSeq = loginUser.getEmpNoSeq();

		List<Salary> mySalary = null;
		List<Deduction> myDeduction = null;
		List<Provision> totalProvision = null;
		List<Provision> myProvision = null;

		System.out.println("loginUser : " + loginUser + " / empNoSeq : " + empNoSeq);

		// 임시 delete 및 insert 시작

		/*
		 * int delete1 = ss.deleteSalaryCode(); int delete2 = ss.deleteSalaryHistory();
		 * int result1 = ss.insertSalaryCode(); int result2 = 0; String date = ""; for
		 * (int y = 2019; y <= 2020; y++) { for (int i = 1; i <= 12; i++) { if (i < 10)
		 * { date = y + "-0" + i + "-01"; } else if (i >= 10) { date = y + "-" + i +
		 * "-01"; } if (ss.insertSalaryHistory(date) != 0) { result2++; } mySalary =
		 * ss.showSalary(empNoSeq); } }
		 */

		// System.out.println(delete1 + " / " + delete2 + " / " + result1 + " / " +
		// result2);

		// 임시 delete 및 insert 끝
		mySalary = ss.showSalary(empNoSeq);
		myDeduction = ss.showDeduction(loginUser);
		totalProvision = ss.showTotalProvision(loginUser);
		myProvision = ss.showProvision(empNoSeq);

		for (int i = 0; i < totalProvision.size(); i++) {
			for (int j = 0; j < myProvision.size(); j++) {
				if (totalProvision.get(i).getProvisionSeq() == myProvision.get(j).getProvisionSeq()) {
					totalProvision.get(i).setAmount(myProvision.get(j).getAmount());
				}
			}
		}

		List<String> year = ss.selectYear(empNoSeq);

		/*
		 * System.out.println(loginUser); System.out.println("mySalary : " + mySalary);
		 * System.out.println("myDeduction : " + myDeduction);
		 * System.out.println("myProvision : " + myProvision);
		 * System.out.println("totalProvision : " + totalProvision);
		 * System.out.println("year : " + year);
		 */

		request.setAttribute("mySalary", mySalary);
		request.setAttribute("myDeduction", myDeduction);
		request.setAttribute("myProvision", totalProvision);
		request.setAttribute("year", year);

		return "wage/personalSalaryReport";
	}

	@RequestMapping("selectByYearMonth.sal")
	public String selectYearMonth(HttpSession session, HttpServletRequest request) {

		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int empNoSeq = loginUser.getEmpNoSeq();
		int year = (int) (session.getAttribute("year"));
		int month = (int) session.getAttribute("month");

		System.out.println(empNoSeq + "번 : " + year + "년 " + month + "월");

//		Salary mySalary = ss.selectByYearMonth(salary);

//		request.setAttribute("mySalary", mySalary);

		return "wage/personalSalaryReport";
	}

	@RequestMapping("insertDeductionTemplate.sal")
	public String insertDeductionTemplate(HttpSession session, HttpServletRequest request) {
		return "wage/insertDeduction";
	}

	@RequestMapping("insertDeduction.sal")
	public String insertDeduction(HttpServletRequest request) {

		System.out.println("insertDeduction.sal 들어옴");

		Deduction deduction = new Deduction();
		int deductionSeq = Integer.parseInt(request.getParameter("deductionSeq"));
		deduction.setDeductionSeq(deductionSeq);
		deduction.setDeductionName(request.getParameter("deductionName"));
		deduction.setDeductionType(request.getParameter("deductionType"));
		deduction.setDivSalary(Integer.parseInt(request.getParameter("divSalary")));
		deduction.setDeductionPt(Integer.parseInt(request.getParameter("deductionPt")));
		deduction.setAutoRegist((request.getParameter("autoRegist")).charAt(0));
		deduction.setUsageStatus(request.getParameter("usageStatus"));
		deduction.setRemark((String) request.getParameter("remark"));
		deduction.setCompanyNo(Integer.parseInt(request.getParameter("companyNo")));

		deduction.setDeductionHistorySeq(Integer.parseInt(request.getParameter("deductionHistorySeq")));
		deduction.setPayDate(request.getParameter("payDate"));
		deduction.setAmount(Integer.parseInt(request.getParameter("amount")));
		deduction.setEmpNoSeq(Integer.parseInt(request.getParameter("empNoSeq")));

		System.out.println(deduction);

		int result = ss.insertDeduction(deduction);

		return "wage/insertDeduction";
	}

	@RequestMapping("selectEmpListForSalary.sal")
	public String selectEmpListForSalary(Model model, HttpServletRequest request) {

		Employee emp = (Employee) request.getSession().getAttribute("loginUser");

		int companyNo = emp.getCompanyNo();

		int currentPage = 1;

		ArrayList<Provision> provList = ss.selectProvisionList(companyNo);
		List<Integer> yearList = ss.selectListYear();

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		try {
			int listCount = es.getListCount(companyNo);

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			ArrayList<Employee> list = es.selectEmpList(pi, companyNo);

			model.addAttribute("list", list);
			model.addAttribute("provList", provList);
			model.addAttribute("pi", pi);
			model.addAttribute("yearList", yearList);

			return "wage/empWageList/selectEmployeePage";
		} catch (HrInfoManagementException e) {
			model.addAttribute("msg", e.getMessage());

			return "common/errorPage";
		}

		/*
		 * 
		 * HashMap<String, Object> hmap = es.selectAllEmpForSalary(companyNo);
		 * 
		 * model.addAttribute("hmap", hmap);
		 * 
		 * return "wage/empWageList/selectEmployeePage";
		 * 
		 * //
		 */

	}

	@RequestMapping(value = "selectProvisionHistoryList.sal")
	@ResponseBody
	public List<Provision> selectProvisionHistoryList(Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		List<Provision> provHistoryList = null;

		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int empNoSeq = Integer.parseInt(request.getParameter("empNoSeq"));
		int companyNo = loginUser.getCompanyNo();

		ArrayList<String> yearList = new ArrayList<String>();
		ArrayList<String> monthList = new ArrayList<String>();
		// System.out.println("selectProvisionHistoryList : " + empNoSeq + "/" +
		// companyNo);

		try {
			provHistoryList = ss.selectProvisionHistoryList(empNoSeq, companyNo);
			for (int i = 0; i < provHistoryList.size(); i++) {
				yearList.add(provHistoryList.get(i).getPayDate().substring(0, 4));
				monthList.add(provHistoryList.get(i).getPayDate().substring(5, 7));
			}
			model.addAttribute("provHistList", provHistoryList);
			model.addAttribute("yearList", yearList);
			model.addAttribute("monthList", monthList);
			System.out.println("provHistoryList : " + provHistoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return provHistoryList;
	}

	@RequestMapping(value = "selectProvHistDateList.sal")
	@ResponseBody
	public List<Provision> selectProvHistDateList(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		List<Provision> provHistDateList = null;

		int empNoSeq = Integer.parseInt(request.getParameter("empNoSeq"));
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		// String date = request.getParameter("date");

		try {
			provHistDateList = ss.selectProvHistDateList(empNoSeq, year, month);
			System.out.println("date : " + year + " " + month + " / empNoSeq : " + empNoSeq);
			System.out.println("provHistDateList : " + provHistDateList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return provHistDateList;
	}

	@RequestMapping(value = "insertProvHistory.sal")
	public void insertProvHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Employee loginUser = (Employee) session.getAttribute("loginUser");
		int companyNo = loginUser.getCompanyNo();
		int empNoSeq = Integer.parseInt(request.getParameter("empNoSeq"));
		int provisionSeq = Integer.parseInt(request.getParameter("provisionSeq"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		String provDate = request.getParameter("provDate");

		Provision prov = new Provision();
		prov.setEmpNoSeq(empNoSeq);
		prov.setProvisionSeq(provisionSeq);
		prov.setCompanyNo(companyNo);
		prov.setAmount(amount);
		prov.setPayDate(provDate);

		// System.out.println("insertProvHistory : " + prov);

		try {
			ss.insertProvHistory(prov);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * @RequestMapping(value="selectListYear.sal")
	 * 
	 * @ResponseBody public List<Integer> selectListYear(HttpServletRequest request)
	 * { int empNoSeq = Integer.parseInt(request.getParameter("empNoSeq"));
	 * List<Integer> yearList = null; try { yearList = ss.selectListYear(empNoSeq);
	 * //System.out.println("year : " + yearList); } catch(Exception e) {
	 * e.printStackTrace(); } return yearList; }
	 */

	@RequestMapping("selectSeveranceManagement.sal")
	public String selectSeveranceManagement(HttpSession session, HttpServletRequest request) {
		return "severance/severanceManagement";
	}
}
