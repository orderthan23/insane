package com.kh.insane.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	//이거 쓰는사람? 없다면 지우려구요 by 정상현
	/*
	 * @Override public Employee loginCheck(SqlSessionTemplate sqlSession, Employee
	 * e) throws LoginFailedException { Employee loginUser =
	 * sqlSession.selectOne("Employee.loginEmployeeCheck", e);
	 * 
	 * if(loginUser == null) { throw new LoginFailedException("로그인 실패"); }
	 * 
	 * return loginUser; }
	 */
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Employee e) {
		
		return sqlSession.selectOne("Employee.selectPwd", e);
	}

	@Override
	public Employee selectEmployee(SqlSessionTemplate sqlSession, Employee e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Employee.selectLoginUser", e);
	}


	@Override
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Employee.insertEmployee", m);
	}


	/* 사원 정보 입력용 메소드 */
	@Override
	public int insertEmpInfo(SqlSessionTemplate sqlSession, Employee emp) throws InsertEmpInfoFailed {
		
		int result = sqlSession.update("Employee.insertEmpInfo", emp);
		
		if(result < 0) {
			throw new InsertEmpInfoFailed("사원 정보 입력 실패");
		}
		
		return result;
	}

	/* 사원 프로필 사진 등록용 메소드 */
	@Override
	public int insertEmpProfile(SqlSessionTemplate sqlSession, ProfileAttachment profile) {
		
		return sqlSession.insert("Employee.insertEmpProfile", profile);
	}
	
	@Override
	public int getListCount(SqlSessionTemplate sqlSession, int companyNo) throws GetListCountFailed {
		
		int result = sqlSession.selectOne("Employee.getListCount", companyNo);
		
		if(result < 0) {
			throw new GetListCountFailed("listCount 불러오기 실패");
		}
		
		return result;
	}

	@Override
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi, int companyNo) throws SelectEmpListFailed {

		ArrayList<Employee> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Employee.selectEmpList", companyNo, rowBounds);
		
		if(list == null) {
			throw new SelectEmpListFailed("사원 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, int companyNo) throws SelectEmpListFailed {
		
		ArrayList<Employee> list = (ArrayList) sqlSession.selectList("Employee.selectEmpList2", companyNo);
		
		if(list == null) {
			throw new SelectEmpListFailed("사원 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Location> selectLocationList(SqlSessionTemplate sqlSession, int companyNo) throws SelectLocationListFailed {
		
		ArrayList<Location> list = (ArrayList) sqlSession.selectList("Employee.selectLocationList", companyNo);
		
		if(list == null) {
			throw new SelectLocationListFailed("근무지역 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Department> selectDepartmentList(SqlSessionTemplate sqlSession, int companyNo) throws SelectDepartmentListFailed {
		
		ArrayList<Department> list = (ArrayList) sqlSession.selectList("Employee.selectDepartmentList", companyNo);
		
		if(list == null) {
			throw new SelectDepartmentListFailed("부서 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Position> selectPositionList(SqlSessionTemplate sqlSession, int companyNo) throws SelectPositionListFailed {

		ArrayList<Position> list = (ArrayList) sqlSession.selectList("Employee.selectPositionList", companyNo);
		
		if(list == null) {
			throw new SelectPositionListFailed("직급 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Rspofc> selectRspofcList(SqlSessionTemplate sqlSession, int companyNo) throws SelectRspofcListFailed {
		
		ArrayList<Rspofc> list = (ArrayList) sqlSession.selectList("Employee.selectRspofcList", companyNo);
		
		if(list == null) {
			throw new SelectRspofcListFailed("직책 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<PayStep> selectPayStepList(SqlSessionTemplate sqlSession, int companyNo) throws SelectPayStepListFailed {

		ArrayList<PayStep> list = (ArrayList) sqlSession.selectList("Employee.selectPayStepList", companyNo);
		
		if(list == null) {
			throw new SelectPayStepListFailed("호봉 리스트 조회 실패");
		}
		
		return list;
	}
	
	@Override
    public int selectRetiredListCount(Employee scEmp, SqlSessionTemplate sqlSession) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne("Employee.retiredListCount", scEmp);
    }

    @Override
    public ArrayList<Employee> selectLeavingList(Employee scEmp, com.kh.insane.common.model.vo.PageInfo pi, SqlSessionTemplate sqlSession) throws EmployeeException {
        // TODO Auto-generated method stub
        int offSet = (pi.getCurrentPage() - 1) * pi.getLimits();

        RowBounds rowBounds = new RowBounds(offSet, pi.getLimits());

        return (ArrayList) sqlSession.selectList("Employee.selectRetiredList", scEmp, rowBounds);
    }

    @Override
	public Employee selectRetiredEmp(int seqNum, SqlSessionTemplate sqlSession) {		
		return sqlSession.selectOne("Employee.selectEmployeeUseSeq", seqNum);
	}

	@Override
	public Employee selectEmpOneInfo(SqlSessionTemplate sqlSession, int empNoSeq) throws SelectEmpOneInfoFailed {
		
		Employee emp = sqlSession.selectOne("Employee.selectEmpOneInfo", empNoSeq);
		
		if(emp == null) {
			throw new SelectEmpOneInfoFailed("사원 정보 조회 실패");
		}
		
		return emp;
	}

	@Override
	public ProfileAttachment selectEmpOneProfile(SqlSessionTemplate sqlSession, ProfileAttachment reqProfile) {
		
		ProfileAttachment profile = sqlSession.selectOne("Employee.selectEmpOneProfile", reqProfile);
		
		return profile;
	}

	@Override
	public int insertFourInsurance(SqlSessionTemplate sqlSession, Employee emp) throws InsertFourInsuranceFailed {
		
		int result = sqlSession.insert("Employee.insertFourInsurance", emp);
		
		if(result < 0) {
			throw new InsertFourInsuranceFailed("4대보험 정보 등록 실패");
		}
		
		return result;
	}

	@Override
	public FourInsurance selectInsInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectInsInfoFailed {
		
		FourInsurance fourIns = sqlSession.selectOne("Employee.selectInsInfo", reqEmpNoSeq);
		
		if(fourIns == null) {
			throw new SelectInsInfoFailed("4대보험 정보 조회 실패");
		}
		
		return fourIns;
	}

	@Override
	public int updateHltIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateHltInsFailed {
		
		int result = sqlSession.update("Employee.updateHltIns", reqEmpNoSeq);
		
		if(result < 0) {
			throw new UpdateHltInsFailed("건강보험 가입 완료 실패");
		}
		
		return result;
	}
	
	@Override
	public int updateAccIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateAccInsFailed {
		
		int result = sqlSession.update("Employee.updateAccIns", reqEmpNoSeq);
		
		if(result < 0) {
			throw new UpdateAccInsFailed("산재보험 가입 완료 실패");
		}
		
		return result;
	}
	
	@Override
	public int updateEmpIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateEmpInsFailed {
		
		int result = sqlSession.update("Employee.updateEmpIns", reqEmpNoSeq);
		
		if(result < 0) {
			throw new UpdateEmpInsFailed("고용보험 가입 완료 실패");
		}
		
		return result;
	}
	
	@Override
	public int updateNtnIns(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws UpdateNtnInsFailed {
		
		int result = sqlSession.update("Employee.updateNtnIns", reqEmpNoSeq);
		
		if(result < 0) {
			throw new UpdateNtnInsFailed("국민연금 가입 완료 실패");
		}
		
		return result;
	}

	@Override
	public ArrayList<Family> selectFamInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectFamInfoFailed {
		
		ArrayList<Family> list = (ArrayList) sqlSession.selectList("Employee.selectFamInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectFamInfoFailed("가족사항 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<AcademicCareer> selectAcaInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectAcaInfoFailed {
		
		ArrayList<AcademicCareer> list = (ArrayList) sqlSession.selectList("Employee.selectAcaInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectAcaInfoFailed("학력사항 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Health> selectHealthInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectHealthInfoFailed {
		
		ArrayList<Health> list = (ArrayList) sqlSession.selectList("Employee.selectHealthInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectHealthInfoFailed("신체사항 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Career> selectCareerInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectCareerInfoFailed {
		
		ArrayList<Career> list = (ArrayList) sqlSession.selectList("Employee.selectCareerInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectCareerInfoFailed("경력사항 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<License> selectLicenseInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectLicenseInfoFailed {
		
		ArrayList<License> list = (ArrayList) sqlSession.selectList("Employee.selectLicenseInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectLicenseInfoFailed("면허사항 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Appointment> selectAppointInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectAppointInfoFailed {
		
		ArrayList<Appointment> list = (ArrayList) sqlSession.selectList("Employee.selectAppointInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectAppointInfoFailed("인사발령내역 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<RewardPunish> selectRPInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectRPInfoFailed {
		
		ArrayList<RewardPunish> list = (ArrayList) sqlSession.selectList("Employee.selectRPInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectRPInfoFailed("상벌내역 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<HRReview> selectHRreviewInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectHRreviewInfoFailed {
		
		ArrayList<HRReview> list = (ArrayList) sqlSession.selectList("Employee.selectHRreviewInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectHRreviewInfoFailed("인사고과내역 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<PayStepHistory> selectPayStepInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectPayStepHistoryInfoFailed {
		
		ArrayList<PayStepHistory> list = (ArrayList) sqlSession.selectList("Employee.selectPayStepInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectPayStepHistoryInfoFailed("정기승호내역 조회 실패");
		}
		
		return list;
	}

	@Override
	public Military selectMiliInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq){
		
		Military military = sqlSession.selectOne("Employee.selectMiliInfo", reqEmpNoSeq);
		
		return military;
	}

	@Override
	public int updateEmpInfo(SqlSessionTemplate sqlSession, Employee emp) throws UpdateEmpInfoFailed {
		
		int result = sqlSession.update("Employee.updateEmpInfo", emp);
		
		if(result < 0) {
			throw new UpdateEmpInfoFailed("사원 정보 수정 실패");
		}
		
		return result;
	}

	@Override
	public int insertMiliInfo(SqlSessionTemplate sqlSession, Military military) throws UpdateMiliInfoFailed {
		
		int result = sqlSession.insert("Employee.insertMiliInfo", military);
		
		if(result < 0) {
			throw new UpdateMiliInfoFailed("병역 정보 입력 실패");
		}
		
		return result;
	}

	@Override
	public void insertFamInfo(SqlSessionTemplate sqlSession, Family famInfo) throws InsertFamInfoFailed {
		
		int result = sqlSession.insert("Employee.insertFamInfo", famInfo);
		
		if(result < 0) {
			throw new InsertFamInfoFailed("가족 정보 입력 실패");
		}
	}

	@Override
	public void deleteFamInfo(SqlSessionTemplate sqlSession, int familySeq) throws DeleteFamInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteFamInfo", familySeq);
		
		if(result < 0) {
			throw new DeleteFamInfoFailed("가족 정보 삭제 실패");
		}
		
	}

	@Override
	public void insertAcaInfo(SqlSessionTemplate sqlSession, AcademicCareer academy) throws InsertAcaInfoFailed {
		
		int result = sqlSession.insert("Employee.insertAcaInfo", academy);
		
		if(result < 0) {
			throw new InsertAcaInfoFailed("학력 정보 입력 실패");
		}
		
	}

	@Override
	public void deleteAcaInfo(SqlSessionTemplate sqlSession, int academicCareerSeq) throws DeleteAcaInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteAcaInfo", academicCareerSeq);
		
		if(result < 0) {
			throw new DeleteAcaInfoFailed("학력 정보 삭제 실패");
		}
		
	}

	@Override
	public void insertHealthInfo(SqlSessionTemplate sqlSession, Health health) throws InsertHealthInfoFailed {
		
		int result = sqlSession.insert("Employee.insertHealthInfo", health);
		
		if(result < 0) {
			throw new InsertHealthInfoFailed("건강검진 정보 등록 실패");
		}
		
	}

	@Override
	public void deleteHealthInfo(SqlSessionTemplate sqlSession, int healthSeq) throws DeleteHealthInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteHealthInfo", healthSeq);
		
		if(result < 0) {
			throw new DeleteHealthInfoFailed("건강검진 정보 삭제 실패");
		}
		
	}

	@Override
	public void insertCareerInfo(SqlSessionTemplate sqlSession, Career career) throws InsertCareerInfoFailed {
		
		int result = sqlSession.insert("Employee.insertCareerInfo", career);
		
		if(result < 0) {
			throw new InsertCareerInfoFailed("경력 정보 등록 실패");
		}
		
	}

	@Override
	public void deleteCareerInfo(SqlSessionTemplate sqlSession, int careerSeq) throws DeleteCareerInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteCareerInfo", careerSeq);
		
		if(result < 0) {
			throw new DeleteCareerInfoFailed("경력 정보 삭제 실패");
		}
		
	}

	@Override
	public ArrayList<LicenseCompany> selectLicenseCompanyInfo(SqlSessionTemplate sqlSession, int companyNo) throws SelectLicenseCompanyInfoFailed {
		
		ArrayList<LicenseCompany> lcList = (ArrayList) sqlSession.selectList("Employee.selectLicenseCompanyInfo", companyNo);
		
		if(lcList == null) {
			throw new SelectLicenseCompanyInfoFailed("회사별 자격/면허 정보 조회 실패");
		}
		
		return lcList;
	}

	@Override
	public void insertLicenseInfo(SqlSessionTemplate sqlSession, License license) throws InsertLicenseInfoFailed {
		
		int result = sqlSession.insert("Employee.insertLicenseInfo", license);
		
		if(result < 0) {
			throw new InsertLicenseInfoFailed("자격/면허 정보 등록 실패");
		}
		
	}

	@Override
	public void deleteLicenseInfo(SqlSessionTemplate sqlSession, int licenseSeq) throws DeleteLicenseInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteLicenseInfo", licenseSeq);
		
		if(result < 0) {
			throw new DeleteLicenseInfoFailed("자격/면허 정보 삭제 실패");
		}
		
	}

	@Override
	public void insertAppointmentInfo(SqlSessionTemplate sqlSession, Appointment appointment) throws InsertAppointmentInfoFailed {
		
		int result = sqlSession.insert("Employee.insertAppointmentInfo", appointment);
		
		if(result < 0) {
			throw new InsertAppointmentInfoFailed("인사발령 내역 등록 실패");
		}
		
	}

	@Override
	public void deleteAppointmentInfo(SqlSessionTemplate sqlSession, int gvofodHistorySeq) throws DeleteAppointmentInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteAppointmentInfo", gvofodHistorySeq);
		
		if(result < 0) {
			throw new DeleteAppointmentInfoFailed("인사발령 내역 삭제 실패");
		}
		
	}

	@Override
	public void insertRewardPunishInfo(SqlSessionTemplate sqlSession, RewardPunish rp) throws InsertRewardPunishInfoFailed {
		
		int result = sqlSession.insert("Employee.insertRewardPunishInfo", rp);
		
		if(result < 0) {
			throw new InsertRewardPunishInfoFailed("상벌 내역 등록 실패");
		}
		
	}

	@Override
	public void deleteRewardPunishInfo(SqlSessionTemplate sqlSession, int rwrdPnshHistorySeq) throws DeleteRewardPunishInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteRewardPunishInfo", rwrdPnshHistorySeq);
		
		if(result < 0) {
			throw new DeleteRewardPunishInfoFailed("상벌 내역 삭제 실패");
		}
		
	}

	@Override
	public void insertHRreviewInfo(SqlSessionTemplate sqlSession, HRReview hr) throws InsertHRreviewInfoFailed {
		
		int result = sqlSession.insert("Employee.insertHRreviewInfo", hr);
		
		if(result < 0) {
			throw new InsertHRreviewInfoFailed("인사고과 내역 등록 실패");
		}
		
	}

	@Override
	public void deleteHRreviewInfo(SqlSessionTemplate sqlSession, int prsnlExmHistorySeq) throws DeleteHRreviewInfoFailed {
		
		int result = sqlSession.delete("Employee.deleteHRreviewInfo", prsnlExmHistorySeq);
		
		if(result < 0) {
			throw new DeleteHRreviewInfoFailed("인사고과 내역 삭제 실패");
		}
		
	}

	@Override
	public void insertPayStepInfo(SqlSessionTemplate sqlSession, PayStepHistory psHistory) throws InsertPayStepInfoFailed {
		
		int result = sqlSession.insert("Employee.insertPayStepInfo", psHistory);
		
		if(result < 0) {
			throw new InsertPayStepInfoFailed("승호 내역 등록 실패");
		}
		
	}

	
	@Override
	public void deletePayStepInfo(SqlSessionTemplate sqlSession, int payStepHistorySeq) throws DeletePayStepInfoFailed {
		
		int result = sqlSession.delete("Employee.deletePayStepInfo", payStepHistorySeq);
		
		if(result < 0) {
			throw new DeletePayStepInfoFailed("승호 내역 삭제 실패");
		}
	}
		
	@Override	
	public Employee selectAllEmpForSalary(SqlSessionTemplate sqlSession, int companyNo) {
		// TODO Auto-generated method stub
		//return sqlSession.selectOne("Employee.selectAllEmpForSalary", companyNo);
		return null;

	}

	@Override
	public ArrayList<EducationEmployee> selectEducationInfo(SqlSessionTemplate sqlSession, int reqEmpNoSeq) throws SelectEducationInfoFailed {
		
		ArrayList<EducationEmployee> list = (ArrayList) sqlSession.selectList("Employee.selectEducationInfo", reqEmpNoSeq);
		
		if(list == null) {
			throw new SelectEducationInfoFailed("사원-교육 내역 조회 실패");
		}
		
		return list;
	}

	@Override
	public ArrayList<Employee> searchEmployeeList(SqlSessionTemplate sqlSession, PageInfo pi, SearchEmployee sEmp) throws SelectEmpListFailed {
		
		ArrayList<Employee> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("Employee.searchEmployeeList", sEmp, rowBounds);
		
		if(list == null) {
			throw new SelectEmpListFailed("사원 리스트 조회 실패");
		}
		
		return list;
	}

	@Override
	public int getSearchEmpListCount(SqlSessionTemplate sqlSession, SearchEmployee sEmp) throws GetListCountFailed {
		
		int result = sqlSession.selectOne("Employee.getSearchEmpListCount", sEmp);
		
		if(result < 0) {
			throw new GetListCountFailed("listCount 불러오기 실패");
		}
		
		return result;
	}

	@Override
	public Appointment selectAppointOneInfo(SqlSessionTemplate sqlSession, int empNoSeq) {
		
		return sqlSession.selectOne("Employee.selectAppointOneInfo", empNoSeq);
	}


}
