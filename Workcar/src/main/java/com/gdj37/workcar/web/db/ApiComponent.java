package com.gdj37.workcar.web.db;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApiComponent {
	@Autowired
	public SqlSession sqlSession;

	@RequestMapping(value = "/apiSave/{page}/{size}")
	public ModelAndView apiSave(ModelAndView mav, @PathVariable int page, @PathVariable int size) {

		ArrayList<DBDTO> dbdata = null;

		try {

			while (true) {
				dbdata = new ArrayList<>();

				String ppage = Integer.toString(page);

				StringBuilder urlBuilder = new StringBuilder(
						"http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline"); /* URL */
				urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
						+ "=eOL4NOL32DV9JCLTdjEcP9bUmBk7Bea945HsGfJrfKLlvf0Xz5tpHHHMP9THVPtzOG7OgPjLfuK3YAj6HfzLdQ=="); /*
																														 * Service
																														 * Key
																														 */
				urlBuilder.append("&" + URLEncoder.encode("basDt", "UTF-8") + "="
						+ URLEncoder.encode("20211001", "UTF-8")); /* 작업 또는 거래의 기준이 되는 일자(년월일) */
				urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
						+ URLEncoder.encode(ppage, "UTF-8")); /* 페이지번호 */
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
						+ URLEncoder.encode(Integer.toString(size), "UTF-8")); /* 한 페이지 결과 수 */
				urlBuilder.append("&" + URLEncoder.encode("resultType", "UTF-8") + "="
						+ URLEncoder.encode("json", "UTF-8")); /* 결과형식(xml/json) */

				System.out.println(urlBuilder.toString());
				URL url = new URL(urlBuilder.toString());
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
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				rd.close();
				conn.disconnect();

				String json = sb.toString();
				JSONParser parser = new JSONParser();

				JSONObject obj = (JSONObject) parser.parse(json);
				JSONObject response = (JSONObject) obj.get("response");
				JSONObject body = (JSONObject) response.get("body");
				JSONObject items = (JSONObject) body.get("items");

				JSONArray arr = (JSONArray) items.get("item");

				for (int i = 0; i < arr.size(); i++) {
					JSONObject data = (JSONObject) arr.get(i);

					DBDTO dbdt = null;
					dbdt = new DBDTO((String) data.get("crno"), (String) data.get("corpNm"),
							(String) data.get("enpEmpeCnt"), (String) data.get("enpOzpno"),
							(String) data.get("enpBsadr"), (String) data.get("enpDtadr"),
							(String) data.get("enpRprFnm"), (String) data.get("bzno"), (String) data.get("enpTlno"),
							(String) data.get("enpEstbDt"), (String) data.get("enpPn1AvgSlryAmt"),
							(String) data.get("enpMainBizNm"), (String) data.get("enpHmpgUrl"),
							(String) data.get("corpNm"), (String) data.get("empeAvgCnwkTermCtt"),
							(String) data.get("smenpYn"));

					dbdata.add(dbdt);
				}

				for (DBDTO data : dbdata) {
					String corpNo = data.getCrno();
					int cnt = sqlSession.selectOne("api.getCorpNo", corpNo);
					if (cnt == 0 && !data.getCorpNm().isEmpty()) {
						sqlSession.insert("api.insertCInfo", data);
					}
				}

				if (arr.size() == size) {
					page++;

				} else {
					break;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		mav.setViewName("exception/PAGE_NOT_FOUND");
		return mav;
	}
}
