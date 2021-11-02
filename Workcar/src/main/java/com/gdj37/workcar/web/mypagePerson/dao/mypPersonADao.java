package com.gdj37.workcar.web.mypagePerson.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class mypPersonADao implements ImypPersonADao{
	@Autowired
	  public SqlSession sqlSession;

	@Override
	public HashMap<String, String> myInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("mypPerson.myInfo", params);
	}

	@Override
	public int addMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypPerson.addMyInfo", params);
	}

	@Override
	public int updateMMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("mypPerson.updateMMyInfo", params);
	}

	@Override
	public int updateIMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("mypPerson.updateIMyInfo", params);
	}
	
	@Override
	public int deleteMyInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("mypPerson.deleteMyInfo", params);
	}

	@Override
	public int updatePass(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("mypPerson.updatePass", params);
	}
}
