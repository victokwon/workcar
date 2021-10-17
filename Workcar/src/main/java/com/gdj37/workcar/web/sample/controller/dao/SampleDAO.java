package com.gdj37.workcar.web.sample.controller.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SampleDAO implements ISampleDAO{

	@Autowired SqlSession sqlSession;

	@Override
	public int SampleIdCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Sample_SQL.idCheck", params);
	}
	
	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Sample_SQL.login", params);
	}

	@Override
	public int joinMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Sample_SQL.joinMem", params);
	}
	
	@Override
	public int joinIMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Sample_SQL.joinIMem", params);
	}
	
	@Override
	public int joinCMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Sample_SQL.joinCMem", params);
	}

	@Override
	public int joinCInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Sample_SQL.joinCInfo", params);
	}

	@Override
	public int cInfoCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Sample_SQL.cInfoCheck", params);
	}

//	@Override
//	public List<HashMap<String, String>> cInfoList(HashMap<String, String> params) throws Throwable {
//		return sqlSession.selectList("Sample_SQL.cInfoList", params);
//	}



	
}
