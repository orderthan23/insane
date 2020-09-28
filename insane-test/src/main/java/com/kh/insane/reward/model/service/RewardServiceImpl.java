package com.kh.insane.reward.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.insane.reward.model.dao.RewardDao;
import com.kh.insane.reward.model.exception.RewardException;
import com.kh.insane.reward.model.vo.DeductionSetting;
import com.kh.insane.reward.model.vo.ProvisionSetting;
import com.kh.insane.reward.model.vo.SalarySetting;
	
@Service
public class RewardServiceImpl implements RewardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private RewardDao rd;

	@Override
	public void insertProvisionSetting(ArrayList<ProvisionSetting> provisionSettingList) throws RewardException {
		
		int result = 0;
		
		for(int i = 0; i < provisionSettingList.size(); i++) {
			result += rd.insertProvisionSetting(sqlSession, provisionSettingList.get(i));
		}
		
		
		if(result != provisionSettingList.size()) {
			throw new RewardException("지급사항 추가에 실패했습니다.");
		}
	}

	@Override
	public HashMap<String, Object> selectProvisionAndDeductionSetting(int companyNo) {

		HashMap<String, Object> list = new HashMap<String, Object>();
		
		ArrayList<ProvisionSetting> provisionSettingList = (ArrayList) rd.selectProvisionSetting(sqlSession, companyNo);
		ArrayList<DeductionSetting> deductionSettingList = (ArrayList) rd.selectDeductionSetting(sqlSession, companyNo);
		
		list.put("provisionSettingList", provisionSettingList);
		list.put("deductionSettingList", deductionSettingList);
		
		return list;
	}

	@Override
	public void insertDeductionSetting(ArrayList<DeductionSetting> deductionSettingList) throws RewardException {
		
		int result = 0;
		
		for(int i = 0; i < deductionSettingList.size(); i++) {
			result += rd.insertDeductionSetting(sqlSession, deductionSettingList.get(i));
		}
		
		if(result != deductionSettingList.size()) {
			throw new RewardException("공제사항 추가에 실패했습니다.");
		}
	}

	@Override
	public void updateProvision(int[] delProvSeq) throws RewardException {
		
		int result = 0;
		
		for(int i = 0; i < delProvSeq.length; i++) {
			result += rd.updateProvision(sqlSession, delProvSeq[i]);
		}
		
		if(result != delProvSeq.length) {
			throw new RewardException("지급사항 삭제에 실패했습니다.");
		}
	}

	@Override
	public void updateDeduction(int[] delDeduSeq) throws RewardException {
		
		int result = 0;
		
		for(int i = 0; i < delDeduSeq.length; i++) {
			result += rd.updateDeduction(sqlSession, delDeduSeq[i]);
		}
		
		if(result != delDeduSeq.length) {
			throw new RewardException("공제사항 삭제에 실패했습니다.");
		}
	}

	@Override
	public HashMap<String, Object> selectSalarySetting(int companyNo) {
		
		HashMap<String, Object> list = new HashMap<String, Object>();
		
		ArrayList<SalarySetting> salarySettingList = (ArrayList) rd.selectSalarySettingList(sqlSession, companyNo);
		ArrayList<SalarySetting> positionList = (ArrayList) rd.selectPositionList(sqlSession, companyNo);
		
		list.put("salarySettingList", salarySettingList);
		list.put("positionList", positionList);
		
		return list;
	}

	@Override
	public void insertSalarySettingList(ArrayList<SalarySetting> salarySettingList) throws RewardException {
		
		int result = 0;
		
		for(int i = 0; i < salarySettingList.size(); i++) {
			result += rd.insertSalarySetting(sqlSession, salarySettingList.get(i));
		}
		
		if(result != salarySettingList.size()) {
			throw new RewardException("기본 급여 사항 추가에 실패했습니다.");
		}
		
	}

	@Override
	public void updateSalarySetting(int[] delSalSeq) throws RewardException {

		int result = 0;
		
		for(int i = 0; i < delSalSeq.length; i++) {
			result += rd.updateSalarySetting(sqlSession, delSalSeq[i]);
		}
		
		if(result != delSalSeq.length) {
			throw new RewardException("기본 급여 사항 삭제에 실패했습니다.");
		}
		
	}

}
