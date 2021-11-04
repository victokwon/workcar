package com.gdj37.workcar.web.cmem.controller;

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
import com.gdj37.workcar.web.cmem.service.IcmemActService;
import com.gdj37.workcar.web.imem.service.IimemActService;

@Controller
public class cmemActController {

	@Autowired IcmemActService icmemActService;
	@Autowired IPagingService iPagingService;
	
	@RequestMapping(value = "/cmemStar")
	public ModelAndView cmemStar(ModelAndView mav)  {
		mav.setViewName("myPage/corMypage/cmemStar");
		return mav;
	}
	
	@RequestMapping(value = "/sendReq")
	public ModelAndView sendReq(ModelAndView mav)  {
		mav.setViewName("myPage/corMypage/sendReq");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getSendReqAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
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
			int cnt = icmemActService.getSendReqCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = icmemActService.getSendReq(params);
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
	@RequestMapping(value = "/sendReqCancAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String sendReqCancAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = icmemActService.sendReqCanc(params);
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
}
