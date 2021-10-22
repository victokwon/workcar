package com.gdj37.workcar.web.space.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.space.dao.ISpaceADao;


@Service
public class SpaceAService implements ISpaceAService {
	@Autowired
	public ISpaceADao iSpaceADao;

	@Override
	public int getACnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSpaceADao.getACnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSpaceADao.getAList(params);
	}

	@Override
	public HashMap<String, String> getA(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSpaceADao.getA(params);
	}

	
	
	
}
