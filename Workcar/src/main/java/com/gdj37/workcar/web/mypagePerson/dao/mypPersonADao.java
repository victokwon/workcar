package com.gdj37.workcar.web.mypagePerson.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class mypPersonADao implements ImypPersonADao{
	@Autowired
	  public SqlSession sqlSession;
}
