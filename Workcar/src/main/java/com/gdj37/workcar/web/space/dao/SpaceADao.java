package com.gdj37.workcar.web.space.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpaceADao implements ISpaceADao {
  @Autowired
  public SqlSession sqlSession;
  
  public int getACnt(HashMap<String, String> params) throws Throwable {
    return ((Integer)this.sqlSession.selectOne("space.getACnt", params)).intValue();
  }
  
  public List<HashMap<String, String>> getAList(HashMap<String, String> params) throws Throwable {
    return this.sqlSession.selectList("space.getAList", params);
  }
  
  public HashMap<String, String> getA(HashMap<String, String> params) throws Throwable {
    return (HashMap<String, String>)this.sqlSession.selectOne("space.getA", params);
  }
  
  public int NoticeAdd(HashMap<String, String> params) throws Throwable {
    return this.sqlSession.insert("space.NoticeAdd", params);
  }
  
  public int NoticeUpdate(HashMap<String, String> params) throws Throwable {
    return this.sqlSession.update("space.NoticeUpdate", params);
  }
  
  public int ABDelete(HashMap<String, String> params) throws Throwable {
    return this.sqlSession.update("space.ABDelete", params);
  }
  
  public int AttchUpdate(HashMap<String, String> params) throws Throwable {
    return this.sqlSession.update("space.AttchUpdate", params);
  }
  
  public int AttchAdd(HashMap<String, String> params) throws Throwable {
    return this.sqlSession.insert("space.AttchAdd", params);
  }
}
