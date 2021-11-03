package com.gdj37.workcar.web.resume.controller;

import java.util.ArrayList;
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
import com.gdj37.workcar.web.resume.service.IResumeService;
import com.gdj37.workcar.common.bean.PagingBean;

@Controller
public class ResumeController {
	@Autowired
	IResumeService iResumeService;
	@Autowired
	IPagingService iPagingService;
	
	
	@RequestMapping(value = "/resumeList")
	public ModelAndView resumeList(ModelAndView mav) {
		mav.setViewName("redirect:resumeLists");	
		return mav;
	}
	
	@RequestMapping(value = "/resumeLists")
	public ModelAndView resumeLists(ModelAndView mav, @RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
		System.out.println(params);
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
			try {
//               이력서 리스트
				params.put("memNo", String.valueOf(session.getAttribute("sMNo")));
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
				System.out.println(iedu.toString());
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
		return mav;
	}

	@RequestMapping(value = "/resumeDtlAdd")
	public ModelAndView resumeDtlAdd(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		params.put("memNo", String.valueOf(session.getAttribute("sMNo")));
		List<HashMap<String, String>> list = iResumeService.resumeList(params);
		HashMap<String, String> data = iResumeService.getUserDtl(params);
		mav.addObject("DATA", data);
		mav.addObject("LIST", list);
		mav.setViewName("/resume/resumeDtlAdd");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRegionAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getRegionAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
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
			@RequestParam(required = false) String[] carrStDate, @RequestParam(required = false) String[] carrEndDate,
			@RequestParam(required = false) String[] tureChk, @RequestParam(required = false) String[] carrCntt,
			@RequestParam(required = false) String[] schName, @RequestParam(required = false) String[] sol,
			@RequestParam(required = false) String[] major, @RequestParam(required = false) String[] eduStDate,
			@RequestParam(required = false) String[] eduEndDate, @RequestParam(required = false) String[] eduCntt,
			@RequestParam(required = false) String[] ieduName, @RequestParam(required = false) String[] coseName,
			@RequestParam(required = false) String[] ieduStDate, @RequestParam(required = false) String[] ieduEndDate,
			@RequestParam(required = false) String[] ieduCntt, @RequestParam(required = false) String[] sintroName,
			@RequestParam(required = false) String[] sintroCntt, @RequestParam(required = false) String[] fileNm,
			HttpSession session) throws Throwable {

		System.out.println(params);
			try {
				// 값 제거
				int cnt = 0;
				if(params.get("dtlGbn").equals("update")) {
					params.put("resumeNo", params.get("resumeUpdateNo"));
					cnt = iResumeService.dtlUpdate(params);
				}else if(params.get("dtlGbn").equals("add")) {
					cnt = iResumeService.dtlAdd(params);
					
					params.put("resumeNo", Integer.toString(cnt));
				}
				if(cnt > 0) {
					
				// 도시내용
				HashMap<String, Object> cityMap;
				for (int i = 1; i < city.length; i++) {
					cityMap = new HashMap<String, Object>();
					cityMap.put("resumeNo", params.get("resumeNo"));
					cityMap.put("city", city[i]);
					cityMap.put("region", region[i]);
					iResumeService.LocUpdate(cityMap);
					System.out.println(cityMap.toString());
				}

				// 근무형태
				HashMap<String, Object> workTypeMap;
				for (int i = 0; i < workType.length; i++) {
					workTypeMap = new HashMap<String, Object>();
					workTypeMap.put("resumeNo", params.get("resumeNo"));
					workTypeMap.put("index", i);
					workTypeMap.put("workType", workType[i]);
					iResumeService.WorkUpdate(workTypeMap);
				}

				// 자격증
				HashMap<String, Object> qualMap;
				if (qualNo != null) {
					for (int i = 0; i < qualNo.length; i++) {
						qualMap = new HashMap<String, Object>();
						qualMap.put("resumeNo", params.get("resumeNo"));
						qualMap.put("qualNo", qualNo[i]);
						qualMap.put("issuAgcy", issuAgcy[i]);
						qualMap.put("passDate", passDate[i]);
						iResumeService.QualUpdate(qualMap);
					}
				}

				// 외국어
				HashMap<String, Object> flangMap;
				if (flangNo != null) {
					for (int i = 0; i < flangNo.length; i++) {
						flangMap = new HashMap<String, Object>();
						flangMap.put("resumeNo", params.get("resumeNo"));
						flangMap.put("flangNo", flangNo[i]);
						flangMap.put("flangType", flangType[i]);
						flangMap.put("flangGrade", flangGrade[i]);
						iResumeService.FlangUpdate(flangMap);
					}
				}

				// 경력
				HashMap<String, Object> carrMap;
				if (cName != null) {
					for (int i = 0; i < cName.length; i++) {
						carrMap = new HashMap<String, Object>();
						carrMap.put("resumeNo", params.get("resumeNo"));
						carrMap.put("cName", cName[i]);
						carrMap.put("dpart", dpart[i]);
						carrMap.put("pos", pos[i]);
						carrMap.put("carrStDate", carrStDate[i]);
						carrMap.put("carrEndDate", carrEndDate[i]);
						carrMap.put("tureChk", tureChk[i]);
						carrMap.put("carrCntt", carrCntt[i]);
						iResumeService.CarrUpdate(carrMap);
					}
				}

				// 학력
				HashMap<String, Object> eduMap;
				if (schName != null) {
					for (int i = 0; i < schName.length; i++) {
						eduMap = new HashMap<String, Object>();
						eduMap.put("resumeNo", params.get("resumeNo"));
						eduMap.put("schName", schName[i]);
						eduMap.put("sol", sol[i]);
						eduMap.put("major", major[i]);
						eduMap.put("eduStDate", eduStDate[i]);
						eduMap.put("eduEndDate", eduEndDate[i]);
						eduMap.put("eduCntt", eduCntt[i]);
						iResumeService.EduUpdate(eduMap);
					}
				}

				// 직무교육
				HashMap<String, Object> ieduMap;
				if (ieduName != null) {
					for (int i = 0; i < ieduName.length; i++) {
						ieduMap = new HashMap<String, Object>();
						ieduMap.put("resumeNo", params.get("resumeNo"));
						ieduMap.put("ieduName", ieduName[i]);
						ieduMap.put("coseName", coseName[i]);
						ieduMap.put("ieduStDate", ieduStDate[i]);
						ieduMap.put("ieduEndDate", ieduEndDate[i]);
						ieduMap.put("ieduCntt", ieduCntt[i]);
						iResumeService.IeduUpdate(ieduMap);
					}
				}

				// 자기소개서
				HashMap<String, Object> sintroMap;
				if (sintroName != null) {
					for (int i = 0; i < sintroName.length; i++) {
						sintroMap = new HashMap<String, Object>();
						sintroMap.put("resumeNo", params.get("resumeNo"));
						sintroMap.put("sintroName", sintroName[i]);
						sintroMap.put("sintroCntt", sintroCntt[i]);
						iResumeService.SintroUpdate(sintroMap);
					}
				}

				// 첨부파일
				List<HashMap<String, Object>> fileNmList = new ArrayList<HashMap<String, Object>>();
				HashMap<String, Object> fileNmMap;
				if (fileNm != null) {
					for (int i = 0; i < fileNm.length; i++) {
						fileNmMap = new HashMap<String, Object>();
						fileNmMap.put("resumeNo", params.get("resumeNo"));
						fileNmMap.put("fileNm", fileNm[i]);
						iResumeService.AttchUpdate(fileNmMap);
					}
				}
				mav.setViewName("redirect:resumeDtl");
				}
			} catch (Exception e) {
				mav.setViewName("redirect:resumeList");
				e.printStackTrace();
			}
		mav.addObject("actGbn", "Dtl");
		mav.addObject("resumeNo", params.get("resumeNo"));
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/getResumeListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getResumeListAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		System.out.println(params);

		try {
			List<HashMap<String, String>> list = iResumeService.resumeList(params);
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
	@RequestMapping(value = "/PAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String PAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_FAILED;
		try {
			int cnt = iResumeService.PA(params);
			if(cnt > 0) {
				result = CommonProperties.RESULT_SUCCESS;
			}
		} catch (Exception e) {
			result = CommonProperties.RESULT_ERROR;
			e.printStackTrace();
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	
}