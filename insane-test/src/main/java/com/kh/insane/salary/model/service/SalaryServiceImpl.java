package com.kh.insane.salary.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.salary.model.dao.SalaryDao;
import com.kh.insane.salary.model.vo.Deduction;
import com.kh.insane.salary.model.vo.Provision;
import com.kh.insane.salary.model.vo.Salary;

@Service
public class SalaryServiceImpl implements SalaryService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SalaryDao sd;

	public List<Salary> showSalary(int empNoSeq) {
		// TODO Auto-generated method stub
		return sd.showSalary(sqlSession, empNoSeq);
	}

	@Override
	public Salary selectByYearMonth(Salary salary) {
		// TODO Auto-generated method stub
		return sd.selectByYearMonth(sqlSession, salary);
	}

	@Override
	public List<String> selectYear(int empNoSeq) {
		// TODO Auto-generated method stub
		return sd.selectYear(sqlSession, empNoSeq);
	}

	/* 임시로 사용 */
	@Override
	public int insertSalaryCode() {
		// TODO Auto-generated method stub
		return sd.insertSalaryCode(sqlSession);
	}

	/* 임시로 사용 */
	@Override
	public int insertSalaryHistory(String date) {
		// TODO Auto-generated method stub
		return sd.insertSalaryHistory(sqlSession, date);
	}

	/* SalaryCode 지우개 */
	@Override
	public int deleteSalaryCode() {
		// TODO Auto-generated method stub
		return sd.deleteSalaryCode(sqlSession);
	}

	/* SalaryHistory 지우개 */
	@Override
	public int deleteSalaryHistory() {
		// TODO Auto-generated method stub
		return sd.deleteSalaryHistory(sqlSession);
	}

	@Override
	public List<Deduction> showDeduction(Employee loginUser) {
		// TODO Auto-generated method stub
		return sd.showDeduction(sqlSession, loginUser);
	}

	@Override
	public List<Provision> showProvision(int empNoSeq) {
		// TODO Auto-generated method stub
		return sd.showProvision(sqlSession, empNoSeq);
	}

	@Override
	public int insertDeduction(Deduction deduction) {
		// TODO Auto-generated method stub
		return sd.insertDeduction(sqlSession, deduction);
	}

	@Override
	public ArrayList<Provision> selectProvisionList(int companyNo) {
		// TODO Auto-generated method stub
		return sd.selectProvisionList(sqlSession, companyNo);
	}

	@Override
	public List<Provision> selectProvisionHistoryList(int empNoSeq, int companyNo) {
		// TODO Auto-generated method stub
		return sd.selectProvisionHistoryList(sqlSession, empNoSeq, companyNo);
	}

	@Override
	public void insertProvHistory(Provision prov) {
		// TODO Auto-generated method stub
		int result = sd.insertProvHistory(sqlSession, prov);
	}

	@Override
	public List<Integer> selectListYear() {
		// TODO Auto-generated method stub
		return sd.selectListYear(sqlSession);
	}

	@Override
	public List<Provision> selectProvHistDateList(int empNoSeq,  int year, int month) {
		// TODO Auto-generated method stub
		System.out.println(sd.selectProvHistDateList(sqlSession, empNoSeq, year, month));
		return null;
	}

	@Override
	public List<Provision> showTotalProvision(Employee loginUser) {
		// TODO Auto-generated method stub
		return sd.showTotalProvision(sqlSession, loginUser);
	}


}
