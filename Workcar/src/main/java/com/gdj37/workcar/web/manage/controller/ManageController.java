package com.gdj37.workcar.web.manage.controller;

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
import com.gdj37.workcar.web.manage.service.IManageService;

@Controller
public class ManageController {
	@Autowired IManageService iManageService;
	@Autowired IPagingService iPagingService;
	
	@RequestMapping(value = "/manageMemberList")
	public ModelAndView manageMemberList(ModelAndView mav) {
		mav.setViewName("myPage/manage/MemberList");
		return mav;
	}
	
	@RequestMapping(value = "/manageRegist")
	public ModelAndView manageRegist(ModelAndView mav) {
		mav.setViewName("myPage/manage/Regist");
		return mav;
	}
	
	@RequestMapping(value = "/manageReport")
	public ModelAndView manageReport(ModelAndView mav) {
		mav.setViewName("myPage/manage/Report");
		return mav;
	}
	
	@RequestMapping(value = "/manageStar")
	public ModelAndView manageStar(ModelAndView mav) {
		mav.setViewName("myPage/manage/Star");
		return mav;
	}
	
//	신고관리
	@ResponseBody
	@RequestMapping(value = "/getDclAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getDclAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;
		System.out.println(params);

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iManageService.getDclCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iManageService.getDcl(params);
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
	@RequestMapping(value = "/getDclDtlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getDclDtlAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			HashMap<String, String> data = iManageService.getDclDtl(params);
			
			if (data == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			
			modelMap.put("data", data);
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/updateDclAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String updateDclAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = iManageService.updateDcl(params);
			if (cnt <= 0) {
				result = CommonProperties.RESULT_FAILED;
			}
			if(params.get("prcssGbn").equals("1")) {
				cnt = iManageService.ReportedEmpDel(params);
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
	
	
	
//	평점
	@ResponseBody
	@RequestMapping(value = "/getGrdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getGrdAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;
		System.out.println(params);

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iManageService.getGrdCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iManageService.getGrd(params);
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
	@RequestMapping(value = "/getGrdDtlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getGrdDtlAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			HashMap<String, String> data = iManageService.getGrdDtl(params);
			
			if (data == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			
			modelMap.put("data", data);
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/updateGrdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String updateGrdAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = iManageService.updateGrd(params);
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
