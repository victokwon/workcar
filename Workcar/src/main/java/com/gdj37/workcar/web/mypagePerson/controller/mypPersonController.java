package com.gdj37.workcar.web.mypagePerson.controller;

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
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.util.Utils;
import com.gdj37.workcar.web.mypagePerson.service.ImypPersonAService;

@Controller
public class mypPersonController {
	@Autowired
	public ImypPersonAService imypPersonAService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping({ "/personRegi" })
	public ModelAndView personRegi(ModelAndView mav, HttpSession session) {
		if (String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			mav.setViewName("redirect:personRegis");
		} else {
			mav.setViewName("redirect:mainpage");
		}
		return mav;
	}

	@RequestMapping(value = "/personRegis")
	public ModelAndView personRegis(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		
		String memNo = String.valueOf(session.getAttribute("sMNo"));
		params.put("memNo", memNo);
		
		// 리스트 조회
		HashMap<String, String> data = imypPersonAService.myInfo(params);

		mav.addObject("data", data);
		mav.setViewName("myPage/personMypage/personRegi");
		// 데이터를 문자열화
		return mav;
	}

	
	@RequestMapping(value = "/myInfoAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring에게 돌려주는 내용이 View임을 제시
	public String myInfoAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); // jackson객체

		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map)
		System.out.println(params);
		String result = "success";

		try {
			
			int Mcnt = 0;
			int Icnt = 0;
			int cnt = 0;
			// CUD 처리
			switch (params.get("gbn")) {
			/*
			 * case "c" : //비밀번호 암호화 params.put("pw",
			 * Utils.encryptAES128(params.get("pw")));
			 * 
			 * cnt = imypPersonAService.addMyInfo(params); break;
			 */
			case "u":
				// 비밀번호 암호화
				if (params.get("pw") != "") {
					params.put("pw", Utils.encryptAES128(params.get("pw")));
				}
				Mcnt = imypPersonAService.updateMMyInfo(params);
				Icnt = imypPersonAService.updateIMyInfo(params);
				break;
			case "d":
				cnt = imypPersonAService.deleteMyInfo(params);
				break;
			}

			if (cnt==0 && Mcnt==0 && Icnt==0) {
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();

			result = "error";
		}

		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}

	
	  @RequestMapping(value = "/updatePassAjax", method = RequestMethod.POST, 
			  produces = "text/json;charset=UTF-8")
	  @ResponseBody // Spring에게 돌려주는 내용이 View임을 제시 public String
	  public String updatePassAjax(@RequestParam HashMap<String, String> params) throws
	  Throwable { ObjectMapper mapper = new ObjectMapper(); // jackson객체
	  
	  Map<String, Object> modelMap = new HashMap<String, Object>();
	  
	  int cnt = imypPersonAService.updatePass(params);
	  
	  modelMap.put("cnt", cnt);
	  
	  return mapper.writeValueAsString(modelMap); }
	 

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/sdsdAjax", method = RequestMethod.POST, produces =
	 * "text/json;charset=UTF-8") public String sdsdAjax(@RequestParam
	 * HashMap<String, String> params, HttpSession session) throws Throwable {
	 * ObjectMapper mapper = new ObjectMapper(); Map<String, Object> modelMap = new
	 * HashMap<String, Object>(); String result = CommonProperties.RESULT_FAILED;
	 * try { String memNo = String.valueOf(session.getAttribute("sMNo"));
	 * HashMap<String, String> data = imypPersonAService.myInfo(params);
	 * 
	 * if(list != null) { modelMap.put("LIST",list); result =
	 * CommonProperties.RESULT_SUCCESS; }
	 * 
	 * } catch (Exception e) { result = CommonProperties.RESULT_ERROR;
	 * e.printStackTrace(); } modelMap.put("result", result); return
	 * mapper.writeValueAsString(modelMap); }
	 */

	@RequestMapping({ "/personAct" })
	public ModelAndView personAct(ModelAndView mav) {
		mav.setViewName("myPage/personMypage/personAct");
		return mav;
	}

	@RequestMapping({ "/personInter" })
	public ModelAndView personInter(ModelAndView mav) {
		mav.setViewName("myPage/personMypage/personInter");
		return mav;
	}

}
