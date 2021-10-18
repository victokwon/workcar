package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.login.dao.ISampleDAO;

@Service
public class SampleService implements ISampleService {

	@Autowired ISampleDAO iSampleDAO;

	@Override
	public int SampleIdCheck(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.SampleIdCheck(params);
	}

	@Override
	public int joinMem(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.joinMem(params);
	}
	@Override
	public int joinIMem(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.joinIMem(params);
	}
	@Override
	public int joinCMem(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.joinCMem(params);
	}

	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.login(params);
	}

	@Override
	public int cInfoCheck(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.cInfoCheck(params);
	}

	@Override
	public int joinCInfo(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.joinCInfo(params);
	}

//	@Override
//	public List<HashMap<String, String>> cInfoList(HashMap<String, String> params) throws Throwable {
//		return iSampleDAO.cInfoList(params);
//	}

}
