package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.login.dao.IEmpAnncDAO;

@Service
public class EmpAnncService implements IEmpAnncService {

	@Autowired
	IEmpAnncDAO iempannc;
	
	@Override
	public int uptempannc(HashMap<String, String> params) throws Throwable {
	
		return iempannc.uptempannc(params);
	}

	@Override
	public List<HashMap<String, String>> findRegionAjax(HashMap<String, String> params) throws Throwable {
		
		return iempannc.findRegionAjax(params);
	}

	@Override
	public int insEmpAnncAjax(HashMap<String, String> params) throws Throwable {
		
		return iempannc.insEmpAnncAjax(params);
	}

	@Override
	public int insEmpQual(HashMap<String, Object> empQual) throws Throwable {
		// TODO Auto-generated method stub
		return  iempannc.insEmpQual(empQual);
	}

	@Override
	public int uptDocBox(HashMap<String, Object> docBox) throws Throwable {
		
		return iempannc.uptDocBox(docBox);
	}

	@Override
	public int uptEmpBox(HashMap<String, Object> prcsBox) throws Throwable {
		
		return iempannc.uptEmpBox(prcsBox);
	}

	@Override
	public int insAttchFile(HashMap<String, String> params) throws Throwable {
		
		return iempannc.insAttchFile(params);
	}

	/*
	 * @Override public int uptEmpQual(HashMap<String, String> params) throws
	 * Throwable {
	 * 
	 * return iempannc.uptEmpQual(params); }
	 */

	

}
