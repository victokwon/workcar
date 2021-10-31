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
	public HashMap<String, String> corporinfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CInfoDtl_SQL.corporinfo",params);
	}

	@Override
	public int list_paging(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CInfoDtl_SQL.list_paging",params);
	}

	@Override
	public List<HashMap<String, String>> getP2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CInfoDtl_SQL.getP2",params);
	}

	@Override
	public int reviews(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("CInfoDtl_SQL.reviews",params);
	}

	@Override
	public HashMap<String, String> rating(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CInfoDtl_SQL.rating",params);
	}

	@Override
	public int starEnroll(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("CInfoDtl_SQL.starEnroll",params);
	}



	
}
