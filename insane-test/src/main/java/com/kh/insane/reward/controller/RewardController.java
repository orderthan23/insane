package com.kh.insane.reward.controller;

import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.insane.company.model.vo.CompanyAccount;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.reward.model.exception.RewardException;
import com.kh.insane.reward.model.service.RewardService;
import com.kh.insane.reward.model.vo.DeductionSetting;
import com.kh.insane.reward.model.vo.ProvisionSetting;
import com.kh.insane.reward.model.vo.SalarySetting;

@Controller
public class RewardController {

	@Autowired
	private RewardService rs;
	
	//지급공제사항 접근용 메소드
	@RequestMapping("selectProvisionAndDeductionSetting.rwd")
	public String selectProvisionAndDeductionSetting(HttpSession session, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo();
		
		HashMap<String, Object> list = rs.selectProvisionAndDeductionSetting(companyNo);
		
		model.addAttribute("list", list);
		
		return "adminSetting/rewardSetting/provisionAndDeductionSetting";
	}
	
	//지급사항 추가용 메소드
	@PostMapping("insertProvisionSetting.rwd")
	public String insertProvisionSetting(ProvisionSetting provisionSetting, HttpSession session, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo(); 
		
		for(int i = 0; i < provisionSetting.getProvisionSettingList().size(); i ++) {
			provisionSetting.getProvisionSettingList().get(i).setCompanyNo(companyNo);
		}
		
		try {
			rs.insertProvisionSetting(provisionSetting.getProvisionSettingList());
			return "redirect:selectProvisionAndDeductionSetting.rwd";
		} catch (RewardException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//지급사항 삭제용 메소드
	@RequestMapping("updateProvision.rwd")
	public String updateProvision(HttpSession session, HttpServletRequest request, Model model) {
		
		String[] requestNum = request.getParameter("delProvSeq").split(",");
		
		int[] delProvSeq = new int[requestNum.length];
		
		for(int i = 0; i < requestNum.length; i ++) {
			delProvSeq[i] = Integer.parseInt(requestNum[i]);
		}
		
		try {
			rs.updateProvision(delProvSeq);
			return "redirect:selectProvisionAndDeductionSetting.rwd";
		} catch (RewardException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//공제사항 추가용 메소드
	@PostMapping("insertDeductionSetting.rwd")
	public String insertDeductionSetting(DeductionSetting deductionSetting, HttpSession session, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo(); 
		
		for(int i = 0; i < deductionSetting.getDeductionSettingList().size(); i ++) {
			deductionSetting.getDeductionSettingList().get(i).setCompanyNo(companyNo);
		}
		
		try {
			rs.insertDeductionSetting(deductionSetting.getDeductionSettingList());
			return "redirect:selectProvisionAndDeductionSetting.rwd";
		} catch (RewardException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//공제사항 삭제용 메소드
	@RequestMapping("updateDeduction.rwd")
	public String updateDeduction(HttpSession session, HttpServletRequest request, Model model) {
		
		String[] requestNum = request.getParameter("delDeduSeq").split(",");
		
		int[] delDeduSeq = new int[requestNum.length];
		
		for(int i = 0; i < requestNum.length; i ++) {
			delDeduSeq[i] = Integer.parseInt(requestNum[i]);
		}
		
		try {
			rs.updateDeduction(delDeduSeq);
			return "redirect:selectProvisionAndDeductionSetting.rwd";
		} catch (RewardException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}	
	}
	
	//기본급여설정 접근용 메소드
	@RequestMapping("selectSalarySetting.rwd")
	public String selectSalarySetting(HttpSession session, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo(); 
		
		HashMap<String, Object> list = rs.selectSalarySetting(companyNo);
		
		model.addAttribute("list", list);
		
		return "adminSetting/rewardSetting/salarySetting";
	}
	
	//기본급여설정 추가용 메소드
	@PostMapping("insertSalarySetting.rwd")
	public String insertSalarySetting(HttpSession session, SalarySetting salarySettingList, Model model) {
		
		int companyNo = ((CompanyAccount) session.getAttribute("loginUser")).getCompanyNo(); 
		
		for(int i = 0; i < salarySettingList.getSalarySettingList().size(); i++) {
			salarySettingList.getSalarySettingList().get(i).setCompanyNo(companyNo);
		}
		
		try {
			rs.insertSalarySettingList(salarySettingList.getSalarySettingList());
			return "redirect:selectSalarySetting.rwd";
		} catch (RewardException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
	//기본급여설정 삭제용 메소드
	@RequestMapping("updateSalarySetting.rwd")
	public String updatetSalarySetting(HttpSession session, ServletRequest request, Model model) {
		
		String[] requestNum = request.getParameter("delSalSeq").split(",");
		int[] delSalSeq = new int[requestNum.length];
		
		for(int i = 0; i < delSalSeq.length; i++) {
			delSalSeq[i] = Integer.parseInt(requestNum[i]);
		}
		
		try {
			rs.updateSalarySetting(delSalSeq);
			return "redirect:selectSalarySetting.rwd";
		} catch (RewardException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		
	}
	
}
