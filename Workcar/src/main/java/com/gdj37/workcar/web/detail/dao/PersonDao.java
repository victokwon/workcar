package com.gdj37.workcar.web.detail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDao implements IPersonDao {

	@Autowired SqlSession sqlSession;

	@Override
	public HashMap<String, String> jiwonja(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.jiwonja",params);
	}

	@Override
	public HashMap<String, String> wish(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.wish",params);
	}

	@Override
	public List<HashMap<String, String>> Qualification(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("personDetail_SQL.Qualification",params);
	}
	
	@Override
	public List<HashMap<String, String>> flang(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("personDetail_SQL.flang",params);
	}
	
	@Override
	public HashMap<String, String> career(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.career",params);
	}

	@Override
	public HashMap<String, String> grade(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.grade",params);
	}

	@Override
	public HashMap<String, String> edu(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.edu",params);
	}

	@Override
	public HashMap<String, String> resum(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.resum",params);
	}



	@Override
	public List<HashMap<String, String>> list_info(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("personDetail_SQL.list_info",params);
	}

	@Override
	public int list_paging(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.list_paging",params);
	}
	
	
}
