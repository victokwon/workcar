package com.gdj37.workcar.web.space.controller;

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
import com.gdj37.workcar.web.space.service.ISpaceAService;


@Controller
public class SpaceAController {
	@Autowired
	public ISpaceAService iSpaceAService;
	
	
	@Autowired public IPagingService iPagingService;
	
	
	@RequestMapping(value = "/mainSpace")
	public ModelAndView mainSpace(ModelAndView mav) {
		mav.setViewName("space/mainSpace");
		return mav;
	}
	
	@RequestMapping(value = "/personalSpace")
	public ModelAndView personalSpace(ModelAndView mav) {
		mav.setViewName("space/personalSpace");
		return mav;
	}
	
	@RequestMapping(value = "/ntcSpaceABList")
	public ModelAndView ntcSpaceABList(@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		String page = "1";

		if(params.get("page") != null) {
			page = params.get("page");
		}

		mav.addObject("page", page);
		mav.setViewName("space/ntcSpaceABList");

		return mav;
	}
	
	@RequestMapping(value ="/ntcSpaceABLists", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody //Spring에게 돌려주는 내용이 View임을 제시
	public String ntcSpaceABLists(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); //jackson객체

		Map<String, Object> modelMap = new HashMap<String, Object>(); //데이터를 담을 map
		//페이지 취득
		int page = Integer.parseInt(params.get("page"));
		//개수 취득
		int cnt = iSpaceAService.getACnt(params);
		//페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 2);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		//리스트 조회
		List<HashMap<String, String>> list = iSpaceAService.getAList(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);
		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);

	
	}
	
	@RequestMapping(value = "/ntcAB")
	public ModelAndView ntcAB(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		if(params.get("no") != null) {
			
			//조회수 증가
			//iSpaceAService.updateAHit(params);
			
			//데이터 조회
			HashMap<String, String> data = iSpaceAService.getA(params);
			mav.addObject("data", data);
			mav.setViewName("space/ntcAB");
		} else {
			mav.setViewName("redirect:ntcSpaceABList");
		}
		
	
		return mav;
	}
	
	@RequestMapping(value = "/quesSpace")
	public ModelAndView quesSpace(ModelAndView mav) {
		mav.setViewName("space/quesSpace");
		return mav;
	}
		
	
}
