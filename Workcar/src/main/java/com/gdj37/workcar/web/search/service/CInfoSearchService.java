package com.gdj37.workcar.web.search.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.search.dao.ICInfoSearchDAO;

@Service
public class CInfoSearchService implements ICInfoSearchService{
	@Autowired
	public ICInfoSearchDAO iCInfoSearchDAO;

	@Override
	public int getCInfoSch1Cnt(HashMap<String, String> params) throws Throwable {
		return iCInfoSearchDAO.getCInfoSch1Cnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCInfoSch1List(HashMap<String, String> params) throws Throwable {
		return iCInfoSearchDAO.getCInfoSch1List(params);
	}

	@Override
	public void updateCInfoHit(HashMap<String, String> params) throws Throwable {
		iCInfoSearchDAO.updateCInfoHit(params);
		
	}

	@Override
	public HashMap<String, String> getCInfo(HashMap<String, String> params) throws Throwable {
		return iCInfoSearchDAO.getCInfo(params);
	}
}
