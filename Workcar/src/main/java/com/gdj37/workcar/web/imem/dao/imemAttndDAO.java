package com.gdj37.workcar.web.imem.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class imemAttndDAO implements IimemAttndDAO {
	@Autowired SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getAttndList(String memNo) {
		return sqlSession.selectList("ImemActNAttnd_SQL.getAttndList", memNo);
	}
	@Override
	public HashMap<String, String> getsuggetEmp(HashMap<String, Object> paramMap) {
		return sqlSession.selectOne("ImemActNAttnd_SQL.getAttndList", paramMap);
	}
	@Override
	public int delAttnd(String target) {
		return sqlSession.delete("ImemActNAttnd_SQL.delAttnd", target);
	}
	@Override
	public int addAttned(HashMap<String, String> params) {
		params.put("tMemNo",  sqlSession.selectOne("ImemActNAttnd_SQL.empMemNo",params)) ;
		return sqlSession.update("ImemActNAttnd_SQL.addAttned", params);
	}
	@Override
	public List<HashMap<String, String>> getEmp(HashMap<String, String> params) {
		return sqlSession.selectList("ImemActNAttnd_SQL.getEmp", params);
	}
}
