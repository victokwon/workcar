package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.detail.dao.IPersonDao;

@Service
public class PersonService implements IPersonService {

	@Autowired IPersonDao iPersonDao;

	@Override
	public HashMap<String, String> getM1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM1(params) ;
	}

	@Override
	public HashMap<String, String> getM2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM2(params);
	}

	@Override
	public List<HashMap<String, String>> getM3(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM3(params);
	}

	@Override
	public HashMap<String, String> getM4(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM4(params);
	}

	@Override
	public HashMap<String, String> getM5(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM5(params);
	}

	@Override
	public HashMap<String, String> getM6(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM6(params);
	}

	@Override
	public HashMap<String, String> getM7(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM7(params);
	}

	@Override
	public List<HashMap<String, String>> getM8(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM8(params);
	}

	@Override
	public List<HashMap<String, String>> getM9(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getM9(params);
	}

	@Override
	public int getB1Cnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.getB1Cnt(params);
	}

}
