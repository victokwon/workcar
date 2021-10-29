package com.gdj37.workcar.web.manage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.manage.dao.IManageDAO;


@Service
public class ManageService implements IManageService {
	@Autowired IManageDAO iManageDAO;

	@Override
	public int getDclCnt(HashMap<String, String> params) throws Throwable {
		return iManageDAO.getDclCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getDcl(HashMap<String, String> params) throws Throwable {
		return iManageDAO.getDcl(params);
	}

	@Override
	public HashMap<String, String> getDclDtl(HashMap<String, String> params) throws Throwable {
		return iManageDAO.getDclDtl(params);
	}

	@Override
	public int updateDcl(HashMap<String, String> params) throws Throwable {
		return iManageDAO.updateDcl(params);
	}

	@Override
	public int ReportedEmpDel(HashMap<String, String> params) throws Throwable {
		return iManageDAO.ReportedEmpDel(params);
	}
	
}
