package com.gdj37.workcar.web.mypagePerson.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.mypagePerson.dao.ImypPersonADao;


@Service
public class mypPersonAService implements ImypPersonAService{
	@Autowired
	public ImypPersonADao imypPersonADao;

	

	@Override
	public int addMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imypPersonADao.addMyInfo(params);
	}

	@Override
	public int updateMMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imypPersonADao.updateMMyInfo(params);
	}
	
	@Override
	public int updateIMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imypPersonADao.updateIMyInfo(params);
	}

	@Override
	public int deleteMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imypPersonADao.deleteMyInfo(params);
	}

	@Override
	public HashMap<String, String> myInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imypPersonADao.myInfo(params);
	}

	@Override
	public int updatePass(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imypPersonADao.updatePass(params);
	}
}
