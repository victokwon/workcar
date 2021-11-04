package com.gdj37.workcar.web.cmem.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.CommonProperties;
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.login.service.IMyCorpService;

@Controller
public class cmemAttndController {
	
	@Autowired
	IMyCorpService imycorpser;
	@Autowired
	IPagingService iPagingService;
	
	
	
	@RequestMapping(value = "/cmemAttnd")
	public ModelAndView cmemAttnd(ModelAndView mav)  {
		mav.setViewName("myPage/corMypage/cmemAttnd");
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
			List<HashMap<String, String>> list = imycorpser.getAttndList(memNo);
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
			int cnt = imycorpser.delAttention(target);
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
	@RequestMapping(value = "/getsuggetResumeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getsuggetResumeAjax(@RequestParam HashMap<String, String> params, @RequestParam(required = false) String[] suggetResumeNo) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("memNo", params.get("memNo"));
			if(suggetResumeNo != null) {
				List<HashMap<String, Object>> suggetResumeNoList = new ArrayList<HashMap<String, Object>>();
				HashMap<String, Object> suggetResumeNoNmMap;
				for (int i = 0; i < suggetResumeNo.length; i++) {
					suggetResumeNoNmMap = new HashMap<String, Object>();
					suggetResumeNoNmMap.put("suggetResumeNo", suggetResumeNo[i]);
					suggetResumeNoList.add(suggetResumeNoNmMap);
					System.out.println(suggetResumeNoNmMap.toString());
				}
				paramMap.put("suggetResumeNoList",suggetResumeNoList);
			}
			System.out.println(paramMap.toString());
			HashMap<String, String> data = imycorpser.getsuggetResume(paramMap);
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
			int cnt = imycorpser.addAttned(params);
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
			int cnt = imycorpser.getEmpCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = imycorpser.getEmp(params);
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
			int cnt = imycorpser.JC(params);
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
