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
   href="resources\css\imemAct\star\Star.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\imemAct\star\pop.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\imemAct\star\StarListNPrcss.js"></script>
<script type="text/javascript"
	src="resources\script\imemAct\star\StarPop.js"></script> 

<script type="text/javascript">
function linkGo(url){
	location.href = url
}
</script>
</head>
<body>

<div class="pop_wrap">
	<div class="pop-container"></div> 
</div>
<!-- 헤더 -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo(#)">채용정보</div>
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
				<div onclick="linkGo(#)">참여공간</div>
				<li onclick="linkGo(#)">공지사항</li>
				<li onclick="linkGo(#)">자주하는 질문</li>
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
						<div onclick="linkGo(#)">마이페이지</div>
						<li onclick="linkGo(#)">계정관리</li>
						<li onclick="linkGo(#)">회원관리</li>
						<li onclick="linkGo(#)">신고관리</li>
						<li onclick="linkGo(#)">평점관리</li>
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
						<strong id="userNo" no=${sMNo }>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#cMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong id="userNo" no=${sMNo }>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#mngMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong id="userNo" no=${sMNo }>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
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
	<main>
		<div class="main_wrap">
			<div class="user_wrap">
				<div class="user_box">
					<div class="user_profile"></div>
					<div class="user">
						<div class="user_name"></div>
						<div class="user_status"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('resumeList')">이력서관리</button>
			<button type="button" class="main_button" onclick="linkGo('recepReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('empAttnd')">관심정보</button>
		</div>
		
		<div class="main_info">
			<div id="main_inter" class="main_content">
				<div class="vertical_menu">
					<span onclick="linkGo('recepReq')" ><a href="#" id="recepReq">받은 입사요청</a></span> 
					<span onclick="linkGo('submitResum')" ><a href="#" id="submitResum">보낸 이력서</a></span>
					<span onclick="linkGo('imemStar')" ><a href="#" id="imemStar">평점관리</a></span>
				</div>
				
				<div class="main_box">
					<div class="inner_wrap">
						<table class="staring">
							<tr>
								<td>
									<div class="zero">처리할 내용이 없습니다.</div>
								</td>
							</tr>
						</table>
					</div>
					
					<form action="#" id="staringForm">
						<input type="hidden" id="aplmenNo" name="aplmenNo" value="${sMNo }">
						<input type="hidden" id="page" name="page" value="${page }">
					</form>
					<div id="staring_paging_wrap"></div>
				</div>
			</div>

		</div>

	</main>
</body>
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
</html>