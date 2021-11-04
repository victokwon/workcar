package com.gdj37.workcar.web.search.controller;

import java.util.ArrayList;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.CommonProperties;
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.search.service.IEmploySearchService;

@Controller
public class EmploySearchController {
	@Autowired
	public IEmploySearchService iEmploySearchService;
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/EmploySearchList")
	public ModelAndView EmploySearchList(@RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("search/EmploySearchList");

		return mav;
	}

	@RequestMapping(value = "/EmploySearchListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String EmploySearchListAjax(@RequestParam HashMap<String, String> params, @RequestParam (required=false) String[] qualno ) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
//		System.out.println(params);
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
		try {
			String qual ="";
			if(qualno != null) {
			for(int i=0; i<qualno.length;i++) {
				qual += qualno[i];
				if(i+1 != qualno.length) {
					qual += " , ";
				}
			}
			params.put("qualno", qual);
			}
			System.out.println(params.get("qualno"));
		
		// 페이지 취득
		int page = Integer.parseInt(params.get("page"));
		// 개수 취득
		int cnt = iEmploySearchService.getEmpSch1Cnt(params);
		// 페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		// 리스트 조회
		List<HashMap<String, String>> list = iEmploySearchService.getEmpSch1List(params);
		
		modelMap.put("cnt", cnt);
		modelMap.put("page", page);
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}

	@ResponseBody
	@RequestMapping(value = "/getQualList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getQualList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int pop_page = 1;
		try {
			if(params.get("pop_page")!="") {
			pop_page =Integer.parseInt(params.get("pop_page"));
			}
		int cnt = iEmploySearchService.getQualCnt(params);
		PagingBean pb = iPagingService.getPagingBean(pop_page, cnt, 5, 5);
         
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		System.out.println(cnt);
		System.out.println(pb);
		List<HashMap<String, String>> list = iEmploySearchService.getQual(params);
        if(list == null) {
           result = CommonProperties.RESULT_FAILED;
        }
        modelMap.put("pop_page", pop_page);
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
	@RequestMapping(value = "/getSectorList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getSectorList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int pop_page = 1;
      
		try {
			System.out.println(params);
			if(params.get("pop_page")!="") {
				pop_page =Integer.parseInt(params.get("pop_page"));
			}
			System.out.println(pop_page);
			int cnt = iEmploySearchService.getSectorCnt(params);
			PagingBean pb = iPagingService.getPagingBean(pop_page, cnt, 5, 5);
	         
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
	
			System.out.println(cnt);
			System.out.println(pb);
			List<HashMap<String, String>> list = iEmploySearchService.getSector(params);
	        if(list == null) {
	           result = CommonProperties.RESULT_FAILED;
	        }
	        modelMap.put("pop_page", pop_page);
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
	@RequestMapping(value = "/getRegionList", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getRegionList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {
			System.out.println(params);
			List<HashMap<String, String>> list = iEmploySearchService.getRegion(params);
			if (list == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			modelMap.put("list", list);
		} catch (Exception e) {
			System.out.println(params);
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/EmployViewsTopList")
	public ModelAndView EmployViewsTopList(@RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable {
		
		  int page = 1;
		  
		  if (params.get("page") != null) { page =
		  Integer.parseInt(params.get("page")); }
		  
		  mav.addObject("page", page);
		 
		mav.setViewName("TOPRANK/EmployViewsTopList");

		return mav;
	}
	@RequestMapping(value = "/EmployViewsTopListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String EmployViewsTopListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
//		System.out.println(params);
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
		try {

			// 페이지 취득
			int page = Integer.parseInt(params.get("page"));
			// 개수 취득
			int cnt = iEmploySearchService.getEmployViewsTop1Cnt(params);
			// 페이징 정보 취득
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 3, 5);
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			// 리스트 조회
			List<HashMap<String, String>> list = iEmploySearchService.getEmployViewsTop1List(params);

			modelMap.put("cnt", cnt);
			modelMap.put("page", page);
			modelMap.put("pb", pb);
			modelMap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}
}
