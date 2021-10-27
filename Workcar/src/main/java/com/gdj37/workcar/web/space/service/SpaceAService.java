package com.gdj37.workcar.web.space.service;

import com.gdj37.workcar.web.space.dao.ISpaceADao;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpaceAService implements ISpaceAService {
  @Autowired
  public ISpaceADao iSpaceADao;
  
  public int getACnt(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.getACnt(params);
  }
  
  public List<HashMap<String, String>> getAList(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.getAList(params);
  }
  
  public HashMap<String, String> getA(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.getA(params);
  }
  
  public int NoticeAdd(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.NoticeAdd(params);
  }
  
  public int NoticeUpdate(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.NoticeUpdate(params);
  }
  
  public int ABDelete(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.ABDelete(params);
  }
  
  public int AttchUpdate(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.AttchUpdate(params);
  }
  
  public int AttchAdd(HashMap<String, String> params) throws Throwable {
    return this.iSpaceADao.AttchAdd(params);
  }
}
