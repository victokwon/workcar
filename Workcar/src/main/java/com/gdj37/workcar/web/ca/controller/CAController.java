package com.gdj37.workcar.web.ca.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
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
import com.gdj37.workcar.common.bean.PagingBean;
import com.gdj37.workcar.common.service.IPagingService;
import com.gdj37.workcar.util.Utils;
import com.gdj37.workcar.web.ca.service.ICAService;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//RESULT_SUCCESS/RESULT_ERROR
//VIEWCOUNT/PAGECOUNT
@Controller
public class CAController {

	@Autowired
	ICAService iCAService;
	@Autowired
	IPagingService iPagingService;

	@RequestMapping(value = "/login")
	public ModelAndView login(ModelAndView mav, HttpSession session) {
//		세션 로그인 정보 저장
		if (session.getAttribute("sMNo") == null) {
			mav.setViewName("ca/login");
		} else {
//		메인화면으로 주소 변경
			mav.setViewName("redirect:mainpage");
		}
		return mav;
	}

	@RequestMapping(value = "/logins")
	public ModelAndView logins(ModelAndView mav, @RequestParam HashMap<String, String> params, HttpSession session)
			throws Throwable {
		try {
			String pw = Utils.encryptAES128(params.get("PW"));
			params.put("PW", pw);

			HashMap<String, String> data = iCAService.login(params);
			int checkJoin = 0;
			
			if (data != null) {
				params.put("memNo", String.valueOf(data.get("MEM_NO")));
				mav.addObject("memNo", data.get("MEM_NO"));
				
				String memGbn = String.valueOf(data.get("MEM_GBN"));
				
				
				
				if( memGbn.equals("0")) {
					checkJoin = iCAService.checkImJoin(params);
					mav.setViewName("ca/imjoin");
				}else if( memGbn.equals("1") ||  memGbn.equals("2") ) {
					checkJoin = iCAService.checkCmJoin(params);
					mav.setViewName("ca/cmjoin");
				}else if(memGbn.equals("3")) {
					checkJoin = 1;
				}
				
				if(checkJoin != 0) {
					session.setAttribute("sMNo", data.get("MEM_NO"));
					session.setAttribute("sMNm", data.get("NAME"));
					session.setAttribute("sMTy", data.get("MEM_GBN"));
					mav.setViewName("redirect:mainpage");
				}
			} else {
//				mav.addObject("msg", "로그인실패");
				mav.setViewName("redirect:login");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
//		이전 주소 가지고 와서 view에 정보 입력 이전페이지로 이동
		mav.setViewName("redirect:mainpage");
		return mav;
	}

	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("ca/join");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/idCheckAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String idCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			String IDL = Integer.toString(params.get("ID").length());
			params.put("IDL", IDL);
			int idCnt = iCAService.SampleIdCheck(params);
			modelMap.put("idCnt", idCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}

	@ResponseBody
	@RequestMapping(value = "/joins", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String joins(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		HashMap<String, String> data = new HashMap<String, String>();
		int joinCnt = 0;
		String result = "success";

		try {
			switch (params.get("joinType")) {
			case "mem":
				params.put("PW", Utils.encryptAES128(params.get("PW")));
				joinCnt = iCAService.joinMem(params);
				data = iCAService.login(params);
				break;

			case "iMem":
				System.out.println(params);
				joinCnt = iCAService.joinIMem(params);
				break;

			case "cMem":
				if (iCAService.cInfoCheck(params) == 0) {
					System.out.println(params);
					joinCnt = iCAService.joinCInfo(params);
					if (joinCnt == 0) {
						result = "failed_c";
						break;
					}
				}
				System.out.println(params);
				joinCnt = iCAService.joinCMem(params);
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
	@RequestMapping(value = "/getApiDataAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String getApiDataAjax(@RequestParam HashMap<String, String> params, HttpServletResponse response)
			throws Throwable {
		String addr = "http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline?";
		String serviceKey = "r0G1+ZSkNEfXTCLmqfXjwKV1t3qGIp2NfBpG9FJuGEdgzz3BZCRt0aT86BoeL5JyNwEAlQmYQXLUupdB2u6vug==";
		String page = "1";
		String cName = "";

		StringBuilder sb = new StringBuilder();

		try {
			if (params.get("page") != "") {
				page = params.get("page");
			}
			cName = params.get("schCName");

			StringBuilder urlBuilder = new StringBuilder(addr);
//	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + serviceKey); 
			urlBuilder.append(URLEncoder.encode("ServiceKey", "UTF-8") + "="
					+ URLEncoder.encode(serviceKey, "UTF-8")); /* 공공데이터포털에서 받은 인증키 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("5", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("resultType", "UTF-8") + "="
					+ URLEncoder.encode("json", "UTF-8")); /* 결과형식(xml/json) */
			urlBuilder.append("&" + URLEncoder.encode("basDt", "UTF-8") + "="
					+ URLEncoder.encode("20201010", "UTF-8")); /* 작업 또는 거래의 기준이 되는 일자(년월일) */
			urlBuilder.append("&" + URLEncoder.encode("corpNm", "UTF-8") + "="
					+ URLEncoder.encode(cName, "UTF-8")); /* 계열 회사의 이름 */
			URL url = new URL(urlBuilder.toString());
			System.out.println(url);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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

	@RequestMapping(value = "/apiPagingAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String apiPagingAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int page = 1;

		try {
			page = Integer.parseInt(params.get("page"));
			int cnt = Integer.parseInt(params.get("itemCnt"));

			PagingBean pb = iPagingService.getPagingBean(page, cnt, CommonProperties.VIEWCOUNT,
					CommonProperties.PAGECOUNT);

			modelMap.put("page", page);
			modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/imJoin")
	public ModelAndView imJoin(ModelAndView mav, @RequestParam HashMap<String, String> params) {
		mav.setViewName("ca/imjoin");
		return mav;
	}

	@RequestMapping(value = "/cmJoin")
	public ModelAndView cmJoin(ModelAndView mav, @RequestParam HashMap<String, String> params) {
		mav.setViewName("ca/cmjoin");
		return mav;
	}

	@RequestMapping(value = "/pwf")
	public ModelAndView pwf(ModelAndView mav) {
		mav.setViewName("ca/pwf");
		return mav;
	}

	@RequestMapping(value = "/idf")
	public ModelAndView idf(ModelAndView mav) {
		mav.setViewName("ca/idf");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/mailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	public String mailAjax(@RequestParam HashMap<String, String> params, HttpServletResponse response,
			HttpServletRequest request, HttpSession s) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println(params);
//		메일 보내기 설정
		String host = "smtp.naver.com";
		final String username = "victokwon93";
		final String password = "vmfhwprxm!!";
//		메일 보낼 내용
		String recipient = params.get("EM");
		String title = "";
		String content = "";
//		상황 플래그
		boolean mailFlag = false;
		String result = CommonProperties.RESULT_SUCCESS;
//		임시문자
		String tempWord = "";

		Properties props = System.getProperties();

		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");

//        메일 보낼 준비 작업
		switch (params.get("mailGbn")) {
		case "certi":
			tempWord = Utils.tempWordCreate(5);
			recipient = params.get("EM");
			title = "일려거 인증 메일";
			content += "인증 번호: ";
			content += tempWord;

			s.setAttribute("tempWord", tempWord);

			mailFlag = true;
			break;

		case "pwf":
			tempWord = Utils.tempWordCreate(10);

			recipient = params.get("EM");
			title = "일려거 임시비밀번호 발급";
			content += "임시비밀번호: ";
			content += tempWord;

			params.put("PW", Utils.encryptAES128(tempWord));

			int cnt = iCAService.updatePass(params);

			if (cnt == 0) {
				result = CommonProperties.RESULT_FAILED;
			}

			mailFlag = true;
			break;

		case "idf":
			String ID = iCAService.findID(params);

			if (ID == null || ID == "") {
				result = CommonProperties.RESULT_FAILED;
			}
			title = "일려거 아이디 찾기";
			content += params.get("NM");
			content += "님 아이디: ";
			content += ID;

			mailFlag = true;
			break;
		}

		if (mailFlag) {
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un = username;
				String pw = password;

				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(un, pw);
				}
			});
			MimeMessage mail = new MimeMessage(session);
			try {
				mail.setSentDate(new Date());
				InternetAddress from = new InternetAddress();

				from = new InternetAddress("Manager<victokwon93@naver.com>");
				mail.setFrom(from);

				InternetAddress to = new InternetAddress(recipient);
				mail.setRecipient(Message.RecipientType.TO, to);

				mail.setSubject(title, "UTF-8");
				mail.setText(content, "UTF-8");
				mail.setHeader("content-Type", "text/html");

				javax.mail.Transport.send(mail);
			} catch (Exception e) {
				result = CommonProperties.RESULT_ERROR;
				e.printStackTrace();
			}
		} else {
			result = CommonProperties.RESULT_FAILED;
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/mailConfirmAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mailConfirmAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String result = CommonProperties.RESULT_SUCCESS;
		String userEmc = params.get("EMC");

		try {
			if (userEmc.equals(session.getAttribute("tempWord"))) {
				result = CommonProperties.RESULT_SUCCESS;
			} else {
				result = CommonProperties.RESULT_FAILED;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = CommonProperties.RESULT_ERROR;
		}

		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}

}
