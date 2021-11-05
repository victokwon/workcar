<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo('EmploySearchList')">채용정보</div>
				<li onclick="linkGo('EmploySearchList')">통합검색</li>
			</ul> 
			<ul>
				<div onclick="linkGo('HRSearchList')">인재정보</div>
				<li onclick="linkGo('HRSearchList')">통합검색</li>
			</ul>
			<ul>
				<div onclick="linkGo('CInfoSearchList')">기업정보</div>
				<li onclick="linkGo('CInfoSearchList')">통합검색</li>
			</ul>
			<ul>
				<div onclick="linkGo('mainSpace')">참여공간</div>
				<li onclick="linkGo('ntcSpaceABList')">공지사항</li>
				<li onclick="linkGo('quesSpace')">자주하는 질문</li>
			</ul>
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<ul>
						<div onclick="linkGo('resumeLists')">마이페이지</div>
						<li onclick="linkGo('')">계정관리</li>
						<li onclick="linkGo('resumeLists')">이력서관리</li>
						<li onclick="linkGo('recepReq')">활동내역</li>
						<li onclick="linkGo('empsugget')">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<ul>
						<div onclick="linkGo('cmyinfopage')">마이페이지</div>
						<li onclick="linkGo('cmyinfopage')">계정관리</li>
						<li onclick="linkGo('mngancpage')">채용공고</li>
						<li onclick="linkGo('sendReq')">활동내역</li>
						<li onclick="linkGo('cmemAttnd')">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<ul>
						<div onclick="linkGo('manageRegist')">마이페이지</div>
						<li onclick="linkGo('manageRegist')">계정관리</li>
						<li onclick="linkGo('manageMemberList)">회원관리</li>
						<li onclick="linkGo('manageReport')">신고관리</li>
						<li onclick="linkGo('manageStar)">평점관리</li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="side_bcc" id="side_bcc" onclick="closeNav()"></div>

	<header>
		<!-- 네비게이션바 -->
		<div class="topnav">

			<!-- 로고 -->
			<div class="topnav-centered" onclick="linkGo('mainpage')">
				<div class="logo_img"></div>
			</div>

			<!-- 왼쪽 -->
			<div class="hambuger" onclick="openNav()" id="hambuger_left">
				<div></div>
				<div></div>
				<div></div>
			</div>

			<!-- 오른쪽 -->
			<!-- 링크작업 -->
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<div class="topnav-right">
						<!-- <div class="alarm"></div> -->
						<a href="resumeList"><strong >마이페이지</strong></a>
						<div class="im_profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<div class="topnav-right">
						<!-- <div class="alarm"></div> -->
						<a href="cmyinfopage"><strong>마이페이지</strong></a>
						<div class="cm_profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<div class="topnav-right">
						<!-- <div class="alarm"></div> -->
						<a href="manageMemberList"><strong>마이페이지</strong></a>
						<div class="mng_profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="topnav-right">
						<a href="login"><strong>로그인</strong></a> <a href="join"><strong>회원가입</strong></a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
</body>
</html>