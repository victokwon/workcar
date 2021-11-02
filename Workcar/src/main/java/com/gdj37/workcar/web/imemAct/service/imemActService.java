package com.gdj37.workcar.web.imemAct.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.imemAct.dao.IimemActDAO;

@Service
public class imemActService implements IimemActService {
	@Autowired IimemActDAO iimemActDAO;

	@Override
	public int imemUpdateGrd(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.imemUpdateGrd(params);
	}

	@Override
	public int getSubResumCnt(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.getSubResumCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSubResum(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.getSubResum(params);
	}

	@Override
	public int changeSubResum(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.changeSubResum(params);
	}

	@Override
	public int DelSupResum(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.DelSupResum(params);
	}

	@Override
	public int getRecepReqCnt(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.getRecepReqCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getRecepReq(HashMap<String, String> params) throws Throwable {
		return iimemActDAO.getRecepReq(params);
	}
}
