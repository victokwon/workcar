package com.gdj37.workcar.web.search.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.search.dao.IHRSearchDAO;

@Service
public class HRSearchService implements IHRSearchService{
	@Autowired
	public IHRSearchDAO iHRSearchDAO;

	@Override
	public int getHRSch1Cnt(HashMap<String, String> params) throws Throwable {
		return iHRSearchDAO.getHRSch1Cnt(params);
	}

	@Override
	public List<HashMap<String, String>> getHRSch1List(HashMap<String, String> params) throws Throwable {
		return iHRSearchDAO.getHRSch1List(params);
	}
}
