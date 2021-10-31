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
	public HashMap<String, String> jiwonja(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.jiwonja(params) ;
	}

	@Override
	public HashMap<String, String> wish(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.wish(params);
	}

	@Override
	public List<HashMap<String, String>> Qualification(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.Qualification(params);
	}

	@Override
	public HashMap<String, String> grade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.grade(params);
	}

	@Override
	public HashMap<String, String> edu(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.edu(params);
	}

	@Override
	public HashMap<String, String> resum(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.resum(params);
	}

	@Override
	public HashMap<String, String> career(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.career(params);
	}

	@Override
	public List<HashMap<String, String>> flang(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.flang(params);
	}

	@Override
	public List<HashMap<String, String>> list_info(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.list_info(params);
	}

	@Override
	public int list_paging(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPersonDao.list_paging(params);
	}

}
