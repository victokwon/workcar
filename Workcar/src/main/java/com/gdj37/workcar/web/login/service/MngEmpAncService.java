package com.gdj37.workcar.web.login.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.login.dao.IMngEmpAncDAO;

@Service
public class MngEmpAncService implements IMngEmpAncService {

	@Autowired
	IMngEmpAncDAO imngdao;

	@Override
	public List<HashMap<String, String>> empAncList(String memberNo) throws Throwable {
		
		return imngdao.empAncList(memberNo);
	}

	@Override
	public int delEmpAnc(HashMap<String, String> params) throws Throwable {
		
		return imngdao.delEmpAnc(params);
	}

	@Override
	public List<HashMap<String, String>> empResumeList(HashMap<String, String> params) throws Throwable {
		
		return imngdao.empResumeList(params);
	}

}
