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
import com.gdj37.workcar.web.search.service.ICInfoSearchService;

@Controller
public class CInfoSearchController {
	@Autowired
	ICInfoSearchService iCInfoSearchService;
	@Autowired
	IPagingService iPagingService;

	@RequestMapping(value = "/CInfoSearchList")
	public ModelAndView CInfoSearchList(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		int page = 1;

		if (params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		mav.addObject("page", page);
		mav.setViewName("search/CInfoSearchList");
		return mav;
	}

	@RequestMapping(value = "/CInfoSearchListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String CInfoSearchListListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
//		System.out.println(params);
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
		try {

			// 페이지 취득
			int page = Integer.parseInt(params.get("page"));
			// 개수 취득
			int cnt = iCInfoSearchService.getCInfoSch1Cnt(params);
			// 페이징 정보 취득
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 3, 5);
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			// 리스트 조회
			List<HashMap<String, String>> list = iCInfoSearchService.getCInfoSch1List(params);

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

	@RequestMapping(value = "/CInfoSearch")
	public ModelAndView CInfoSearch(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		if (params.get("corpno") != null) {
			// 조회수 증가
			iCInfoSearchService.updateCInfoHit(params);
			// 데이터 조회
			HashMap<String, String> data = iCInfoSearchService.getCInfo(params);

			mav.addObject("data", data);

			mav.setViewName("detail/corDetail");

		} else {
			mav.setViewName("redirect:CInfoSearchList");
		}
		return mav;
	}
}
