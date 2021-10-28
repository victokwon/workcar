package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCorpDAO implements IMyCorpDAO {
	
	@Autowired SqlSession sqlSession;

	@Override
	public HashMap<String, String> cMemberDtl(String memberNo) throws Throwable  {
		
		return sqlSession.selectOne("mycorp.cMemberDtl",memberNo);
	}

	@Override
	public int uptinfo(HashMap<String, String> params) throws Throwable{
		
		
		//sqlSession.update("mycorp.uptinfopos",params);
		// sqlSession.update("mycorp.uptinfo",params);
		// sqlSession.update("mycorp.uptinfopos",params);
		
		return  sqlSession.update("mycorp.uptinfo",params);
	}

	@Override
	public int uptcpinfo(HashMap<String, String> params) throws Throwable{
		
		return sqlSession.update("mycorp.uptcpinfo",params);
	}

	@Override
	public int imemCnt(HashMap<String, String> params)throws Throwable {
		
		return sqlSession.selectOne("mycorp.imemCnt",params);
	}

	@Override
	public List<HashMap<String, String>> imemList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("mycorp.imemList",params);
	}

	@Override
	public int chkNowPass(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("mycorp.chkNowPass",params);
	}

	@Override
	public int uptNewPass(HashMap<String, String> params) throws Throwable {
		
		
		return sqlSession.update("mycorp.uptNewPass",params);
	}

	@Override
	public int outCMember(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("mycorp.outCMember",params);
	}

}
