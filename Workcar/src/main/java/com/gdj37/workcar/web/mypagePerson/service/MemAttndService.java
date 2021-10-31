package com.gdj37.workcar.web.mypagePerson.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.mypagePerson.dao.IMemAttndDAO;

@Service
public class MemAttndService implements IMemAttndService {
	@Autowired IMemAttndDAO iMemAttndDAO;
	
	@Override
	public List<HashMap<String, String>> getAttndList(String memNo) throws Throwable {
		return iMemAttndDAO.getAttndList(memNo);
	}
	@Override
	public int delAttention(String target) throws Throwable {
		return iMemAttndDAO.delAttention(target);
	}
	@Override
	public HashMap<String, String> getSuggetEmp(HashMap<String, Object> params) throws Throwable {
		return iMemAttndDAO.getSuggetEmp(params);
	}
	@Override
	public int addAttned(HashMap<String, String> params) throws Throwable {
		return iMemAttndDAO.addAttned(params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return iMemAttndDAO.getEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEmp(HashMap<String, String> params) throws Throwable {
		return iMemAttndDAO.getEmp(params);
	}

	@Override
	public int JC(HashMap<String, String> params) throws Throwable {
		return iMemAttndDAO.JC(params);
	}
	
}
