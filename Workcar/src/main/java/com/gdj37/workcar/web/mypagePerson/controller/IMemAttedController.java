package com.gdj37.workcar.web.mypagePerson.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.CommonProperties;
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.mypagePerson.service.IMemAttndService;

public class IMemAttedController {
	@Autowired
	IPagingService iPagingService;
	@Autowired 
	IMemAttndService iMemAttndService;
	
	
	@RequestMapping(value = "/iAttndInfo")
	public ModelAndView corpAttndInfo(ModelAndView mav)  {
		mav.setViewName("myPage/persionMypage/persionAttend");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/drawAttndPageAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String drawAttndPageAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			String memNo = String.valueOf(session.getAttribute("sMNo"));
			List<HashMap<String, String>> list = iMemAttndService.getAttndList(memNo);
			if(list != null) {
				modelMap.put("LIST",list);
				result = CommonProperties.RESULT_SUCCESS;
			}
		} catch (Exception e) {
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delAttentionAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String delAttentionAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			String target = params.get("target");
			int cnt = iMemAttndService.delAttention(target);
			if(cnt > 0) {
				result = CommonProperties.RESULT_SUCCESS;
			}
		} catch (Exception e) {
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getSuggetEmpAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getSuggetEmpAjax(@RequestParam HashMap<String, String> params, @RequestParam(required = false) String[] suggetEmpNo) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("memNo", params.get("memNo"));
			if(suggetEmpNo != null) {
				List<HashMap<String, Object>> suggetEmpNoList = new ArrayList<HashMap<String, Object>>();
				HashMap<String, Object> suggetEmpNoNmMap;
				for (int i = 0; i < suggetEmpNo.length; i++) {
					suggetEmpNoNmMap = new HashMap<String, Object>();
					suggetEmpNoNmMap.put("suggetEmpNo", suggetEmpNo[i]);
					suggetEmpNoList.add(suggetEmpNoNmMap);
					System.out.println(suggetEmpNoNmMap.toString());
				}
				paramMap.put("suggetEmpNoList",suggetEmpNoList);
			}
			System.out.println(paramMap.toString());
			HashMap<String, String> data = iMemAttndService.getSuggetEmp(paramMap);
			if(data != null) {
				modelMap.put("data", data);
				result = CommonProperties.RESULT_SUCCESS;
			}
		} catch (Exception e) {
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/addAttnedAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String addAttnedAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			System.out.println(params);
			int cnt = iMemAttndService.addAttned(params);
			if(cnt > 0) {
				result = CommonProperties.RESULT_SUCCESS;
			}
		} catch (Exception e) {
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getEmpListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getEmpListAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;
		System.out.println(params);

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iMemAttndService.getEmpCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iMemAttndService.getEmp(params);
			if (list == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			modelMap.put("page", page);
			modelMap.put("pb", pb);
			modelMap.put("list", list);
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/JCAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String JCAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			int cnt = iMemAttndService.JC(params);
			if(cnt > 0) {
				result = CommonProperties.RESULT_SUCCESS;
			}
		} catch (Exception e) {
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
}
