package com.kh.insane.salary.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.salary.model.vo.Deduction;
import com.kh.insane.salary.model.vo.Provision;
import com.kh.insane.salary.model.vo.Salary;

public interface SalaryDao {

	List<Salary> showSalary(SqlSessionTemplate sqlSession, int empNoSeq);

	Salary selectByYearMonth(SqlSessionTemplate sqlSession, Salary salary);

	List<String> selectYear(SqlSessionTemplate sqlSession, int empNoSeq);

	int insertSalaryCode(SqlSessionTemplate sqlSession);

	int insertSalaryHistory(SqlSessionTemplate sqlSession, String date);

	int deleteSalaryCode(SqlSessionTemplate sqlSession);

	int deleteSalaryHistory(SqlSessionTemplate sqlSession);

	List<Deduction> showDeduction(SqlSessionTemplate sqlSession, Employee loginUser);

	List<Provision> showProvision(SqlSessionTemplate sqlSession, int empNoSeq);

	int insertDeduction(SqlSessionTemplate sqlSession, Deduction deduction);

	ArrayList<Provision> selectProvisionList(SqlSessionTemplate sqlSession, int companyNo);

	List<Provision> selectProvisionHistoryList(SqlSessionTemplate sqlSession, int empNoSeq, int companyNo);

	int insertProvHistory(SqlSessionTemplate sqlSession, Provision prov);

	List<Integer> selectListYear(SqlSessionTemplate sqlSession);

	List<Provision> selectProvHistDateList(SqlSessionTemplate sqlSession, int empNoSeq, int year, int month);

	List<Provision> showTotalProvision(SqlSessionTemplate sqlSession, Employee loginUser);

}
