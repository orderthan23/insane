package com.kh.insane.reward.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.reward.model.vo.DeductionSetting;
import com.kh.insane.reward.model.vo.ProvisionSetting;
import com.kh.insane.reward.model.vo.SalarySetting;

public interface RewardDao {

	int insertProvisionSetting(SqlSessionTemplate sqlSession, ProvisionSetting provisionSetting);

	List<Object> selectProvisionSetting(SqlSessionTemplate sqlSession, int companyNo);

	List<Object> selectDeductionSetting(SqlSessionTemplate sqlSession, int companyNo);

	int insertDeductionSetting(SqlSessionTemplate sqlSession, DeductionSetting deductionSetting);

	int updateProvision(SqlSessionTemplate sqlSession, int i);

	int updateDeduction(SqlSessionTemplate sqlSession, int i);

	List<Object> selectSalarySettingList(SqlSessionTemplate sqlSession, int companyNo);

	List<Object> selectPositionList(SqlSessionTemplate sqlSession, int companyNo);

	int insertSalarySetting(SqlSessionTemplate sqlSession, SalarySetting salarySetting);

	int updateSalarySetting(SqlSessionTemplate sqlSession, int i);

}
