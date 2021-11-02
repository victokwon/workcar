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
	public int uptinfo(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.uptinfo(params);
	}

	@Override
	public int uptcpinfo(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.uptcpinfo(params);
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

	@Override
	public int outCMember(HashMap<String, String> params) throws Throwable {
		
		return imycorpdao.outCMember(params);
	}

	
	@Override
	public int uptinfopos(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return imycorpdao.uptinfopos(params);
	}
	
	
	
	
	@Override
	public List<HashMap<String, String>> getAttndList(String memNo) throws Throwable {
		return imycorpdao.getAttndList(memNo);
	}
	@Override
	public int delAttention(String target) throws Throwable {
		return imycorpdao.delAttention(target);
	}
	@Override
	public HashMap<String, String> getsuggetResume(HashMap<String, Object> params) throws Throwable {
		return imycorpdao.getsuggetResume(params);
	}
	@Override
	public int addAttned(HashMap<String, String> params) throws Throwable {
		return imycorpdao.addAttned(params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return imycorpdao.getEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEmp(HashMap<String, String> params) throws Throwable {
		return imycorpdao.getEmp(params);
	}

	@Override
	public int JC(HashMap<String, String> params) throws Throwable {
		return imycorpdao.JC(params);
	}



}
