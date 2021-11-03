package com.gdj37.workcar.web.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class SaveDB {
	public static void main(String[] args) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String url ="jdbc:oracle:thin:@gdportal.iptime.org:1521:XE";
		String id = "C##GDJ37_3";
		String pass = "1234";
		
		GETAPI.getApiData();
		
		ArrayList<DBDTO> dbdata = GETAPI.dbdata;
		
		try {
			
			conn = DriverManager.getConnection(url,id,pass);	
			pstmt = conn.prepareStatement("INSERT INTO C_INFO (CORP_NO, C_NAME, WRK_CNT, ZIP, ADDR, ADDR_DTL, C_BOSS, "
					+ " C_BIZNO, C_TEL, C_HPAGE) VALUES(?,?,?,?,?,?,?,?,?,?)");
			System.out.println("success");
			
			for (int i = 0; i<dbdata.size(); i++) {
				
				
				String CORP_NO = dbdata.get(i).crno;
				String C_NAME = dbdata.get(i).enpPbanCmpyNm;
				String WRK_CNT = dbdata.get(i).enpEmpeCnt;
				String ZIP = dbdata.get(i).enpOzpno;
				String ADDR = dbdata.get(i).enpBsadr;
				String ADDR_DTL = dbdata.get(i).enpDtadr;
				String C_BOSS = dbdata.get(i).enpRprFnm;
				String C_BIZNO = dbdata.get(i).bzno;
				String C_TEL = dbdata.get(i).enpTlno;
				/* String C_EST = dbdata.get(i).enpEstbDt; */
				/* String C_SAL = dbdata.get(i).enpPn1AvgSlryAmt; */
				String C_HPAGE = dbdata.get(i).enpHmpgUrl;
				/* String C_CRNAME = dbdata.get(i).corpNm; */
				/* String C_SBCHK = dbdata.get(i).smenpYn; */
				/* String C_CWY = dbdata.get(i).empeAvgCnwkTermCtt; */
				/* String C_CTYPE = dbdata.get(i).enpMainBizNm; */
				
				
				
				pstmt.setString(1, CORP_NO);
				pstmt.setString(2, C_NAME);
				pstmt.setString(3, WRK_CNT);
				pstmt.setString(4, ZIP);
				pstmt.setString(5, ADDR);
				pstmt.setString(6, ADDR_DTL);
				pstmt.setString(7, C_BOSS);
				pstmt.setString(8, C_BIZNO);
				pstmt.setString(9, C_TEL);
				/*
				 * pstmt.setString(10, C_EST); pstmt.setString(11, C_SAL);
				 */
				pstmt.setString(10, C_HPAGE);
				/*
				 * pstmt.setString(13, C_CRNAME); pstmt.setString(14, C_SBCHK);
				 */
				
				pstmt.executeUpdate();
				
			}
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		
		
		
	}

}
