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
	public HashMap<String, String> getM1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getM1",params);
	}

	@Override
	public HashMap<String, String> getM2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getM2",params);
	}

	@Override
	public List<HashMap<String, String>> getM3(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("personDetail_SQL.getM3",params);
	}

	@Override
	public HashMap<String, String> getM4(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getM4",params);
	}

	@Override
	public HashMap<String, String> getM5(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getM5",params);
	}

	@Override
	public HashMap<String, String> getM6(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getM6",params);
	}

	@Override
	public HashMap<String, String> getM7(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getM7",params);
	}

	@Override
	public List<HashMap<String, String>> getM8(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("personDetail_SQL.getM8",params);
	}

	@Override
	public List<HashMap<String, String>> getM9(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("personDetail_SQL.getM9",params);
	}

	@Override
	public int getB1Cnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("personDetail_SQL.getB1Cnt",params);
	}
	
	
}
