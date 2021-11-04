package com.gdj37.workcar.web.db;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class GETAPI {
	
	
	
	public static ArrayList<DBDTO> dbdata;


	public static String getTagvalue(String tag, Element eElement) {
		
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	
	public static ArrayList<DBDTO> getApiData() {
		ArrayList<DBDTO> dbdata = new ArrayList<>();
		int page = 3;
		
		try {
		
		while(true) {	
			String ppage = Integer.toString(page); 
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=eOL4NOL32DV9JCLTdjEcP9bUmBk7Bea945HsGfJrfKLlvf0Xz5tpHHHMP9THVPtzOG7OgPjLfuK3YAj6HfzLdQ=="); /*Service Key*/	
	        urlBuilder.append("&" + URLEncoder.encode("basDt","UTF-8") + "=" + URLEncoder.encode("20211001", "UTF-8")); /*작업 또는 거래의 기준이 되는 일자(년월일)*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(ppage, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("8000", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*결과형식(xml/json)*/
	       
	        System.out.println(urlBuilder.toString());
	        URL url = new URL(urlBuilder.toString());
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
	        
	        for(int i = 0 ; i < arr.size() ; i++) {
	        	JSONObject data = (JSONObject) arr.get(i);
	        	
	        	DBDTO dbdt  = null;
	        	dbdt =  new DBDTO((String)data.get("crno"),(String)data.get("corpNm"),(String)data.get("enpEmpeCnt"),(String)data.get("enpOzpno"),
	        			(String)data.get("enpBsadr"),(String)data.get("enpDtadr"),(String)data.get("enpRprFnm"),(String)data.get("bzno")
        				,(String)data.get("enpTlno"),(String)data.get("enpEstbDt"),(String)data.get("enpPn1AvgSlryAmt"),(String)data.get("enpMainBizNm"),
        				(String)data.get("enpHmpgUrl")
        				,(String)data.get("corpNm"),(String)data.get("empeAvgCnwkTermCtt"),(String)data.get("smenpYn"));
        		
        		dbdata.add(dbdt);
	        }
	        /*
	        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	        Document doc = dBuilder.parse(url);
	        doc.getDocumentElement().normalize();
	        NodeList nList =doc.getElementsByTagName("item");
	        
	        for(int temp = 0; temp <nList.getLength(); temp++) {
	        	
	        	Node nNode = nList.item(temp);
	        	DBDTO dbdt  = null;
	        	
	        	if(nNode.getNodeType() == Node.ELEMENT_NODE) {
	        		
	        		Element eElement = (Element)nNode;
	        		
	        		dbdt =  new DBDTO(getTagvalue("crno",eElement),getTagvalue("corpNm",eElement),getTagvalue("enpEmpeCnt",eElement),getTagvalue("enpOzpno",eElement),
	        				getTagvalue("enpBsadr",eElement),getTagvalue("enpDtadr",eElement),getTagvalue("enpRprFnm",eElement),getTagvalue("bzno",eElement)
	        				,getTagvalue("enpTlno",eElement),getTagvalue("enpEstbDt",eElement),getTagvalue("enpPn1AvgSlryAmt",eElement),getTagvalue("enpMainBizNm",eElement),getTagvalue("enpHmpgUrl",eElement)
	        				,getTagvalue("corpNm",eElement),getTagvalue("empeAvgCnwkTermCtt",eElement),getTagvalue("smenpYn",eElement));
	        		
	        		dbdata.add(dbdt);
	        	}
	        	
	        }
	        */
	 
	        if(arr.size() == 8000) {
	        	page++;
	        	
	        }else 
	        	break;
	   
		}
	        
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	
	return dbdata;
	
	
	

}
	
}
