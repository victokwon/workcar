package com.gdj37.workcar.web.ca.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CADAO implements ICADAO{

	@Autowired SqlSession sqlSession;

	@Override
	public int SampleIdCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CA_SQL.idCheck", params);
	}
	
	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CA_SQL.login", params);
	}

	@Override
	public int joinMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("CA_SQL.joinMem", params);
	}
	
	@Override
	public int joinIMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("CA_SQL.joinIMem", params);
	}
	
	@Override
	public int joinCMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("CA_SQL.joinCMem", params);
	}

	@Override
	public int joinCInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("CA_SQL.joinCInfo", params);
	}

	@Override
	public int cInfoCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CA_SQL.cInfoCheck", params);
	}

	@Override
	public int updatePass(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("CA_SQL.updatePass", params);
	}

	@Override
	public String findID(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CA_SQL.findID", params);
	}

	@Override
	public int checkImJoin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CA_SQL.checkImJoin", params);
	}
	@Override
	public int checkCmJoin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CA_SQL.checkCmJoin", params);
	}
//	@Override
//	public List<HashMap<String, String>> cInfoList(HashMap<String, String> params) throws Throwable {
//		return sqlSession.selectList("CA_SQL.cInfoList", params);
//	}



	
}
