package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.detail.dao.IApplyDao;

@Service
public class ApplyService implements IApplyService {

	@Autowired
	public IApplyDao iApplyDao;

	@Override
	public HashMap<String, String> getinfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iApplyDao.getinfo(params);
	}

	@Override
	public HashMap<String, String> managerinfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iApplyDao.managerinfo(params);
	}

	@Override
	public int getinfo_Cnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iApplyDao.getinfo_Cnt(params);
	}

	@Override
	public List<HashMap<String, String>> getinfo_list(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iApplyDao.getinfo_list(params);
	}

	@Override
	public int reviews(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iApplyDao.reviews(params);
	}

	@Override
	public HashMap<String, String> rating(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iApplyDao.rating(params);
	}

}
