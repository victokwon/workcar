package com.gdj37.workcar.web.imem.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.imem.dao.IimemAttndDAO;

@Service
public class imemAttndService implements IimemAttndService {
	@Autowired IimemAttndDAO iimemAttndDAO;

	@Override
	public List<HashMap<String, String>> getAttndList(String memNo) {
		return iimemAttndDAO.getAttndList(memNo);
	}
	@Override
	public HashMap<String, String> getsuggetEmp(HashMap<String, Object> paramMap) {
		return iimemAttndDAO.getsuggetEmp(paramMap);
	}
	@Override
	public int delAttnd(String target) {
		return iimemAttndDAO.delAttnd(target);
	}
	@Override
	public int addAttned(HashMap<String, String> params) {
		return iimemAttndDAO.addAttned(params);
	}
}
