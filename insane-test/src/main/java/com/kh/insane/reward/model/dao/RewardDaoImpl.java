package com.kh.insane.reward.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.insane.reward.model.vo.DeductionSetting;
import com.kh.insane.reward.model.vo.ProvisionSetting;
import com.kh.insane.reward.model.vo.SalarySetting;
@Repository
public class RewardDaoImpl implements RewardDao {

	@Override
	public int insertProvisionSetting(SqlSessionTemplate sqlSession, ProvisionSetting provisionSetting) {
		
		return sqlSession.insert("Reward.insertProvisionSetting", provisionSetting);
	}

	@Override
	public List<Object> selectProvisionSetting(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectList("Reward.selectProvisionSetting", companyNo);
	}

	@Override
	public List<Object> selectDeductionSetting(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectList("Reward.selectDeductionSetting", companyNo);
	}

	@Override
	public int insertDeductionSetting(SqlSessionTemplate sqlSession, DeductionSetting deductionSetting) {
		return sqlSession.insert("Reward.insertDeductionSetting", deductionSetting);
	}

	@Override
	public int updateProvision(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.update("Reward.deleteProvision", i);
	}

	@Override
	public int updateDeduction(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.update("Reward.deleteDeduction", i);
	}

	@Override
	public List<Object> selectSalarySettingList(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectList("Reward.selectSalarySetting", companyNo);
	}

	@Override
	public List<Object> selectPositionList(SqlSessionTemplate sqlSession, int companyNo) {
		return sqlSession.selectList("Reward.selectPosition", companyNo);
	}

	@Override
	public int insertSalarySetting(SqlSessionTemplate sqlSession, SalarySetting salarySetting) {
		return sqlSession.insert("Reward.insertSalarySetting", salarySetting);
	}

	@Override
	public int updateSalarySetting(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.update("Reward.deleteSalary", i);
	}

}
