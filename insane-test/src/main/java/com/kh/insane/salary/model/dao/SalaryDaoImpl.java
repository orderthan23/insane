package com.kh.insane.salary.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.salary.model.vo.Deduction;
import com.kh.insane.salary.model.vo.Provision;
import com.kh.insane.salary.model.vo.Salary;

@Repository
public class SalaryDaoImpl implements SalaryDao {

	@Override
	public List<Salary> showSalary(SqlSessionTemplate sqlSession, int empNoSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Salary.showSalary", empNoSeq);
	}

	@Override
	public Salary selectByYearMonth(SqlSessionTemplate sqlSession, Salary salary) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Salary.selectByYearMonth", salary);
	}

	@Override
	public List<String> selectYear(SqlSessionTemplate sqlSession, int empNoSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Salary.selectYear", empNoSeq);
	}

	/* 임시용 */
	@Override
	public int insertSalaryCode(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Salary.insertSalaryCode");
	}

	/* 임시용 */
	@Override
	public int insertSalaryHistory(SqlSessionTemplate sqlSession, String date) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Salary.insertSalaryHistory", date);
	}

	/* SalaryCode 지우개 */
	@Override
	public int deleteSalaryCode(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Salary.deleteSalaryCode");
	}

	/* SalaryHistory 지우개 */
	@Override
	public int deleteSalaryHistory(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Salary.deleteSalaryHistory");
	}

	@Override
	public List<Deduction> showDeduction(SqlSessionTemplate sqlSession, Employee loginUser) {
		// TODO Auto-generated method stub
		int companyNo = loginUser.getCompanyNo();
		return sqlSession.selectList("Deduction.showDeduction", companyNo);
	}

	@Override
	public List<Provision> showProvision(SqlSessionTemplate sqlSession, int empNoSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Provision.showProvision", empNoSeq);
	}

	@Override
	public int insertDeduction(SqlSessionTemplate sqlSession, Deduction deduction) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Salary.insertDeduction", deduction);
	}

	@Override
	public ArrayList<Provision> selectProvisionList(SqlSessionTemplate sqlSession, int companyNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("Provision.selectProvisionList", companyNo);
	}

	@Override
	public List<Provision> selectProvisionHistoryList(SqlSessionTemplate sqlSession, int empNoSeq, int companyNo) {
		// TODO Auto-generated method stub
		/*
		 * List<Integer> list = new ArrayList<Integer>(); list.add(empNoSeq);
		 * list.add(companyNo); System.out.println(list);
		 */
		List<Provision> provList = sqlSession.selectList("Provision.selectProvisionHistoryList", empNoSeq);
		return provList;
	}

	@Override
	public int insertProvHistory(SqlSessionTemplate sqlSession, Provision prov) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Provision.insertProvHistory", prov);
	}

	@Override
	public List<Integer> selectListYear(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Provision.selectListYear");
	}

	@Override
	public List<Provision> selectProvHistDateList(SqlSessionTemplate sqlSession, int empNoSeq,  int year, int month) {
		// TODO Auto-generated method stub
		/*
		 * Provision prov = new Provision(); prov.setEmpNoSeq(empNoSeq);
		 * prov.setPayDate(date);
		 */
		
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		map.put(1, empNoSeq);
		map.put(2, year);
		map.put(3, month);

		return sqlSession.selectList("Provision.selectProvHistDateList", map);
	}

	@Override
	public List<Provision> showTotalProvision(SqlSessionTemplate sqlSession, Employee loginUser) {
		// TODO Auto-generated method stub
		int companyNo = loginUser.getCompanyNo();
		return sqlSession.selectList("Provision.showTotalProvision", companyNo);
	}

}
