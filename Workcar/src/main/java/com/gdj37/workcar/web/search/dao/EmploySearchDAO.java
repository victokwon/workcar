package com.gdj37.workcar.web.search.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmploySearchDAO implements IEmploySearchDAO{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getEmpSch1Cnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmploySearch.getEmpSch1Cnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEmpSch1List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("EmploySearch.getEmpSch1List", params);
	}
}
