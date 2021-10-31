package com.gdj37.workcar.web.detail.controller;

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
import com.gdj37.workcar.web.detail.service.IApplyService;
import com.gdj37.workcar.web.search.service.IEmploySearchService;

@Controller
public class ApplyContoller {

	@Autowired
	public IPagingService iPagingService;
	@Autowired
	public IApplyService iApplyService;
	@Autowired
	IEmploySearchService iEmploySearchService;
	
	

	@RequestMapping(value="/applyDetail")
	public ModelAndView applyDetail (@RequestParam HashMap<String,String> params, 
									@RequestParam(required = false) String[] qualno,
									ModelAndView mav) throws Throwable
	{
		if (params.get("empno") == null) {
			mav.setViewName("redirect:EmploySearchList");
			return mav;
		}
		
		try {
			
			String qual ="";
			if(qualno != null) {
				for(int i=0; i<qualno.length;i++) {
					qual += qualno[i];
					if(i+1 != qualno.length) {
						qual += " , ";
					}
				}
			}
			
			
			HashMap<String,String> applyinfo = iApplyService.getinfo(params);
			int reviews = iApplyService.reviews(params); 
			HashMap<String, String> rating = iApplyService.rating(params);
			
			List<HashMap<String, String>> qualList = iApplyService.getQualList(params);
			System.out.println(qualList.toString());
			
			mav.addObject("qualno", qual);
			mav.addObject("qualList", qualList);
			mav.addObject("reviews",reviews); 
			mav.addObject("rating", rating);
			mav.addObject("applyinfo",applyinfo);
			mav.setViewName("detail/applyDetail");
		}catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:mainpage");
		}
		return mav;
	}
	
	@RequestMapping(value = "/applyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String applyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); /* 데이터를 담을 map */
		int page = 1; // 현재 P변수

		if (params.get("page") != "") { // 넘어오는 현재 P가 존재할 시
			page = Integer.parseInt(params.get("page"));
		}

		int cnt = iEmploySearchService.getEmpSch1Cnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iEmploySearchService.getEmpSch1List(params);
		
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);

	}
	
	@ResponseBody
	@RequestMapping(value = "/DclInsertAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String DclInsertAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {

			int cnt = iApplyService.insertDcl(params);
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
