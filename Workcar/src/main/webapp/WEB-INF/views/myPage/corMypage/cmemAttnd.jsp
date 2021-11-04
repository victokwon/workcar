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
   href="resources\css\cmemAttnd\hrsuggest.css">
<link rel="stylesheet" type="text/css"
   href="resources\css\cmemAttnd\pop.css">
   
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources\script\common\sidebar.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAttnd\hrsuggest1.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAttnd\hrsuggest2.js"></script>
<script type="text/javascript"
	src="resources\script\cmemAttnd\hrsuggest3.js"></script>
	
<script type="text/javascript">
$(function () {
	$(function () {
		  $("#empAttention").on("click", function () {
		    $(".emp_attention").css("display", "table");
		    $(".emp_suggest").css("display", "none");
		  });
		  
		  $("#empSuggest").on("click", function () {
		    $(".emp_attention").css("display", "none");
		    $(".emp_suggest").css("display", "table");
		  });
		});
	



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
			<div class="topnav-centered">
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
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
			<button type="button" class="main_button" onclick="linkGo('empannc')">이력서관리</button>
			<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
			<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
		</div>
		
	 <div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1></h1>
                </div>
                <!-- 5개 리스트 -->
                <div class="list_wrap">
                    <table>
                        <thead>
                            <tr eNo="다시 선택">
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                                <th class='td_date'>마감일</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" >
                        	<tr eNo="1">
                        		<td class='td_no'></td>
                        		<td class='td_name'></td>
                        		<td class='td_date'></td>
                        	</tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="page">
                </div>
                <hr>
                <div class="paging_wrap"></div>
                <div class="pop-input">
               		<div class="text_box"></div>
                    <input type="button" class="sch-btn" id="selectBtn" rNo="" value="요청하기">
                </div>
            </div>
        </div>
    </div>
    
		<div class="main_info">
			<div id="main_inter" class="main_content">
				<div class="vertical_menu">
	<!-- 				<form action="#" id="resumeGo">
						<input type="hidden" id="userNO" name="userNO">
						 <input type="hidden" id="resumeNO" name="resumeNO">
					</form> -->
					<!-- 이력서 리스트 메뉴 출력 -->
					<a href="#" id="empAttention">관심인재</a> <a href="#" id="empSuggest">인재추천</a>
				</div>
				
				<div class="main_box">
					<!-- <table class="please_apply"> -->
					<table class="emp_attention">
					</table>
					<!-- <table class="company_grade"> -->
					<form action="#" id="suggetResumeForm">
					</form>
					<table class="emp_suggest">
							<tr>
								<td class="job_post_add">
									<button type="button" class="" id="addEmpBtn">인재 더보기</button>
								</td>
							</tr>
					</table>
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