package com.gdj37.workcar.web.ca.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.ca.dao.ICADAO;

@Service
public class CAService implements ICAService {

	@Autowired ICADAO iCADAO;

	@Override
	public int SampleIdCheck(HashMap<String, String> params) throws Throwable {
		return iCADAO.SampleIdCheck(params);
	}

	@Override
	public int joinMem(HashMap<String, String> params) throws Throwable {
		return iCADAO.joinMem(params);
	}
	@Override
	public int joinIMem(HashMap<String, String> params) throws Throwable {
		return iCADAO.joinIMem(params);
	}
	@Override
	public int joinCMem(HashMap<String, String> params) throws Throwable {
		return iCADAO.joinCMem(params);
	}

	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return iCADAO.login(params);
	}

	@Override
	public int cInfoCheck(HashMap<String, String> params) throws Throwable {
		return iCADAO.cInfoCheck(params);
	}

	@Override
	public int joinCInfo(HashMap<String, String> params) throws Throwable {
		return iCADAO.joinCInfo(params);
	}

	@Override
	public int updatePass(HashMap<String, String> params) throws Throwable {
		return iCADAO.updatePass(params);
	}

	@Override
	public String findID(HashMap<String, String> params) throws Throwable {
		return iCADAO.findID(params);
	}

//	@Override
//	public List<HashMap<String, String>> cInfoList(HashMap<String, String> params) throws Throwable {
//		return iCADAO.cInfoList(params);
//	}

}
