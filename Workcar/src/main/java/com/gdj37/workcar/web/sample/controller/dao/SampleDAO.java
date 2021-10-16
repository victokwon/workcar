package com.gdj37.workcar.web.sample.controller.dao;

import java.util.HashMap;

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
	public int joinMember(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Sample_SQL.joinMember", params);
	}

	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Sample_SQL.login", params);
	}
	
}
