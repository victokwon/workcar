package com.gdj37.workcar.web.db;


import java.net.URLEncoder;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class GETAPI {
	
	
	static ArrayList<DBDTO> dbdata = new ArrayList<>();
	
	public static String getTagvalue(String tag, Element eElement) {
		
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	
	public static void getApiData() {
		
		int page = 1;
		
		try {
		
		while(true) {	
			String ppage = Integer.toString(page); 
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=eOL4NOL32DV9JCLTdjEcP9bUmBk7Bea945HsGfJrfKLlvf0Xz5tpHHHMP9THVPtzOG7OgPjLfuK3YAj6HfzLdQ=="); /*Service Key*/	
	        urlBuilder.append("&" + URLEncoder.encode("basDt","UTF-8") + "=" + URLEncoder.encode("20211001", "UTF-8")); /*작업 또는 거래의 기준이 되는 일자(년월일)*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(ppage, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml/json)*/
	        urlBuilder.append("&" + URLEncoder.encode("crno","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*법인등록번호*/
	        urlBuilder.append("&" + URLEncoder.encode("enpPbanCmpyNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*회사이름*/
	        urlBuilder.append("&" + URLEncoder.encode("enpEmpeCnt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*직원수*/
	        urlBuilder.append("&" + URLEncoder.encode("enpOzpno","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*우편번호*/
	        urlBuilder.append("&" + URLEncoder.encode("enpBsadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주소*/
	        urlBuilder.append("&" + URLEncoder.encode("enpDtadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*상세주소*/
	        urlBuilder.append("&" + URLEncoder.encode("enpRprFnm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대표자이름*/
	        urlBuilder.append("&" + URLEncoder.encode("bzno","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*사업자등록번호*/
	        urlBuilder.append("&" + URLEncoder.encode("enpTlno","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전화번호*/
	        urlBuilder.append("&" + URLEncoder.encode("enpEstbDt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*설립일자*/
	        urlBuilder.append("&" + URLEncoder.encode("enpPn1AvgSlryAmt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*평균급여약*/
	        urlBuilder.append("&" + URLEncoder.encode("enpMainBizNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*영위사업*/
	        urlBuilder.append("&" + URLEncoder.encode("enpHmpgUrl","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*폼페이지 주소*/
	        urlBuilder.append("&" + URLEncoder.encode("corpNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 법인 이름*/
	        urlBuilder.append("&" + URLEncoder.encode("empeAvgCnwkTermCtt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*평균 근속 연수*/
	        urlBuilder.append("&" + URLEncoder.encode("smenpYn","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중소기업 여부*/
	       
	        String url = urlBuilder.toString();
	        System.out.println(url);
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
	        		
	        		dbdt =  new DBDTO(getTagvalue("crno",eElement),getTagvalue("enpPbanCmpyNm",eElement),getTagvalue("enpEmpeCnt",eElement),getTagvalue("enpOzpno",eElement),
	        				getTagvalue("enpBsadr",eElement),getTagvalue("enpDtadr",eElement),getTagvalue("enpRprFnm",eElement),getTagvalue("bzno",eElement)
	        				,getTagvalue("enpTlno",eElement),getTagvalue("enpEstbDt",eElement),getTagvalue("enpPn1AvgSlryAmt",eElement),getTagvalue("enpMainBizNm",eElement),getTagvalue("enpHmpgUrl",eElement)
	        				,getTagvalue("corpNm",eElement),getTagvalue("empeAvgCnwkTermCtt",eElement),getTagvalue("smenpYn",eElement));
	        		
	        		dbdata.add(dbdt);
	        		
	        	}
	        	
	        }
	        
	 
	        if(page<100) {
	        	page += 1;
	        	
	        }else 
	        	break;
	   
		}
	        
	}catch(Exception e) {
		e.printStackTrace();
		
	}
	
	
	
	
	

}
	
}
