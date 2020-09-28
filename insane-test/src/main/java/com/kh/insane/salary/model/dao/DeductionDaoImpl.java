package com.kh.insane.salary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.salary.model.vo.Deduction;

@Repository
public class DeductionDaoImpl implements DeductionDao{

	@Override
	public Deduction selectByYearMonth(SqlSessionTemplate sqlSession, Deduction deduction) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Deduction.selectByYearMonth", deduction);
	}

}
