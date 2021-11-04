package com.gdj37.workcar.web.space.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.space.service.ISpaceAService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpaceAController {
  @Autowired
  public ISpaceAService iSpaceAService;
  
  @Autowired
  public IPagingService iPagingService;
  
  @RequestMapping({"/mainSpace"})
  public ModelAndView mainSpace(ModelAndView mav) {
    mav.setViewName("space/mainSpace");
    return mav;
  }
  
  @RequestMapping({"/personalSpace"})
  public ModelAndView personalSpace(ModelAndView mav) {
    mav.setViewName("space/personalSpace");
    return mav;
  }
  
  @RequestMapping({"/ntcSpaceABList"})
  public ModelAndView ntcSpaceABList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
    String page = "1";
    if (params.get("page") != null)
      page = params.get("page"); 
    mav.addObject("page", page);
    mav.setViewName("space/ntcSpaceABList");
    return mav;
  }
  
  @RequestMapping(value = {"/ntcSpaceABLists"}, method = {RequestMethod.POST}, produces = {"text/json;charset=UTF-8"})
  @ResponseBody
  public String ntcSpaceABLists(@RequestParam HashMap<String, String> params) throws Throwable {
    ObjectMapper mapper = new ObjectMapper();
    Map<String, Object> modelMap = new HashMap<>();
    int page = Integer.parseInt(params.get("page"));
    int cnt = this.iSpaceAService.getACnt(params);
    PagingBean pb = this.iPagingService.getPagingBean(page, cnt, 5, 5);
    params.put("startCnt", Integer.toString(pb.getStartCount()));
    params.put("endCnt", Integer.toString(pb.getEndCount()));
    List<HashMap<String, String>> list = this.iSpaceAService.getAList(params);
    modelMap.put("list", list);
    modelMap.put("pb", pb);
    return mapper.writeValueAsString(modelMap);
  }
  
  @RequestMapping({"/ntcAB"})
  public ModelAndView ntcAB(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
    if (params.get("no") != null) {
      HashMap<String, String> data = this.iSpaceAService.getA(params);
      mav.addObject("data", data);
      mav.setViewName("space/ntcAB");
    } else {
      mav.setViewName("redirect:ntcSpaceABList");
    } 
    return mav;
  }
  
  @RequestMapping({"/ntcABAdd"})
  public ModelAndView ntcABAdd(ModelAndView mav) {
    mav.setViewName("space/ntcABAdd");
    return mav;
  }
  
  @RequestMapping(value = {"/ntcABAdds"}, method = {RequestMethod.POST}, produces = {"text/json;charset=UTF-8"})
  @ResponseBody
  public String ntcABAdds(@RequestParam HashMap<String, String> params) throws Throwable {
    ObjectMapper mapper = new ObjectMapper();
    Map<String, Object> modelMap = new HashMap<>();
    String result = "success";
    try {
      int Ncnt = this.iSpaceAService.NoticeAdd(params);
      int Acnt = this.iSpaceAService.AttchAdd(params);
      if (Ncnt == 0 && Acnt == 0)
        result = "failed"; 
    } catch (Exception e) {
      e.printStackTrace();
      result = "error";
    } 
    modelMap.put("result", result);
    return mapper.writeValueAsString(modelMap);
  }
  
  @RequestMapping({"/ntcABUpdate"})
  public ModelAndView ntcABUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
    if (params.get("no") != null) {
      HashMap<String, String> data = this.iSpaceAService.getA(params);
      mav.addObject("data", data);
      mav.setViewName("space/ntcABUpdate");
    } else {
      mav.setViewName("redirect:ntcSpaceABList");
    } 
    return mav;
  }
  
  @RequestMapping(value = {"/ntcABUpdates"}, method = {RequestMethod.POST}, produces = {"text/json;charset=UTF-8"})
  @ResponseBody
  public String ntcABUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
    ObjectMapper mapper = new ObjectMapper();
    Map<String, Object> modelMap = new HashMap<>();
    String result = "success";
    try {
      int Ncnt = this.iSpaceAService.NoticeUpdate(params);
      int Acnt = this.iSpaceAService.AttchUpdate(params);
      if (Ncnt == 0 && Acnt == 0)
        result = "failed"; 
    } catch (Exception e) {
      e.printStackTrace();
      result = "error";
    } 
    modelMap.put("result", result);
    return mapper.writeValueAsString(modelMap);
  }
  
  @RequestMapping(value = {"/ntcABDeletes"}, method = {RequestMethod.POST}, produces = {"text/json;charset=UTF-8"})
  @ResponseBody
  public String ntcABDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
    ObjectMapper mapper = new ObjectMapper();
    Map<String, Object> modelMap = new HashMap<>();
    String result = "success";
    try {
      int cnt = this.iSpaceAService.ABDelete(params);
      if (cnt == 0)
        result = "failed"; 
    } catch (Exception e) {
      e.printStackTrace();
      result = "error";
    } 
    modelMap.put("result", result);
    return mapper.writeValueAsString(modelMap);
  }
  
  @RequestMapping({"/quesSpace"})
  public ModelAndView quesSpace(ModelAndView mav) {
    mav.setViewName("space/quesSpace");
    return mav;
  }
}
