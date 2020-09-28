package com.kh.insane.reward.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.insane.reward.model.exception.RewardException;
import com.kh.insane.reward.model.vo.DeductionSetting;
import com.kh.insane.reward.model.vo.ProvisionSetting;
import com.kh.insane.reward.model.vo.SalarySetting;

public interface RewardService {

	void insertProvisionSetting(ArrayList<ProvisionSetting> provisionSettingList) throws RewardException;

	HashMap<String, Object> selectProvisionAndDeductionSetting(int companyNo);

	void insertDeductionSetting(ArrayList<DeductionSetting> deductionSettingList) throws RewardException;

	void updateProvision(int[] delProvSeq) throws RewardException;

	void updateDeduction(int[] delDeduSeq) throws RewardException;

	HashMap<String, Object> selectSalarySetting(int companyNo);

	void insertSalarySettingList(ArrayList<SalarySetting> salarySettingList) throws RewardException;

	void updateSalarySetting(int[] delSalSeq) throws RewardException;

}
