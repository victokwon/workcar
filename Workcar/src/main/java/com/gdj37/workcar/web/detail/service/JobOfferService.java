package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.detail.dao.IJobOfferDao;	

@Service
public class JobOfferService implements IJobOfferService {
	
	@Autowired
	IJobOfferDao iJobOfferDao;
	
	@Override
	public HashMap<String, String> jiwonja(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.jiwonja(params) ;
	}

	@Override
	public HashMap<String, String> wish(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.wish(params);
	}

	@Override
	public List<HashMap<String, String>> Qualification(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.Qualification(params);
	}

	@Override
	public HashMap<String, String> grade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.grade(params);
	}

	@Override
	public HashMap<String, String> edu(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.edu(params);
	}

	@Override
	public HashMap<String, String> resum(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.resum(params);
	}

	@Override
	public HashMap<String, String> career(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.career(params);
	}

	@Override
	public List<HashMap<String, String>> flang(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.flang(params);
	}

	@Override
	public List<HashMap<String, String>> list_info(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.list_info(params);
	}

	@Override
	public int list_paging(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iJobOfferDao.list_paging(params);
	}
}
