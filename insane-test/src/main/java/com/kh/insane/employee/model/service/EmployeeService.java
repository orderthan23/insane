package com.kh.insane.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

public interface EmployeeService {

		Employee loginEmployee(Employee e) throws LoginFailedException;

		int insertEmployee(Employee e);
		
		int getListCount(int companyNo) throws GetListCountFailed;

		int insertEmpInfo(Employee emp, ProfileAttachment profile) throws InsertEmpInfoFailed, InsertFourInsuranceFailed;

		ArrayList<Employee> selectEmpList(PageInfo pi, int companyNo) throws SelectEmpListFailed;

		ArrayList<Employee> selectEmpList(int companyNo) throws SelectEmpListFailed;

		ArrayList<Location> selectLocationList(int companyNo) throws SelectLocationListFailed;

		ArrayList<Department> selectDepartmentList(int companyNo) throws SelectDepartmentListFailed;

		ArrayList<Position> selectPositionList(int companyNo) throws SelectPositionListFailed;

		ArrayList<Rspofc> selectRspofcList(int companyNo) throws SelectRspofcListFailed;

		ArrayList<PayStep> selectPayStepList(int companyNo) throws SelectPayStepListFailed;
		
		int selectRetiredListCount(Employee scEmp);

        ArrayList<Employee> selectLeavingList(Employee scEmp, com.kh.insane.common.model.vo.PageInfo pi) throws EmployeeException;

        Employee selectRetiredEmp(int seqNum);

		HashMap<String, Object> selectEmpOneInfo(int empNoSeq) throws SelectEmpOneInfoFailed;

		FourInsurance selectInsInfo(int reqEmpNoSeq) throws SelectInsInfoFailed;

		FourInsurance updateHltIns(int reqEmpNoSeq) throws SelectInsInfoFailed, UpdateHltInsFailed;

		FourInsurance updateAccIns(int reqEmpNoSeq) throws UpdateAccInsFailed, SelectInsInfoFailed;

		FourInsurance updateEmpIns(int reqEmpNoSeq) throws UpdateEmpInsFailed, SelectInsInfoFailed;

		FourInsurance updateNtnIns(int reqEmpNoSeq) throws UpdateNtnInsFailed, SelectInsInfoFailed;

		ArrayList<Family> selectFamInfo(int reqEmpNoSeq) throws SelectFamInfoFailed;

		ArrayList<AcademicCareer> selectAcaInfo(int reqEmpNoSeq) throws SelectAcaInfoFailed;

		ArrayList<Health> selectHealthInfo(int reqEmpNoSeq) throws SelectHealthInfoFailed;

		ArrayList<Career> selectCareerInfo(int reqEmpNoSeq) throws SelectCareerInfoFailed;

		ArrayList<License> selectLicenseInfo(int reqEmpNoSeq) throws SelectLicenseInfoFailed;

		ArrayList<Appointment> selectAppointInfo(int reqEmpNoSeq) throws SelectAppointInfoFailed;

		ArrayList<RewardPunish> selectRPInfo(int reqEmpNoSeq) throws SelectRPInfoFailed;

		ArrayList<HRReview> selectHRreviewInfo(int reqEmpNoSeq) throws SelectHRreviewInfoFailed;

		ArrayList<PayStepHistory> selectPayStepInfo(int reqEmpNoSeq) throws SelectPayStepHistoryInfoFailed;

		Military selectMiliInfo(int reqEmpNoSeq);

		int updateEmpInfo(Employee emp, ProfileAttachment profile, Military military) throws UpdateEmpInfoFailed, UpdateMiliInfoFailed;

		ArrayList<Family> insertFamInfo(Family famInfo) throws InsertFamInfoFailed, SelectFamInfoFailed;

		ArrayList<Family> deleteFamInfo(Family family) throws DeleteFamInfoFailed, SelectFamInfoFailed;

		ArrayList<AcademicCareer> insertAcaInfo(AcademicCareer academy) throws InsertAcaInfoFailed, SelectAcaInfoFailed;

		ArrayList<AcademicCareer> deleteAcaInfo(AcademicCareer academy) throws DeleteAcaInfoFailed, SelectAcaInfoFailed;

		ArrayList<Health> insertHealthInfo(Health health) throws InsertHealthInfoFailed, SelectHealthInfoFailed;

		ArrayList<Health> deleteHealthInfo(Health health) throws DeleteHealthInfoFailed, SelectHealthInfoFailed;

		ArrayList<Career> insertCareerInfo(Career career) throws InsertCareerInfoFailed, SelectCareerInfoFailed;

		ArrayList<Career> deleteCareerInfo(Career career) throws DeleteCareerInfoFailed, SelectCareerInfoFailed;

		HashMap<String, Object> selectModalLicenseInfo(int reqEmpNoSeq, int companyNo) throws SelectLicenseInfoFailed, SelectLicenseCompanyInfoFailed;

		ArrayList<License> insertLicenseInfo(License license) throws InsertLicenseInfoFailed, SelectLicenseInfoFailed;

		ArrayList<License> deleteLicenseInfo(License license) throws DeleteLicenseInfoFailed, SelectLicenseInfoFailed;

		HashMap<String, Object> selectModalAppointInfo(int reqEmpNoSeq, int companyNo) throws HrInfoManagementException;

		ArrayList<Appointment> insertAppointmentInfo(Appointment appointment) throws InsertAppointmentInfoFailed, SelectAppointInfoFailed;

		ArrayList<Appointment> deleteAppointmentInfo(Appointment appointment) throws DeleteAppointmentInfoFailed, SelectAppointInfoFailed;

		ArrayList<RewardPunish> insertRewardPunishInfo(RewardPunish rp) throws InsertRewardPunishInfoFailed, SelectRPInfoFailed;

		ArrayList<RewardPunish> deleteRewardPunishInfo(RewardPunish rp) throws DeleteRewardPunishInfoFailed, SelectRPInfoFailed;

		ArrayList<HRReview> insertHRreviewInfo(HRReview hr) throws InsertHRreviewInfoFailed, SelectHRreviewInfoFailed;

		ArrayList<HRReview> deleteHRreviewInfo(HRReview hr) throws DeleteHRreviewInfoFailed, SelectHRreviewInfoFailed;

		HashMap<String, Object> selectModalPayStepInfo(int reqEmpNoSeq, int companyNo) throws HrInfoManagementException;

		ArrayList<PayStepHistory> insertPayStepInfo(PayStepHistory psHistory) throws InsertPayStepInfoFailed, SelectPayStepHistoryInfoFailed;

		ArrayList<PayStepHistory> deletePayStepInfo(PayStepHistory psHistory) throws DeletePayStepInfoFailed, SelectPayStepHistoryInfoFailed;

		HashMap<String, Object> selectAllEmpForSalary(int companyNo);

		ArrayList<EducationEmployee> selectEducationInfo(int reqEmpNoSeq) throws SelectEducationInfoFailed;

		ArrayList<Employee> searchEmployeeList(PageInfo pi, SearchEmployee sEmp) throws SelectEmpListFailed;

		int getSearchEmpListCount(SearchEmployee sEmp) throws GetListCountFailed;

}
