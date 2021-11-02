package com.gdj37.workcar.web.imemAct.controller;

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
import com.gdj37.workcar.web.imemAct.service.IimemActService;
@Controller
public class imemActController {
	
	@Autowired IPagingService iPagingService;
	@Autowired IimemActService iimemActService; 
	
	
	@RequestMapping(value = "/imemStar")
	public ModelAndView imemStar(ModelAndView mav) {
		mav.setViewName("imemAct/imemStar");
		return mav;
	}
	
	@RequestMapping(value = "/recepReq")
	public ModelAndView recepReq(ModelAndView mav) {
		mav.setViewName("imemAct/recepReq");
		return mav;
	}
	
	@RequestMapping(value = "/submitResum")
	public ModelAndView manageMemberList(ModelAndView mav) {
		mav.setViewName("imemAct/submitResum");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/imemUpdateGrdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String imemUpdateGrdAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = iimemActService.imemUpdateGrd(params);
			if (cnt <= 0) {
				result = CommonProperties.RESULT_FAILED;
			}
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getSubResumAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getSubResumAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;
		System.out.println(params);

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iimemActService.getSubResumCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iimemActService.getSubResum(params);
			if (list == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			modelMap.put("cnt", cnt);
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
	@RequestMapping(value = "/changeSubResumAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String changeSubResumAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = iimemActService.changeSubResum(params);
			if (cnt <= 0) {
				result = CommonProperties.RESULT_FAILED;
			}
			if (cnt <= 0) {
				result = CommonProperties.RESULT_FAILED;
			}
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/DelSupResumAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String DelSupResumAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = iimemActService.DelSupResum(params);
			if (cnt <= 0) {
				result = CommonProperties.RESULT_FAILED;
			}
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRecepReqAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getRecepReqAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;
		System.out.println(params);

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iimemActService.getRecepReqCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iimemActService.getRecepReq(params);
			if (list == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			modelMap.put("cnt", cnt);
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
}
