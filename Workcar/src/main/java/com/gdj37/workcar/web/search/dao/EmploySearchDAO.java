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

	@Override
	public int getQualCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmploySearch.getQualCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getQual(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("EmploySearch.getQual", params);
	}

	@Override
	public int getAddContCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmploySearch.getAddContCnt", params);
	}

	@Override
	public int getSectorCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmploySearch.getSectorCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSector(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("EmploySearch.getSector", params);
	}

	@Override
	public List<HashMap<String, String>> getRegion(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("EmploySearch.getRegion", params);
	}

	@Override
	public List<HashMap<String, String>> getEmployViewsTop1List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("EmploySearch.getEmployViewsTop1List", params);
	}

	@Override
	public int getEmployViewsTop1Cnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("EmploySearch.getEmployViewsTop1Cnt", params);
	}
}
