<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일력거</title>
<link rel="stylesheet" type="text/css"
	href="resources\css\common\default.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\footer.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\header.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\sidebar.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\mainpage\mainpage.css">

<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>

<script type="text/javascript">
 	$(function () {
 	 	if("${msg}"!=""){
 	 		alert("${msg}")
 	 	}

	 }) 
	 function linkGo(url){
 		location.href = url
 	}
</script>
</head>
<body>
	<!-- 헤더 -->
	
	<!-- 	<button id="iMBtn">개인</button>
	<button id="cMBtn">기업</button>
	<button id="mMBtn">관리자</button> -->

<%@include file="/resources/jsp/header.jsp"%>
<input type="hidden" id="userNo" no=${sMNo }>
	<!-- 메인 -->
	<main>
		<div class="main_wrap">

			<div class="main">

				<div class="contents">
					<div class="wrap">
						<!-- 링크작업 -->
						<div class="main_contents_job" onclick="linkGo('EmploySearchList')">
							<span>채용검색</span>
							<!-- display:none; div 상세메뉴선택 -->
						</div>

						<div class="main_contents_people" onclick="linkGo('HRSearchList')">
							<span>인재검색</span>
							<!-- display:none; div 상세메뉴선택 -->
						</div>

						<div class="main_contents_company" onclick="linkGo('CInfoSearchList')"> 
							<span>기업검색</span>
							<!-- display:none; div 상세메뉴선택 -->
						</div>
					</div>
				</div>
				<!-- 개인 -->
				<c:choose>
					<c:when test="${sMTy eq 0 || empty sMTy}">
						<div class="menu_cards iM">
							<div class="menu_card">
								<div class="wrap" onclick="linkGo('')">
									<div class="img_settings"></div>
								</div>
								<div class="card_text">
									<span>계정관리</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('resumeList')">
								<div class="wrap">
									<div class="img_resume"></div>
								</div>
								<div class="card_text">
									<span>이력서관리</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('recepReq')">
								<div class="wrap">
									<div class="img_activity"></div>
								</div>
								<div class="card_text">
									<span>활동내역</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('empsugget')">
								<div class="wrap">
									<div class="img_attention"></div>
								</div>
								<div class="card_text">
									<span>관심정보</span>
								</div>
							</div>
						</div>
					</c:when>

					<c:when test="${sMTy eq 1 || sMTy eq 2}">
						<div class="menu_cards cM" >
							<div class="menu_card" onclick="linkGo('cmyinfopage')">
								<div class="wrap">
									<div class="img_settings"></div>
								</div>
								<div class="card_text">
									<span>계정관리</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('mngancpage')">
								<div class="wrap">
									<div class="img_job_post"></div>
								</div>
								<div class="card_text">
									<span>채용공고</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('sendReq')">
								<div class="wrap">
									<div class="img_activity"></div>
								</div>
								<div class="card_text">
									<span>활동내역</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('cmemAttnd')">
								<div class="wrap">
									<div class="img_attention"></div>
								</div>
								<div class="card_text">
									<span>관심정보</span>
								</div>
							</div>
						</div>
					</c:when>
					
					<c:when test="${sMTy eq 3}">
						<div class="menu_cards mM">
							<div class="menu_card"onclick="linkGo('manageRegist')">
								<div class="wrap">
									<div class="img_settings"></div>
								</div>
								<div class="card_text">
									<span>계정관리</span>
								</div>
							</div>
							<div class="menu_card"onclick="linkGo('manageMemberList')">
								<div class="wrap">
									<div class="img_member"></div>
								</div>
								<div class="card_text">
									<span>회원관리</span>
								</div>
							</div>
							<div class="menu_card"onclick="linkGo('manageReport')">
								<div class="wrap">
									<div class="img_report"></div>
								</div>
								<div class="card_text">
									<span>신고관리</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('manageStar')">
								<div class="wrap">
									<div class="img_grade"></div>
								</div>
								<div class="card_text">
									<span>평점관리</span>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</main>

	<!-- 푸터 -->
	
</body>
<%@include file="/resources/jsp/footer.jsp"%>
</html>