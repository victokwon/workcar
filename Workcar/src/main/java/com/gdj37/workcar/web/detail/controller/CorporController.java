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
	public ModelAndView corDetail(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		mav.addObject("cRNo","1101111707178"); 
		mav.setViewName("redirect:corDetails");
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/corDetails")
	public ModelAndView corDetails(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		
		int page = 1; // 현재 P변수

		if (params.get("page") != null) { // 넘어오는 현재 P가 존재할 시
			page = Integer.parseInt(params.get("page"));
		}

		int cnt = iCorporService.list_paging(params); // 총 게시글 개수
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 3);
		//데이터 시작, 종료 번호 추가
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		
		
		int reviews = iCorporService.reviews(params); 
		HashMap<String, String> corpor_info = iCorporService.corporinfo(params);
		HashMap<String, String> rating = iCorporService.rating(params);
		int starEnroll = iCorporService.starEnroll(params);
		
		
		/*
		 * System.out.println(
		 * "-------------------------------------------------------------------------------------"
		 * ); params.put("Goprocess", params.get("Goprocess"));
		 * System.out.println(params.put("Goprocess", params.get("Goprocess")));
		 * params.put("GooneEval", params.get("GooneEval"));
		 * System.out.println(params.put("GooneEval", params.get("GooneEval")));
		 * params.put("management", params.get("management")); params.put("welfare",
		 * params.get("welfare")); params.put("culture", params.get("culture"));
		 * params.put("promotion", params.get("promotion")); params.put("work",
		 * params.get("work"));
		 */
		params.put("reviews", reviews+"");  // 조회수 업데이트
		
		mav.addObject("rating", rating);
		mav.addObject("starEnroll", starEnroll);
		mav.addObject("corpor_info", corpor_info);
		/* mav.addObject("coRPno", corpor_info.get("CORP_NO")); */
		mav.addObject("cnt", cnt);
		mav.addObject("reviews",reviews);
		mav.addObject("page", page);
		mav.addObject("pb", pb);

		mav.setViewName("detail/corDetail");

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

		int cnt = iCorporService.list_paging(params); // 총 게시글 개수
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 2, 5);

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iCorporService.getP2(params);
		HashMap<String, String> corpor_info = iCorporService.corporinfo(params);
		
		modelMap.put("corpor_info", corpor_info);
		/* modelMap.put("coRPno", corpor_info.get("CORP_NO")); */

		modelMap.put("pb", pb);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);

	}

}