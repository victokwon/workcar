package com.gdj37.workcar.web.sample.controller.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.sample.controller.dao.ISampleDAO;

@Service
public class SampleService implements ISampleService {

	@Autowired ISampleDAO iSampleDAO;

	@Override
	public int SampleIdCheck(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.SampleIdCheck(params);
	}

	@Override
	public int joinMember(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.joinMember(params);
	}

	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return iSampleDAO.login(params);
	}
}
