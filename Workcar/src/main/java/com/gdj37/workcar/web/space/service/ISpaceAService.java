package com.gdj37.workcar.web.space.service;

import java.util.HashMap;
import java.util.List;

public interface ISpaceAService {
  int getACnt(HashMap<String, String> paramHashMap) throws Throwable;
  
  List<HashMap<String, String>> getAList(HashMap<String, String> paramHashMap) throws Throwable;
  
  HashMap<String, String> getA(HashMap<String, String> paramHashMap) throws Throwable;
  
  int NoticeAdd(HashMap<String, String> paramHashMap) throws Throwable;
  
  int NoticeUpdate(HashMap<String, String> paramHashMap) throws Throwable;
  
  int ABDelete(HashMap<String, String> paramHashMap) throws Throwable;
  
  int AttchUpdate(HashMap<String, String> paramHashMap) throws Throwable;
  
  int AttchAdd(HashMap<String, String> paramHashMap) throws Throwable;
}
