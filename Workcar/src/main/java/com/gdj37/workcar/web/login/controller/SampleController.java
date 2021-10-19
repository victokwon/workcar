package com.gdj37.workcar.web.login.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.util.Utils;
import com.gdj37.workcar.web.login.service.ISampleService;
import com.google.gson.Gson;

import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@Controller
public class SampleController {

	@Autowired
	ISampleService iSampleService;
	@Autowired
	IPagingService iPagingService;

	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav, HttpSession session) {
//		세션 로그인 정보 저장
		if (session.getAttribute("sMNo") == null) {
			mav.setViewName("ca/login");
		} else {
//			메인화면으로 주소 변경
			mav.setViewName("redirect:join");
		}
		return mav;
	}

	@RequestMapping(value = "/logins")
	public ModelAndView logins(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session)
			throws Throwable {
		try {
			String pw = Utils.encryptAES128(params.get("PW"));
			params.put("PW", pw);

			HashMap<String, String> data = iSampleService.login(params);

			if (data != null) {
				session.setAttribute("sMNo", data.get("MEM_NO"));
				session.setAttribute("sMNm", data.get("NAME"));
				session.setAttribute("sMTy", data.get("MEM_GBN"));
				mav.setViewName("redirect:join");
			} else {
				mav.addObject("msg", "로그인실패");
				mav.setViewName("ca/join");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("ca/join");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/idCheckAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String idCheckAjax(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			String IDL = Integer.toString(params.get("ID").length());
			params.put("IDL", IDL);
			int idCnt = iSampleService.SampleIdCheck(params);
			modelMap.put("idCnt", idCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}

	@ResponseBody
	@RequestMapping(value = "/joins", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String joins(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		HashMap<String, String> data = new HashMap<String, String>();
		int joinCnt = 0;
		String result = "success";
		
		try {
			switch (params.get("joinType")) {
			case "mem":
				params.put("PW", Utils.encryptAES128(params.get("PW")));
				joinCnt = iSampleService.joinMem(params);
				data = iSampleService.login(params);
				break;
				
			case "iMem":
				System.out.println(params);
				joinCnt = iSampleService.joinIMem(params);
				break;
				
			case "cMem":
				if(iSampleService.cInfoCheck(params) == 0) {
					System.out.println(params);
					joinCnt = iSampleService.joinCInfo(params);
					if (joinCnt == 0) {
						result = "failed_c";
						break;
					}
				}
				System.out.println(params);
				joinCnt = iSampleService.joinCMem(params);
				break;
				
			}
			if (joinCnt == 0) {
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "error";
		}
		
		modelMap.put("data", data);
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getApiDataAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	public String cInfoListAjax(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpServletResponse response) throws Throwable {
		String addr = "http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline?";
		String serviceKey = "r0G1+ZSkNEfXTCLmqfXjwKV1t3qGIp2NfBpG9FJuGEdgzz3BZCRt0aT86BoeL5JyNwEAlQmYQXLUupdB2u6vug==";
		String page = "1";
		String cName ="";
		
		StringBuilder sb = new StringBuilder();
		
		 
		try {
			if(params.get("page") != "") {
				page = params.get("page");
			}
			cName = params.get("schCName");
			
	        StringBuilder urlBuilder = new StringBuilder(addr);
//	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + serviceKey); 
	        urlBuilder.append(URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*결과형식(xml/json)*/
	        urlBuilder.append("&" + URLEncoder.encode("basDt","UTF-8") + "=" + URLEncoder.encode("20201010", "UTF-8")); /*작업 또는 거래의 기준이 되는 일자(년월일)*/
	        urlBuilder.append("&" + URLEncoder.encode("corpNm","UTF-8") + "=" + URLEncoder.encode(cName, "UTF-8")); /*계열 회사의 이름*/
	        URL url = new URL(urlBuilder.toString());
	        System.out.println(url);
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        
	        rd.close();
	        conn.disconnect();
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return sb.toString();
	}
	
	@RequestMapping(value = "/apiPagingAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String cInfoList(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = 1;
		 
		try {
			page = Integer.parseInt(params.get("page"));
	        int cnt = Integer.parseInt(params.get("itemCnt"));
	        
	        PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);
	        
	        
	        modelMap.put("page", page);
	        modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@RequestMapping(value = "/imJoin")
	public ModelAndView imJoin(ModelAndView mav,@RequestParam HashMap<String, String> params) {
		mav.setViewName("ca/imjoin");
		return mav;
	}
	@RequestMapping(value = "/cmJoin")
	public ModelAndView cmJoin(ModelAndView mav,@RequestParam HashMap<String, String> params) {
		mav.setViewName("ca/cmjoin");
		return mav;
	}

	@RequestMapping(value = "/pwf")
	public ModelAndView pwf(ModelAndView mav) {

		mav.setViewName("ca/pwf");

		return mav;
	}

}
