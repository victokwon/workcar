package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HRSearchDAO implements IHRSearchDAO {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getHRSch1Cnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("HRSearch.getHRSch1Cnt", params);
	}

	@Override
	public List<HashMap<String, String>> getHRSch1List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("HRSearch.getHRSch1List", params);
	}
}
