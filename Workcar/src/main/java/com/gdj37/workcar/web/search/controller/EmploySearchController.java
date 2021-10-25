package com.gdj37.workcar.web.search.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
import com.gdj37.workcar.web.search.service.IEmploySearchService;

@Controller
public class EmploySearchController {
	@Autowired
	IEmploySearchService iEmploySearchService;
	@Autowired
	IPagingService iPagingService;

	@RequestMapping(value = "/EmploySearchList")
	public ModelAndView EmploySearchList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
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
	public String EmploySearchListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
//		System.out.println(params);
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
		// 페이지 취득
		int page = Integer.parseInt(params.get("page"));
		// 개수 취득
		int cnt = iEmploySearchService.getEmpSch1Cnt(params);
		// 페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 3, 9);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		// 리스트 조회
		List<HashMap<String, String>> list = iEmploySearchService.getEmpSch1List(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);
		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}

	/*
	 * @RequestMapping(value = "/getQualApiAjax", method = RequestMethod.POST,
	 * produces = "text/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String getQualApiAjax(@RequestParam HashMap<String,
	 * String> params) throws Throwable { ObjectMapper mapper = new ObjectMapper();
	 * Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map
	 * 
	 * String addr =
	 * "http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?";
	 * String serviceKey =
	 * "NhC65sMUANhN4RJqC1C+m/2U99C960q5Yz4u0AivzvfB0Kuh1vcHukyrWx9qZjQygXDW4ydYfT5e4bJZIMqz8w==";
	 * 
	 * StringBuilder urlBuilder = new StringBuilder();
	 * urlBuilder.append(URLEncoder.encode("serviceKey=", "UTF-8") +
	 * URLEncoder.encode(serviceKey, "UTF-8")); Service Key
	 * 
	 * urlBuilder.append("&" + URLEncoder.encode("요청변수명", "UTF-8") + "=" +
	 * URLEncoder.encode(요청변수 값, "UTF-8"));
	 * 
	 * URL url = new URL(urlBuilder.toString());
	 * 
	 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	 * conn.setRequestMethod("GET"); conn.setRequestProperty("Content-type",
	 * "application/xml");
	 * 
	 * System.out.println("Response code: " + conn.getResponseCode()); // 접속 결과 확인
	 * // 200 = 정상 처리 완료 BufferedReader rd; //접속 결과에 의한 처리 if
	 * (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { rd = new
	 * BufferedReader(new InputStreamReader(conn.getInputStream())); } else { rd =
	 * new BufferedReader(new InputStreamReader(conn.getErrorStream())); }
	 * StringBuilder sb = new StringBuilder(); String line; while ((line =
	 * rd.readLine()) != null) { sb.append(line); } rd.close(); conn.disconnect();
	 * System.out.println(sb.toString());
	 * 
	 * // 데이터를 문자열화 return mapper.writeValueAsString(modelMap); }
	 */
}
