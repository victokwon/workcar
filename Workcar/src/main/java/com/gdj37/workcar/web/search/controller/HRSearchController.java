package com.gdj37.workcar.web.search.controller;

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
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.web.search.service.IHRSearchService;


@Controller
public class HRSearchController {
	@Autowired
	IHRSearchService iHRSearchService;
	@Autowired
	IPagingService iPagingService;
	
	
	@RequestMapping(value = "/HRSearchList")
	public ModelAndView HRSearchList(@RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		mav.setViewName("search/HRSearchList");

		return mav;
	}
	@RequestMapping(value = "/HRSearchListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HRSearchListAjax(@RequestParam HashMap<String, String> params, @RequestParam (required=false) String[] qualno) throws Throwable {
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
		int cnt = iHRSearchService.getHRSch1Cnt(params);
		// 페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 9, 3);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		// 리스트 조회
		List<HashMap<String, String>> list = iHRSearchService.getHRSch1List(params);
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
}
