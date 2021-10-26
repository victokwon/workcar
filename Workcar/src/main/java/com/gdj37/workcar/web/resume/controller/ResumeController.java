package com.gdj37.workcar.web.resume.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import com.gdj37.workcar.web.resume.service.IResumeService;
import com.gdj37.workcar.common.bean.PagingBean;

@Controller
public class ResumeController {
	@Autowired
	IResumeService iResumeService;
	@Autowired
	IPagingService iPagingService;

	@RequestMapping(value = "/resumeList")
	public ModelAndView mypageResume(ModelAndView mav, @RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
		System.out.println(params);
		if (String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			try {
				String memNo = String.valueOf(session.getAttribute("sMNo"));
				params.put("memNo", memNo);

				int cnt = iResumeService.getResumeCnt(params);
				List<HashMap<String, String>> list = iResumeService.resumeList(params);

				mav.addObject("cnt", cnt);
				mav.addObject("list", list);
				mav.setViewName("/resume/resumeList");
			} catch (Exception e) {
				mav.setViewName("redirect:login");
				e.printStackTrace();
			}
		} else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}

	@RequestMapping(value = "/applyResume")
	public ModelAndView applyResume(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session)
			throws Throwable {
		if (session.getAttribute("sMTy") != null) {
			try {
				int cnt = iResumeService.applyResume(params);
				if (cnt == 0) {
					mav.addObject("mag", "삭제실패");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.setViewName("redirect:resumeList");
		} else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}

	@RequestMapping(value = "/resumeDtl")
	public ModelAndView resumeDtl(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session)
			throws Throwable {
		System.out.println(params);
		if (String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			try {
//               이력서 리스트
				List<HashMap<String, String>> list = iResumeService.resumeList(params);
//               이력서 숫자 카운트
				int cnt = iResumeService.getResumeCnt(params);
				HashMap<String, String> data = iResumeService.getResumeDtl(params);
				List<HashMap<String, String>> work = iResumeService.resumeDtlWork(params);
				List<HashMap<String, String>> qual = iResumeService.resumeDtlQual(params);
				List<HashMap<String, String>> flang = iResumeService.resumeDtlFlang(params);
				List<HashMap<String, String>> carr = iResumeService.resumeDtlCarr(params);
				List<HashMap<String, String>> edu = iResumeService.resumeDtlEdu(params);
				List<HashMap<String, String>> iedu = iResumeService.resumeDtlIedu(params);
				List<HashMap<String, String>> sintro = iResumeService.resumeDtlSintro(params);
				List<HashMap<String, String>> attach = iResumeService.resumeDtlAttach(params);
				List<HashMap<String, String>> loc = iResumeService.resumeDtlLoc(params);

				mav.addObject("CNT", cnt);
				mav.addObject("LIST", list);
				mav.addObject("DATA", data);

				mav.addObject("WORK", work);
				mav.addObject("LOC", loc);

				mav.addObject("QUAL", qual);
				mav.addObject("FLANG", flang);
				mav.addObject("CARR", carr);
				mav.addObject("EDU", edu);
				mav.addObject("IEDU", iedu);
				mav.addObject("SINTRO", sintro);
				mav.addObject("ATTACH", attach);

				if (params.get("actGbn").equals("Up")) {
					HashMap<String, String> conCnt = iResumeService.getAddContCnt(params);
					mav.addObject("conCnt", conCnt);
					mav.setViewName("/resume/resumeDtlUpdate");
				} else if (params.get("actGbn").equals("Dtl")) {
					mav.setViewName("/resume/resumeDtl");
				}
			} catch (Exception e) {
				mav.setViewName("redirect:mainpage");
				e.printStackTrace();
			}
		} else {
			System.out.println(params);
			mav.setViewName("redirect:mainpage");
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/getRegionAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getRegionAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);
		try {
			System.out.println(params);
			List<HashMap<String, String>> list = iResumeService.getRegion(params);
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

	@ResponseBody
	@RequestMapping(value = "/getSectorAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getSectorAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iResumeService.getSectorCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			System.out.println(cnt);
			System.out.println(pb);
			List<HashMap<String, String>> list = iResumeService.getSector(params);
			if (list == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			modelMap.put("page", page);
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
	@RequestMapping(value = "/getQualAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getQualAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		int page = 1;

		try {
			if (params.get("page") != "") {
				page = Integer.parseInt(params.get("page"));
			}
			int cnt = iResumeService.getQualCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			System.out.println(cnt);
			System.out.println(pb);
			List<HashMap<String, String>> list = iResumeService.getQual(params);
			if (list == null) {
				result = CommonProperties.RESULT_FAILED;
			}
			modelMap.put("page", page);
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

	@RequestMapping(value = "/resumeUpdate")
	public ModelAndView resumeUpdate(ModelAndView mav, @RequestParam HashMap<String, String> params,
			@RequestParam(required = false) String[] city, @RequestParam(required = false) String[] region,
			@RequestParam(required = false) String[] workType, @RequestParam(required = false) String[] qualNo,
			@RequestParam(required = false) String[] issuAgcy, @RequestParam(required = false) String[] passDate,
			@RequestParam(required = false) String[] flangNo, @RequestParam(required = false) String[] flangType,
			@RequestParam(required = false) String[] flangGrade, @RequestParam(required = false) String[] cName,
			@RequestParam(required = false) String[] dpart, @RequestParam(required = false) String[] pos,
			@RequestParam(required = false) String[] carrStDate, @RequestParam(required = false) String[] carrEndData,
			@RequestParam(required = false) String[] tureChk, @RequestParam(required = false) String[] carrCntt,
			@RequestParam(required = false) String[] schName, @RequestParam(required = false) String[] sol,
			@RequestParam(required = false) String[] major, @RequestParam(required = false) String[] eduStDate,
			@RequestParam(required = false) String[] eduEndData, @RequestParam(required = false) String[] eduCntt,
			@RequestParam(required = false) String[] ieduName, @RequestParam(required = false) String[] coseName,
			@RequestParam(required = false) String[] ieduStDate, @RequestParam(required = false) String[] ieduEndDate,
			@RequestParam(required = false) String[] ieduCntt, @RequestParam(required = false) String[] sintroName,
			@RequestParam(required = false) String[] sintroCntt, @RequestParam(required = false) String[] fileNm,
			HttpSession session) throws Throwable {
		
		System.out.println(params);
		
		Map<String, Object> cityMap = new HashMap<String, Object>();
		Map<String, Object> workTypeMap = new HashMap<String, Object>();
		Map<String, Object> qualMap = new HashMap<String, Object>();
		Map<String, Object> flangMap = new HashMap<String, Object>();
		Map<String, Object> carrMap = new HashMap<String, Object>();
		Map<String, Object> eduMap = new HashMap<String, Object>();
		Map<String, Object> ieduMap = new HashMap<String, Object>();
		Map<String, Object> sintroMap = new HashMap<String, Object>();
		Map<String, Object> fileNmMap = new HashMap<String, Object>();

		// 도시내용
		for (int i = 0; i < city.length; i++) {
			cityMap.put("city" + i, city[i]);
			cityMap.put("region" + i, region[i]);
		}
		for (String key : cityMap.keySet()) {
			System.out.println(key);
			System.out.println(cityMap.get(key));
		}
		// 근무형태
		for (int i = 0; i < workType.length; i++) {
			workTypeMap.put("workType" + i, workType[i]);
		}
		for (String key : workTypeMap.keySet()) {
			System.out.println(key);
			System.out.println(workTypeMap.get(key));
		}
		
		if (qualNo != null) {
			// 자격증
			for (int i = 0; i < qualNo.length; i++) {
				qualMap.put("qualNo" + i, qualNo[i]);
				qualMap.put("issuAgcy" + i, issuAgcy[i]);
				qualMap.put("passDate" + i, passDate[i]);
			}
			for (String key : qualMap.keySet()) {
				System.out.println(key);
				System.out.println(qualMap.get(key));
			}
		}
		if (flangNo != null) {
			// 외국어
			for (int i = 0; i < flangNo.length; i++) {
				flangMap.put("flangNo" + i, flangNo[i]);
				flangMap.put("flangType" + i, flangType[i]);
				flangMap.put("flangGrade" + i, flangGrade[i]);
			}
			for (String key : flangMap.keySet()) {
				System.out.println(key);
				System.out.println(flangMap.get(key));
			}
		}
		if (cName != null) {
			// 경력
			for (int i = 0; i < cName.length; i++) {
				carrMap.put("cName" + i, cName[i]);
				carrMap.put("dpart" + i, dpart[i]);
				carrMap.put("pos" + i, pos[i]);
				carrMap.put("carrStDate" + i, carrStDate[i]);
				carrMap.put("carrEndData" + i, carrEndData[i]);
				carrMap.put("tureChk" + i, tureChk[i]);
				carrMap.put("carrCntt" + i, carrCntt[i]);
			}
			for (String key : carrMap.keySet()) {
				System.out.println(key);
				System.out.println(carrMap.get(key));
			}
		}
		if (schName != null) {
			// 학력
			for (int i = 0; i < schName.length; i++) {
				eduMap.put("schName" + i, schName[i]);
				eduMap.put("sol" + i, sol[i]);
				eduMap.put("major" + i, major[i]);
				eduMap.put("eduStDate" + i, eduStDate[i]);
				eduMap.put("eduEndData" + i, eduEndData[i]);
				eduMap.put("schName" + i, schName[i]);
			}
			for (String key : eduMap.keySet()) {
				System.out.println(key);
				System.out.println(eduMap.get(key));
			}
		}
		if (ieduName != null) {
			// 직무교육
			for (int i = 0; i < ieduName.length; i++) {
				ieduMap.put("ieduName" + i, ieduName[i]);
				ieduMap.put("coseName" + i, coseName[i]);
				ieduMap.put("ieduStDate" + i, ieduStDate[i]);
				ieduMap.put("ieduEndDate" + i, ieduEndDate[i]);
				ieduMap.put("ieduCntt" + i, ieduCntt[i]);
			}
			for (String key : ieduMap.keySet()) {
				System.out.println(key);
				System.out.println(ieduMap.get(key));
			}
		}
		if (sintroName != null) {
			// 자지소개서
			for (int i = 0; i < sintroName.length; i++) {
				sintroMap.put("sintroName" + i, sintroName[i]);
				sintroMap.put("sintroCntt" + i, sintroCntt[i]);
			}
			for (String key : sintroMap.keySet()) {
				System.out.println(key);
				System.out.println(sintroMap.get(key));
			}
		}
		if (fileNm != null) {
			// 첨부파일
			for (int i = 0; i < fileNm.length; i++) {
				fileNmMap.put("fileNm" + i, fileNm[i]);
			}
			for (String key : fileNmMap.keySet()) {
				System.out.println(key);
				System.out.println(fileNmMap.get(key));
			}
		}

		if (String.valueOf(session.getAttribute("sMTy")).equals("0")) {
			try {
				mav.setViewName("redirect:mainpage");

			} catch (Exception e) {
				mav.setViewName("redirect:mainpage");
				e.printStackTrace();
			}
		} else {
			System.out.println(params);
			mav.setViewName("redirect:mainpage");
		}
		return mav;
	}
}