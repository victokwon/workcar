package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.detail.dao.ICorporDao;

@Service
public class CorporService implements ICorporService {

	
	@Autowired ICorporDao iCorporDao;

	@Override
	public HashMap<String, String> corporinfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCorporDao.corporinfo(params);
	}

	@Override
	public int list_paging(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCorporDao.list_paging(params);
	}

	@Override
	public List<HashMap<String, String>> getP2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCorporDao.getP2(params);
	}

	@Override
	public int reviews(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCorporDao.reviews(params);
	}

	@Override
	public HashMap<String, String> rating(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCorporDao.rating(params);
	}

	@Override
	public int starEnroll(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCorporDao.starEnroll(params);
	}

	
	
}
