package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CInfoSearchDAO implements ICInfoSearchDAO{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getCInfoSch1Cnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("CinfoSearch.getCInfoSch1Cnt",params);
	}

	@Override
	public List<HashMap<String, String>> getCInfoSch1List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("CinfoSearch.getCInfoSch1List", params);
	}

}
