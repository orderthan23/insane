package com.kh.insane.salary.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.salary.model.dao.DeductionDao;
import com.kh.insane.salary.model.vo.Deduction;

@Service
public class DeductionServiceImpl implements DeductionService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DeductionDao dd;

	@Override
	public Deduction selectByYearMonth(Deduction deduction) {
		// TODO Auto-generated method stub
		return dd.selectByYearMonth(sqlSession, deduction);
	}
}
