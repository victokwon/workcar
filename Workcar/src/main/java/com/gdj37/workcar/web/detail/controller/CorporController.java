package com.gdj37.workcar.web.detail.controller;

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
import com.gdj37.workcar.web.detail.service.ICorporService;

@Controller
public class CorporController {

	@Autowired
	ICorporService iCorporService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/corDetail")
	public ModelAndView corDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		int page = 1; // 현재 P변수

		if (params.get("page") != null) { // 넘어오는 현재 P가 존재할 시
			page = Integer.parseInt(params.get("page"));
		}

		int cnt = iCorporService.getP2Cnt(params); // 총 게시글 개수
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 3);

//데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		HashMap<String, String> data1 = iCorporService.getP1(params);

		mav.addObject("cnt", cnt);

		mav.addObject("page", page);
		mav.addObject("pb", pb);

		mav.setViewName("detail/corDetail");
		mav.addObject("data1", data1);

		return mav;
	}

	@RequestMapping(value = "/corListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String corListAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>(); /* 데이터를 담을 map */

		int page = 1; // 현재 P변수

		if (params.get("page") != null) { // 넘어오는 현재 P가 존재할 시
			page = Integer.parseInt(params.get("page"));
		}

		int cnt = iCorporService.getP2Cnt(params); // 총 게시글 개수
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 2, 5);

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCorporService.getP2(params);

		modelMap.put("pb", pb);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);

	}

}