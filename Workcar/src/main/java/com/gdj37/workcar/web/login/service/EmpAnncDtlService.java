package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.login.dao.IEmpAnncDtlDAO;

@Service
public class EmpAnncDtlService implements IEmpAnncDtlService{

	@Autowired
	IEmpAnncDtlDAO iempancdtl;

	@Override
	public HashMap<String, String> empAncDtl(HashMap<String, String> params) throws Throwable {
		
		return iempancdtl.empAncDtl(params);
	}

	@Override
	public List<HashMap<String, String>> qaulList(HashMap<String, String> params) throws Throwable {
		
		return iempancdtl.qaulList(params);
	}
	
	
}
