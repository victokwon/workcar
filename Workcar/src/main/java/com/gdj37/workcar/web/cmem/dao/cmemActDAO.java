package com.gdj37.workcar.web.cmem.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class cmemActDAO implements IcmemActDAO {
@Autowired SqlSession sqlSession;

@Override
public int getSendReqCnt(HashMap<String, String> params) throws Throwable {
	return sqlSession.selectOne("CmemMP_SQL.getSendReqCnt",params);
}

@Override
public List<HashMap<String, String>> getSendReq(HashMap<String, String> params) throws Throwable {
	return sqlSession.selectList("CmemMP_SQL.getSendReq",params);
}

@Override
public int sendReqCanc(HashMap<String, String> params) throws Throwable {
	return sqlSession.delete("CmemMP_SQL.sendReqCanc",params);
}


}
