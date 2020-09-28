package com.kh.insane.salary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.salary.model.vo.Deduction;

public interface DeductionDao {

	Deduction selectByYearMonth(SqlSessionTemplate sqlSession, Deduction deduction);

}
