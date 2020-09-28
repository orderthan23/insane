package com.kh.insane.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.insane.employee.model.dao.EmployeeDao;
import com.kh.insane.employee.model.exception.EmployeeException;
import com.kh.insane.employee.model.exception.HrInfoManagementException;
import com.kh.insane.employee.model.exception.LoginFailedException;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteAcaInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteAppointmentInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteCareerInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteFamInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteHRreviewInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteHealthInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteLicenseInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeletePayStepInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.DeleteRewardPunishInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.GetListCountFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertAcaInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertAppointmentInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertCareerInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertEmpInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertFamInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertFourInsuranceFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertHRreviewInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertHealthInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertLicenseInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertPayStepInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.InsertRewardPunishInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectAcaInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectAppointInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectCareerInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectDepartmentListFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectEducationInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectEmpListFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectEmpOneInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectFamInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectHRreviewInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectHealthInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectInsInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectLicenseCompanyInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectLicenseInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectLocationListFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectPayStepHistoryInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectPayStepListFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectPositionListFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectRPInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.SelectRspofcListFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.UpdateAccInsFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.UpdateEmpInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.UpdateEmpInsFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.UpdateHltInsFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.UpdateMiliInfoFailed;
import com.kh.insane.employee.model.exception.HrInfoManagementExceptions.UpdateNtnInsFailed;
import com.kh.insane.employee.model.vo.AcademicCareer;
import com.kh.insane.employee.model.vo.Appointment;
import com.kh.insane.employee.model.vo.Career;
import com.kh.insane.employee.model.vo.EducationEmployee;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.employee.model.vo.Family;
import com.kh.insane.employee.model.vo.FourInsurance;
import com.kh.insane.employee.model.vo.HRReview;
import com.kh.insane.employee.model.vo.Health;
import com.kh.insane.employee.model.vo.License;
import com.kh.insane.employee.model.vo.LicenseCompany;
import com.kh.insane.employee.model.vo.Location;
import com.kh.insane.employee.model.vo.Military;
import com.kh.insane.employee.model.vo.PageInfo;
import com.kh.insane.employee.model.vo.PayStep;
import com.kh.insane.employee.model.vo.PayStepHistory;
import com.kh.insane.employee.model.vo.Position;
import com.kh.insane.employee.model.vo.ProfileAttachment;
import com.kh.insane.employee.model.vo.RewardPunish;
import com.kh.insane.employee.model.vo.Rspofc;
import com.kh.insane.employee.model.vo.SearchEmployee;
import com.kh.insane.organization.model.vo.Department;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EmployeeDao ed;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	
	@Override
	public Employee loginEmployee(Employee e) throws LoginFailedException {
		Employee loginUser = null;
		
//		System.out.println("EmployeeServiceImple 입장");
	
		String encPassword = ed.selectEncPassword(sqlSession, e);
		System.out.println(encPassword);
		System.out.println("EmployeeServiceImpl : " + e);
		System.out.println("비밀번호되냐:"+e.getEmpPwd() + " / " + encPassword);
		
		if (!passwordEncoder.matches(e.getEmpPwd(), encPassword)) {
			throw new LoginFailedException("로그인 실패");
		} else {
			loginUser = ed.selectEmployee(sqlSession, e);
		}

		return loginUser;
	}

	@Override
	public int insertEmployee(Employee e) {
		return ed.insertEmployee(sqlSession, e);
	}

	@Override
	public int insertEmpInfo(Employee emp, ProfileAttachment profile) throws InsertEmpInfoFailed, InsertFourInsuranceFailed {
		
		int result = 0;
		
		int empInfo = ed.insertEmpInfo(sqlSession, emp);
		System.out.println("service insertEmpInfo : " + empInfo);
		int fourIns = ed.insertFourInsurance(sqlSession, emp);
		
		if(profile != null) {

			profile.setCompanyNo(emp.getCompanyNo());
			profile.setEmpNoSeq(emp.getEmpNoSeq());	
			
			if(empInfo > 0) {
				result = ed.insertEmpProfile(sqlSession, profile);
			} else {
				result = 0;
			}
		} else {
			result = empInfo;
		}
		
		return result;
	}
	
	@Override
	public int getListCount(int companyNo) throws GetListCountFailed  {
		
		return ed.getListCount(sqlSession, companyNo);
	}
	
	@Override
	public ArrayList<Employee> selectEmpList(PageInfo pi, int companyNo) throws SelectEmpListFailed {

		return ed.selectEmpList(sqlSession, pi, companyNo);
	}

	@Override
	public ArrayList<Employee> selectEmpList(int companyNo) throws SelectEmpListFailed {
		
		return ed.selectEmpList(sqlSession, companyNo);
	}

	@Override
	public ArrayList<Location> selectLocationList(int companyNo) throws SelectLocationListFailed {

		return ed.selectLocationList(sqlSession, companyNo);
	}

	@Override
	public ArrayList<Department> selectDepartmentList(int companyNo) throws SelectDepartmentListFailed {
		
		return ed.selectDepartmentList(sqlSession, companyNo);
	}

	@Override
	public ArrayList<Position> selectPositionList(int companyNo) throws SelectPositionListFailed {

		return ed.selectPositionList(sqlSession, companyNo);
	}

	@Override
	public ArrayList<Rspofc> selectRspofcList(int companyNo) throws SelectRspofcListFailed {
		
		return ed.selectRspofcList(sqlSession, companyNo);
	}

	@Override
	public ArrayList<PayStep> selectPayStepList(int companyNo) throws SelectPayStepListFailed {
		
		return ed.selectPayStepList(sqlSession, companyNo);
	}

	@Override
    public int selectRetiredListCount(Employee scEmp) {

        int resultCount = ed.selectRetiredListCount(scEmp, sqlSession);

        return resultCount;
    }

    @Override
    public ArrayList<Employee> selectLeavingList(Employee scEmp, com.kh.insane.common.model.vo.PageInfo pi) throws EmployeeException {
        ArrayList<Employee> list = ed.selectLeavingList(scEmp, pi, sqlSession);

        return list;
    }

    @Override
    public Employee selectRetiredEmp(int seqNum) {
        Employee emp = ed.selectRetiredEmp(seqNum, sqlSession);

        return emp;
    }

	@Override
	public HashMap<String, Object> selectEmpOneInfo(int empNoSeq) throws SelectEmpOneInfoFailed {
		
		HashMap<String, Object> hmap = null;
		
		Employee emp = ed.selectEmpOneInfo(sqlSession, empNoSeq);
		
		if(emp != null) {
			hmap = new HashMap<String, Object>();
			
			ProfileAttachment reqProfile = new ProfileAttachment();
			reqProfile.setEmpNoSeq(empNoSeq);
			reqProfile.setAttStatus("profile");
			
			ProfileAttachment profile = ed.selectEmpOneProfile(sqlSession, reqProfile);
			
			Appointment app = ed.selectAppointOneInfo(sqlSession, empNoSeq);
			
			hmap.put("emp", emp);
			hmap.put("profile", profile);
			hmap.put("app", app);
		}
		
		return hmap;
	}

	@Override
	public FourInsurance selectInsInfo(int reqEmpNoSeq) throws SelectInsInfoFailed {
		
		return ed.selectInsInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public FourInsurance updateHltIns(int reqEmpNoSeq) throws SelectInsInfoFailed, UpdateHltInsFailed {
		
		int result = ed.updateHltIns(sqlSession, reqEmpNoSeq);
		
		return ed.selectInsInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public FourInsurance updateAccIns(int reqEmpNoSeq) throws UpdateAccInsFailed, SelectInsInfoFailed {
		
		int result = ed.updateAccIns(sqlSession, reqEmpNoSeq);
		
		return ed.selectInsInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public FourInsurance updateEmpIns(int reqEmpNoSeq) throws UpdateEmpInsFailed, SelectInsInfoFailed {
		
		int result = ed.updateEmpIns(sqlSession, reqEmpNoSeq);
		
		return ed.selectInsInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public FourInsurance updateNtnIns(int reqEmpNoSeq) throws UpdateNtnInsFailed, SelectInsInfoFailed {
		
		int result = ed.updateNtnIns(sqlSession, reqEmpNoSeq);
		
		return ed.selectInsInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<Family> selectFamInfo(int reqEmpNoSeq) throws SelectFamInfoFailed {
		
		return ed.selectFamInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<AcademicCareer> selectAcaInfo(int reqEmpNoSeq) throws SelectAcaInfoFailed {
		
		return ed.selectAcaInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<Health> selectHealthInfo(int reqEmpNoSeq) throws SelectHealthInfoFailed {

		return ed.selectHealthInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<Career> selectCareerInfo(int reqEmpNoSeq) throws SelectCareerInfoFailed {
		
		return ed.selectCareerInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<License> selectLicenseInfo(int reqEmpNoSeq) throws SelectLicenseInfoFailed {
		
		return ed.selectLicenseInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<Appointment> selectAppointInfo(int reqEmpNoSeq) throws SelectAppointInfoFailed {
		
		return ed.selectAppointInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<RewardPunish> selectRPInfo(int reqEmpNoSeq) throws SelectRPInfoFailed {
		
		return ed.selectRPInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<HRReview> selectHRreviewInfo(int reqEmpNoSeq) throws SelectHRreviewInfoFailed {
		
		return ed.selectHRreviewInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<PayStepHistory> selectPayStepInfo(int reqEmpNoSeq) throws SelectPayStepHistoryInfoFailed {
		
		return ed.selectPayStepInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public Military selectMiliInfo(int reqEmpNoSeq) {
		
		return ed.selectMiliInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public int updateEmpInfo(Employee emp, ProfileAttachment profile, Military military) throws UpdateEmpInfoFailed, UpdateMiliInfoFailed {
		
		int result = 0;
		
		int empInfo = ed.updateEmpInfo(sqlSession, emp);
		
		if(military.getEndsType() != null && !military.getEndsType().equals("")) {

			Military reqMilitary = ed.selectMiliInfo(sqlSession, emp.getEmpNoSeq());
			
			if(reqMilitary == null) {
				military.setEmpNoSeq(emp.getEmpNoSeq());
				military.setCompanyNo(emp.getCompanyNo());
				
				int updateMil = ed.insertMiliInfo(sqlSession, military);
			}
			
		}
		
		if(profile != null) {

			profile.setCompanyNo(emp.getCompanyNo());
			profile.setEmpNoSeq(emp.getEmpNoSeq());	
			
			if(empInfo > 0) {
				result = ed.insertEmpProfile(sqlSession, profile);
			} else {
				result = 0;
			}
			
		} else {
			result = empInfo;
		}
		
		return result;
	}

	@Override
	public ArrayList<Family> insertFamInfo(Family famInfo) throws InsertFamInfoFailed, SelectFamInfoFailed {
		
		ed.insertFamInfo(sqlSession, famInfo);
		
		return ed.selectFamInfo(sqlSession, famInfo.getEmpNoSeq());
	}

	@Override
	public ArrayList<Family> deleteFamInfo(Family family) throws DeleteFamInfoFailed, SelectFamInfoFailed {
		
		ed.deleteFamInfo(sqlSession, family.getFamilySeq());
		
		return ed.selectFamInfo(sqlSession, family.getEmpNoSeq());
	}

	@Override
	public ArrayList<AcademicCareer> insertAcaInfo(AcademicCareer academy) throws InsertAcaInfoFailed, SelectAcaInfoFailed {
		
		ed.insertAcaInfo(sqlSession, academy);
		
		return ed.selectAcaInfo(sqlSession, academy.getEmpNoSeq());
	}

	@Override
	public ArrayList<AcademicCareer> deleteAcaInfo(AcademicCareer academy) throws DeleteAcaInfoFailed, SelectAcaInfoFailed {
		
		ed.deleteAcaInfo(sqlSession, academy.getAcademicCareerSeq());
		
		return ed.selectAcaInfo(sqlSession, academy.getEmpNoSeq());
	}

	@Override
	public ArrayList<Health> insertHealthInfo(Health health) throws InsertHealthInfoFailed, SelectHealthInfoFailed {
		
		ed.insertHealthInfo(sqlSession, health);
		
		return ed.selectHealthInfo(sqlSession, health.getEmpNoSeq());
	}

	@Override
	public ArrayList<Health> deleteHealthInfo(Health health) throws DeleteHealthInfoFailed, SelectHealthInfoFailed {
		
		ed.deleteHealthInfo(sqlSession, health.getHealthSeq());
		
		return ed.selectHealthInfo(sqlSession, health.getEmpNoSeq());
	}

	@Override
	public ArrayList<Career> insertCareerInfo(Career career) throws InsertCareerInfoFailed, SelectCareerInfoFailed {
		
		ed.insertCareerInfo(sqlSession, career);
		
		return ed.selectCareerInfo(sqlSession, career.getEmpNoSeq());
	}

	@Override
	public ArrayList<Career> deleteCareerInfo(Career career) throws DeleteCareerInfoFailed, SelectCareerInfoFailed {
		
		ed.deleteCareerInfo(sqlSession, career.getCareerSeq());
		
		return ed.selectCareerInfo(sqlSession, career.getEmpNoSeq());
	}

	@Override
	public HashMap<String, Object> selectModalLicenseInfo(int reqEmpNoSeq, int companyNo) throws SelectLicenseInfoFailed, SelectLicenseCompanyInfoFailed {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		ArrayList<License> list = ed.selectLicenseInfo(sqlSession, reqEmpNoSeq);
		ArrayList<LicenseCompany> lcList = ed.selectLicenseCompanyInfo(sqlSession, companyNo);
		
		hmap.put("list", list);
		hmap.put("lcList", lcList);
		
		return hmap;
	}

	@Override
	public ArrayList<License> insertLicenseInfo(License license) throws InsertLicenseInfoFailed, SelectLicenseInfoFailed {
		
		ed.insertLicenseInfo(sqlSession, license);
		
		return ed.selectLicenseInfo(sqlSession, license.getEmpNoSeq());
	}

	@Override
	public ArrayList<License> deleteLicenseInfo(License license) throws DeleteLicenseInfoFailed, SelectLicenseInfoFailed {
		
		ed.deleteLicenseInfo(sqlSession, license.getLicenseSeq());
		
		return ed.selectLicenseInfo(sqlSession, license.getEmpNoSeq());
	}

	@Override
	public HashMap<String, Object> selectModalAppointInfo(int reqEmpNoSeq, int companyNo) throws HrInfoManagementException {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		ArrayList<Appointment> list = ed.selectAppointInfo(sqlSession, reqEmpNoSeq);
		ArrayList<Location> loList = ed.selectLocationList(sqlSession, companyNo);
		ArrayList<Department> deList = ed.selectDepartmentList(sqlSession, companyNo);
		ArrayList<Rspofc> rsList = ed.selectRspofcList(sqlSession, companyNo);
		ArrayList<Position> poList = ed.selectPositionList(sqlSession, companyNo);
		
		hmap.put("list", list);
		hmap.put("loList", loList);
		hmap.put("deList", deList);
		hmap.put("rsList", rsList);
		hmap.put("poList", poList);
		
		return hmap;
	}

	@Override
	public ArrayList<Appointment> insertAppointmentInfo(Appointment appointment) throws InsertAppointmentInfoFailed, SelectAppointInfoFailed {
		
		ed.insertAppointmentInfo(sqlSession, appointment);
		
		return ed.selectAppointInfo(sqlSession, appointment.getTargetEmpNo());
	}

	@Override
	public ArrayList<Appointment> deleteAppointmentInfo(Appointment appointment) throws DeleteAppointmentInfoFailed, SelectAppointInfoFailed {
		
		ed.deleteAppointmentInfo(sqlSession, appointment.getGvofodHistorySeq());
		
		return ed.selectAppointInfo(sqlSession, appointment.getTargetEmpNo());
	}

	@Override
	public ArrayList<RewardPunish> insertRewardPunishInfo(RewardPunish rp) throws InsertRewardPunishInfoFailed, SelectRPInfoFailed {
		
		ed.insertRewardPunishInfo(sqlSession, rp);
		
		return ed.selectRPInfo(sqlSession, rp.getTargetEmpNo());
	}

	@Override
	public ArrayList<RewardPunish> deleteRewardPunishInfo(RewardPunish rp) throws DeleteRewardPunishInfoFailed, SelectRPInfoFailed {
		
		ed.deleteRewardPunishInfo(sqlSession, rp.getRwrdPnshHistorySeq());
		
		return ed.selectRPInfo(sqlSession, rp.getTargetEmpNo());
	}

	@Override
	public ArrayList<HRReview> insertHRreviewInfo(HRReview hr) throws InsertHRreviewInfoFailed, SelectHRreviewInfoFailed {
		
		ed.insertHRreviewInfo(sqlSession, hr);
		
		return ed.selectHRreviewInfo(sqlSession, hr.getTargetEmpNo());
	}

	@Override
	public ArrayList<HRReview> deleteHRreviewInfo(HRReview hr) throws DeleteHRreviewInfoFailed, SelectHRreviewInfoFailed {
		
		ed.deleteHRreviewInfo(sqlSession, hr.getPrsnlExmHistorySeq());
		
		return ed.selectHRreviewInfo(sqlSession, hr.getTargetEmpNo());
	}

	@Override
	public HashMap<String, Object> selectModalPayStepInfo(int reqEmpNoSeq, int companyNo) throws HrInfoManagementException {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		ArrayList<PayStepHistory> list = ed.selectPayStepInfo(sqlSession, reqEmpNoSeq);
		ArrayList<Position> poList = ed.selectPositionList(sqlSession, companyNo);
		ArrayList<PayStep> psList = ed.selectPayStepList(sqlSession, companyNo);
		
		hmap.put("list", list);
		hmap.put("poList", poList);
		hmap.put("psList", psList);
		
		return hmap;
	}

	@Override
	public ArrayList<PayStepHistory> insertPayStepInfo(PayStepHistory psHistory) throws InsertPayStepInfoFailed, SelectPayStepHistoryInfoFailed {
		
		ed.insertPayStepInfo(sqlSession, psHistory);
		
		return ed.selectPayStepInfo(sqlSession, psHistory.getTargetEmpNo());
	}

	@Override
	public ArrayList<PayStepHistory> deletePayStepInfo(PayStepHistory psHistory) throws DeletePayStepInfoFailed, SelectPayStepHistoryInfoFailed {
		
		ed.deletePayStepInfo(sqlSession, psHistory.getPayStepHistorySeq());
		
		return ed.selectPayStepInfo(sqlSession, psHistory.getTargetEmpNo());
	}



	public HashMap<String, Object> selectAllEmpForSalary(int companyNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hmap = null;
		Employee emp = ed.selectAllEmpForSalary(sqlSession, companyNo);
		
		if(emp != null) {
			hmap = new HashMap<String, Object>();
			hmap.put("emp", emp);
		}
		return hmap;
	}

	@Override
	public ArrayList<EducationEmployee> selectEducationInfo(int reqEmpNoSeq) throws SelectEducationInfoFailed {
		
		return ed.selectEducationInfo(sqlSession, reqEmpNoSeq);
	}

	@Override
	public ArrayList<Employee> searchEmployeeList(PageInfo pi, SearchEmployee sEmp) throws SelectEmpListFailed {
		
		return ed.searchEmployeeList(sqlSession, pi, sEmp);
	}

	@Override
	public int getSearchEmpListCount(SearchEmployee sEmp) throws GetListCountFailed {
		
		return ed.getSearchEmpListCount(sqlSession, sEmp);
	}

}
