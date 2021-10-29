<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources\css\common\default.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\footer.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\header.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\sidebar.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\mainpage\searchbar.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\mainpage\mainpage.css">

<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>

<script type="text/javascript">
 	$(function () {
/* 서치바 js등으로 다시 처리하기 */
 /* onclick="linkGo(url)" url 변경하기 */ 
 /* 또는  */
/* 링크 처리 일괄적으로 한번에 동작 할 수 있는 매커니즘 찾기 */

	 }) 
	 function linkGo(url){
 		location.href = url
 	}
</script>
</head>
<body>
	<!-- 헤더 -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo('EmploySearchList')">채용정보</div>
				<li onclick="linkGo(#)">통합검색</li>
				<li onclick="linkGo(#)">조회수 100</li>
				<li onclick="linkGo(#)">평점 100</li>
			</ul> 
			<ul>
				<div onclick="linkGo(#)">기업정보</div>
				<li onclick="linkGo(#)">통합검색</li>
			</ul>
			<ul>
				<div onclick="linkGo(#)">인재정보</div>
				<li onclick="linkGo(#)">통합검색</li>
			</ul>
			<ul>
				<div onclick="linkGo('mainSpace')">참여공간</div>
				<li onclick="linkGo('ntcSpaceABList')">공지사항</li>
				<li onclick="linkGo('quesSpace')">자주하는 질문</li>
			</ul>
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<ul>
						<div onclick="linkGo(#)">마이페이지</div>
						<li onclick="linkGo(#)">계정관리</li>
						<li onclick="linkGo(#)">이력서관리</li>
						<li onclick="linkGo(#)">활동내역</li>
						<li onclick="linkGo(#)">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<ul>
						<div onclick="linkGo(#)">마이페이지</div>
						<li onclick="linkGo(#)">계정관리</li>
						<li onclick="linkGo(#)">채용공고</li>
						<li onclick="linkGo(#)">활동내역</li>
						<li onclick="linkGo(#)">관심정보</li>
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
						<div class="alarm"></div>
						<a href="#iMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#cMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="manageRegi"><strong>마이페이지</strong></a>
						<div class="profile"></div>
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
	<!-- 	<button id="iMBtn">개인</button>
	<button id="cMBtn">기업</button>
	<button id="mMBtn">관리자</button> -->
	<!-- 서치바 -->

	<!-- 검색작업 -->
	<div class="search_wrap">
		<div class="main_search_bar">
			<form action="#" id="mainSearchForm">
				<!-- <div class="search_img"></div> -->
				<!-- 메인서치 -->
				<input type="text"  name="" placeholder="  채용, 기업, 인재 등"
					autocomplete="off"> <input type="button" id="mainSearchBtn"
					value="검색">
				<!-- 자동검색-ajax-keyup, 코어태그 작성? -->
				<div class="auto_search_wrap">
					<!-- 데이터로 자동 그리기, 링크 -->
					<ul>
						<li onclick="linkGo(#)">검색1</li>
						<li onclick="linkGo(#)">검색2</li>
						<li onclick="linkGo(#)">검색3</li>
					</ul>
				</div>
			</form>
		</div>
	</div>

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

						<div class="main_contents_people" onclick="linkGo(#)">
							<span>인재검색</span>
							<!-- display:none; div 상세메뉴선택 -->
						</div>

						<div class="main_contents_company" onclick="linkGo(#)"> 
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
								<div class="wrap">
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
							<div class="menu_card" onclick="linkGo(#)">
								<div class="wrap">
									<div class="img_activity"></div>
								</div>
								<div class="card_text">
									<span>활동내역</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo(#)">
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
						<div class="menu_cards cM">
							<div class="menu_card">
								<div class="wrap">
									<div class="img_settings"></div>
								</div>
								<div class="card_text">
									<span>계정관리</span>
								</div>
							</div>
							<div class="menu_card">
								<div class="wrap">
									<div class="img_job_post"></div>
								</div>
								<div class="card_text">
									<span>채용공고</span>
								</div>
							</div>
							<div class="menu_card">
								<div class="wrap">
									<div class="img_activity"></div>
								</div>
								<div class="card_text">
									<span>활동내역</span>
								</div>
							</div>
							<div class="menu_card" onclick="linkGo('corpAttndInfo')">
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
							<div class="menu_card" onclick="linkGo('manageReport')">
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
	<footer>
		<!-- 링크작업 -->
		<div class="inner_content">
			<div id="ntc">공지사항</div>
			<div id="paticp">참여마당</div>
			<div id="pvc">개인정보처리방침</div>
			<div id="tou">이용약관</div>
		</div>
		<div class="footer_dtl_wrap">
			<div class="footer_dtl_contents">
				<div class="footer_logo"></div>
				<div class="footer_dtl_contents_1">명칭 (주)일력거 | 사업자등록번호
					123-456-7891011</div>
				<div class="footer_dtl_contents_2">등록일자 2021년 9월 ?일 | 발행
					(주)일력거 | 편집 (주)일력거</div>
				<div class="footer_dtl_contents_3">발행소 서울시 금천구 가산디지털2로 구디아카데미
					| 전화번호 02-1234-5678</div>
				<div class="copyright">©WorkRickshaw. All rights reserved.</div>
			</div>
		</div>
	</footer>
</body>

</html>