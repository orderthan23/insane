package com.kh.insane.salary.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.salary.model.vo.Deduction;
import com.kh.insane.salary.model.vo.Provision;
import com.kh.insane.salary.model.vo.Salary;

public interface SalaryService {

	List<Salary> showSalary(int empNoSeq);

	Salary selectByYearMonth(Salary salary);

	List<String> selectYear(int empNoSeq);

	int insertSalaryCode();

	int insertSalaryHistory(String date);

	int deleteSalaryCode();

	int deleteSalaryHistory();

	List<Deduction> showDeduction(Employee loginUser);

	List<Provision> showProvision(int empNoSeq);

	int insertDeduction(Deduction deduction);

	ArrayList<Provision> selectProvisionList(int companyNo);

	List<Provision> selectProvisionHistoryList(int empNoSeq, int companyNo);

	void insertProvHistory(Provision prov);

	List<Integer> selectListYear();

	List<Provision> selectProvHistDateList(int empNoSeq, int year, int month);

	List<Provision> showTotalProvision(Employee loginUser);
}
