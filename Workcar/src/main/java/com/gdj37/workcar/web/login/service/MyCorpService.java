package com.gdj37.workcar.web.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.workcar.web.login.dao.IMyCorpDAO;

@Service
public class MyCorpService implements IMyCorpService {
	
	@Autowired
	IMyCorpDAO imycorpdao;

	@Override
	public HashMap<String, String> cMemberDtl(String memberNo) throws Throwable {
		
		return imycorpdao.cMemberDtl(memberNo);
	}

	@Override
	public int uptinfor(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.uptinfor(params);
	}

	@Override
	public int uptcpinfor(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.uptcpinfor(params);
	}

	@Override
	public int imemCnt(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.imemCnt(params);
	}

	@Override
	public List<HashMap<String, String>> imemList(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.imemList(params);
	}

	@Override
	public int chkNowPass(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.chkNowPass(params);
	}

	@Override
	public int uptNewPass(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.uptNewPass(params);
	}

}