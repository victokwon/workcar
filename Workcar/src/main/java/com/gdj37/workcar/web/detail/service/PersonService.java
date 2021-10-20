package com.gdj37.workcar.web.detail.service;

import java.util.HashMap;

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
}
