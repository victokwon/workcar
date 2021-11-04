package com.gdj37.workcar.web.resume.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.resume.dao.IResumeDAO;

@Service
public class ResumeService implements IResumeService {
	@Autowired IResumeDAO iResumeDAO;

	@Override
	public List<HashMap<String, String>> resumeList(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeList(params);
	}

	@Override
	public int getResumeCnt(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getResumeCnt(params);
	}

	@Override
	public int applyResume(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.applyResume(params);
	}


	@Override
	public List<HashMap<String, String>> resumeDtlQual(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlQual(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlFlang(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlFlang(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlWork(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlWork(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlEdu(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlEdu(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlIedu(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlIedu(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlSintro(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlSintro(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlAttach(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlAttach(params);
	}

	@Override
	public List<HashMap<String, String>> resumeDtlCarr(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlCarr(params);
	}

	@Override
	public HashMap<String, String> getResumeDtl(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getResumeDtl(params);
	}

	@Override
	public  List<HashMap<String, String>> resumeDtlLoc(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.resumeDtlLoc(params);
	}

	@Override
	public HashMap<String, String> getAddContCnt(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getAddContCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getRegion(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getRegion(params);
	}

	@Override
	public int getSectorCnt(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getSectorCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSector(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getSector(params);
	}
	
	@Override
	public int getQualCnt(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getQualCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getQual(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getQual(params);
	}
	
// 생성(수정)
	@Override
	public int AttchUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.AttchUpdate(paramMap);
	}

	@Override
	public int CarrUpdate(Map<String, Object> paramMap)throws Throwable {
		return iResumeDAO.CarrUpdate(paramMap);
	}

	@Override
	public int EduUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.EduUpdate(paramMap);
	}

	@Override
	public int IeduUpdate(Map<String, Object> paramMap)throws Throwable {
		return iResumeDAO.IeduUpdate(paramMap);
	}

	@Override
	public int FlangUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.FlangUpdate(paramMap);
	}

	@Override
	public int LocUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.LocUpdate(paramMap);
	}

	@Override
	public int QualUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.QualUpdate(paramMap);
	}

	@Override
	public int SintroUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.SintroUpdate(paramMap);
	}

	@Override
	public int WorkUpdate(Map<String, Object> paramMap) throws Throwable{
		return iResumeDAO.WorkUpdate(paramMap);
	}

	@Override
	public int dtlUpdate(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.dtlUpdate(params);
	}

	@Override
	public int dtlAdd(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.dtlAdd(params);
	}

	@Override
	public HashMap<String, String> getUserDtl(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getUserDtl(params);
	}

	
	
	
	@Override
	public int PA(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.PA(params);
	}
	@Override
	public List<HashMap<String, String>> getResume(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getResume(params);
	}
	@Override
	public int getResumeEmpCnt(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.getResumeEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> empResumeList(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.empResumeList(params);
	}

	@Override
	public int empResumeCnt(HashMap<String, String> params) throws Throwable {
		return iResumeDAO.empResumeCnt(params);
	}
}
