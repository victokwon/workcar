package com.gdj37.workcar.web.search.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.search.dao.IEmploySearchDAO;

@Service
public class EmploySearchService implements IEmploySearchService{
	@Autowired
	public IEmploySearchDAO iEmploySearchDAO;

	@Override
	public int getEmpSch1Cnt(HashMap<String, String> params) throws Throwable {
		return iEmploySearchDAO.getEmpSch1Cnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEmpSch1List(HashMap<String, String> params) throws Throwable {
		return iEmploySearchDAO.getEmpSch1List(params);
	}
}
