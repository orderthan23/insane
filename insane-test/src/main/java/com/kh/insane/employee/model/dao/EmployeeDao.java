package com.kh.insane.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.insane.employee.model.exception.EmployeeException;
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

public interface EmployeeDao {

	//Employee loginCheck(SqlSessionTemplate sqlSession, Employee e) throws LoginFailedException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Employee e);

	Employee selectEmployee(SqlSessionTemplate sqlSession, Employee e);


	int insertEmployee(SqlSessionTemplate sqlSession, Employee m);

	int insertEmpInfo(SqlSessionTemplate sqlSession, Employee emp) throws InsertEmpInfoFailed;

	int insertEmpProfile(SqlSessionTemplate sqlSession, ProfileAttachment profile);

	int getListCount(SqlSessionTemplate sqlSession, int companyNo) throws GetListCountFailed;

	ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi, int companyNo) throws SelectEmpListFailed;

	ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, int companyNo) throws SelectEmpListFailed;

	ArrayList<Location> selectLocationList(SqlSessionTemplate sqlSession, int companyNo) throws SelectLocationListFailed;

	ArrayList<Department> selectDepartmentList(SqlSessionTemplate sqlSession, int companyNo) throws SelectDepartmentListFailed;

	ArrayList<Position> selectPositionList(SqlSessionTemplate sqlSession, int companyNo) throws SelectPositionListFailed;

	ArrayList<Rspofc> selectRspofcList(SqlSessionTemplate sqlSession, int companyNo) throws SelectRspofcListFailed;

	ArrayList<PayStep> selectPayStepList(SqlSessionTemplate sqlSession, int companyNo) throws SelectPayStepListFailed;	

    int selectRetiredListCount(Employee scEmp, SqlSessionTemplate sqlSession);

    ArrayList<Employee> selectLeavingList(Employee scEmp, com.kh.insane.common.model.vo.PageInfo pi, SqlSessionTemplate sqlSession) throws EmployeeException;

    Employee selectRetiredEmp(int seqNum, SqlSessionTemplate sqlSession);

	Employee selectEmpOneInfo(SqlSessionTemplate sqlSession, int empNoSeq) throws SelectEmpOneInfoFailed;

	ProfileAttachment selectEmpOneProfile(SqlSessionTemplate sqlSession, ProfileAttachment reqProfile);

	int insertFourInsurance(SqlSessionTemplate sqlSession, Employee emp) throws InsertFourInsuranceFailed;

	FourInsurance selectInsInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectInsInfoFailed;

	int updateHltIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateHltInsFailed;

	int updateAccIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateAccInsFailed;

	int updateEmpIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateEmpInsFailed;

	int updateNtnIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateNtnInsFailed;

	ArrayList<Family> selectFamInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectFamInfoFailed;

	ArrayList<AcademicCareer> selectAcaInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectAcaInfoFailed;

	ArrayList<Health> selectHealthInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectHealthInfoFailed;

	ArrayList<Career> selectCareerInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectCareerInfoFailed;

	ArrayList<License> selectLicenseInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectLicenseInfoFailed;

	ArrayList<Appointment> selectAppointInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectAppointInfoFailed;

	ArrayList<RewardPunish> selectRPInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectRPInfoFailed;

	ArrayList<HRReview> selectHRreviewInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectHRreviewInfoFailed;

	ArrayList<PayStepHistory> selectPayStepInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectPayStepHistoryInfoFailed;

	Military selectMiliInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq);

	int updateEmpInfo(SqlSessionTemplate sqlSession, Employee emp) throws UpdateEmpInfoFailed;

	int insertMiliInfo(SqlSessionTemplate sqlSession, Military military) throws UpdateMiliInfoFailed;

	void insertFamInfo(SqlSessionTemplate sqlSession, Family famInfo) throws InsertFamInfoFailed;

	void deleteFamInfo(SqlSessionTemplate sqlSession, int familySeq) throws DeleteFamInfoFailed;

	void insertAcaInfo(SqlSessionTemplate sqlSession, AcademicCareer academy) throws InsertAcaInfoFailed;

	void deleteAcaInfo(SqlSessionTemplate sqlSession, int academicCareerSeq) throws DeleteAcaInfoFailed;

	void insertHealthInfo(SqlSessionTemplate sqlSession, Health health) throws InsertHealthInfoFailed;

	void deleteHealthInfo(SqlSessionTemplate sqlSession, int healthSeq) throws DeleteHealthInfoFailed;

	void insertCareerInfo(SqlSessionTemplate sqlSession, Career career) throws InsertCareerInfoFailed;

	void deleteCareerInfo(SqlSessionTemplate sqlSession, int careerSeq) throws DeleteCareerInfoFailed;

	ArrayList<LicenseCompany> selectLicenseCompanyInfo(SqlSessionTemplate sqlSession, int companyNo) throws SelectLicenseCompanyInfoFailed;

	void insertLicenseInfo(SqlSessionTemplate sqlSession, License license) throws InsertLicenseInfoFailed;

	void deleteLicenseInfo(SqlSessionTemplate sqlSession, int licenseSeq) throws DeleteLicenseInfoFailed;

	void insertAppointmentInfo(SqlSessionTemplate sqlSession, Appointment appointment) throws InsertAppointmentInfoFailed;

	void deleteAppointmentInfo(SqlSessionTemplate sqlSession, int gvofodHistorySeq) throws DeleteAppointmentInfoFailed;

	void insertRewardPunishInfo(SqlSessionTemplate sqlSession, RewardPunish rp) throws InsertRewardPunishInfoFailed;

	void deleteRewardPunishInfo(SqlSessionTemplate sqlSession, int rwrdPnshHistorySeq) throws DeleteRewardPunishInfoFailed;

	void insertHRreviewInfo(SqlSessionTemplate sqlSession, HRReview hr) throws InsertHRreviewInfoFailed;

	void deleteHRreviewInfo(SqlSessionTemplate sqlSession, int prsnlExmHistorySeq) throws DeleteHRreviewInfoFailed;


	void insertPayStepInfo(SqlSessionTemplate sqlSession, PayStepHistory psHistory) throws InsertPayStepInfoFailed;

	void deletePayStepInfo(SqlSessionTemplate sqlSession, int payStepHistorySeq) throws DeletePayStepInfoFailed;

	Employee selectAllEmpForSalary(SqlSessionTemplate sqlSession, int companyNo);

	ArrayList<EducationEmployee> selectEducationInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectEducationInfoFailed;

	ArrayList<Employee> searchEmployeeList(SqlSessionTemplate sqlSession, PageInfo pi, SearchEmployee sEmp) throws SelectEmpListFailed;

	int getSearchEmpListCount(SqlSessionTemplate sqlSession, SearchEmployee sEmp) throws GetListCountFailed;

	Appointment selectAppointOneInfo(SqlSessionTemplate sqlSession, int empNoSeq);
	


}
