package com.gdj37.workcar.web.login.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MngEmpAncDAO implements IMngEmpAncDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> empAncList(String memberNo)  throws Throwable {
		
		return sqlSession.selectList("mngempanc.empAncList",memberNo);
	}

	@Override
	public int delEmpAnc(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("mngempanc.delEmpAnc",params);
	}


	}

