package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CorporDao implements ICorporDao  {

	@Autowired SqlSession sqlSession;

	@Override
	public HashMap<String, String> getP1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CInfoDtl_SQL.getP1",params);
	}

	@Override
	public int getP2Cnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CInfoDtl_SQL.getP2Cnt",params);
	}

	@Override
	public List<HashMap<String, String>> getP2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CInfoDtl_SQL.getP2",params);
	}


	
}
