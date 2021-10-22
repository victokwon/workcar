package com.gdj37.workcar.web.resume.service;

import java.util.HashMap;
import java.util.List;

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
	
}
