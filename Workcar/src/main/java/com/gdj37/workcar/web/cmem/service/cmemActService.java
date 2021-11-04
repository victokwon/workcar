package com.gdj37.workcar.web.cmem.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.cmem.dao.IcmemActDAO;

@Service
public class cmemActService implements IcmemActService {
	@Autowired IcmemActDAO icmemActDAO;

	@Override
	public int getSendReqCnt(HashMap<String, String> params)throws Throwable {
		return icmemActDAO.getSendReqCnt(params);
	}
	@Override
	public List<HashMap<String, String>> getSendReq(HashMap<String, String> params)throws Throwable {
		return icmemActDAO.getSendReq(params);
	}
	@Override
	public int sendReqCanc(HashMap<String, String> params)throws Throwable {
		return icmemActDAO.sendReqCanc(params);
	}
}
