package com.gdj37.workcar.web.mypagePerson.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemAttnndDAO implements IMemAttndDAO {
	@Autowired SqlSession sqlSession;
	
	public List<HashMap<String, String>> getAttndList(String memNo) throws Throwable {
		return sqlSession.selectList("mycorp.getAttndList",memNo);
	}

	@Override
	public int delAttention(String target) throws Throwable {
		return sqlSession.update("mycorp.delAttention",target);
	}

	@Override
	public HashMap<String, String> getSuggetEmp(HashMap<String, Object> params) throws Throwable {
		return sqlSession.selectOne("mycorp.getSuggetEmp",params);
	}

	@Override
	public int addAttned(HashMap<String, String> params) throws Throwable {
			params.put("tMemNo", sqlSession.selectOne("mycorp.resumeMemNo",params)) ;
		return sqlSession.insert("mycorp.addAttned",params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
				params.put("tMemNo", sqlSession.selectOne("mycorp.resumeMemNo",params)) ;
		return sqlSession.selectOne("mycorp.getEmpCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getEmp(HashMap<String, String> params) throws Throwable {
				params.put("tMemNo", sqlSession.selectOne("mycorp.resumeMemNo",params)) ;
		return sqlSession.selectList("mycorp.getEmp",params);
	}

	@Override
	public int JC(HashMap<String, String> params) throws Throwable {
		params.put("tMemNo", sqlSession.selectOne("mycorp.resumeMemNo",params)) ;
		return sqlSession.insert("mycorp.JC",params);
	}
}
