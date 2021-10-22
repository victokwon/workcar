<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/mainbox.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/space.css" />
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script>
$(document).ready(function() {
	/* if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	}
	
	if("${page}" > "${pb.maxPcount}") { //데이터 변조로 인하여 페이지가 총페이지를 넘어가는 경우
		$("#page").val()("${pb.maxPcount}");
		$("#searchForm").submit();
	}
	
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#dtlForm").submit();
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#searchForm").submit();
	}); //searchBtn click end */
	
	$("#mainSpaceBtn").on("click", function() {
		location.href = "mainSpace";
	});
	
	$("#ntcSpaceABListBtn").on("click", function() {
		location.href = "ntcSpaceABList";
	});
	
	$("#quesSpaceBtn").on("click", function() {
		location.href = "quesSpace";
	});
	
	/* $("#pagingWrap").on("click", "span", function() {
		$("#searchTxt").val($("#oldTxt").val());
		$("#page").val($(this).attr("page"));
		$("#searchForm").submit();
	});
	
	$("#loginBtn").on("click", function() {
		location.href = "testLogin";
	});
	$("#logoutBtn").on("click", function() {
		location.href = "testLogout";
	}); */
}); //document ready end
</script>
</head>
<body>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div id="sdienav_ul">
    	<!-- 링크작업 -->
        <ul>
        	<div id="">채용정보</div>
            	<li id="">통합검색</li>
            	<li id="">조회수 100</li>
            	<li id="">평점 100</li>
        </ul>
        <ul>
         	<div id="">기업정보</div>
            <li id="">통합검색</li>
        </ul>
        <ul>
            <div id="">인재정보</div>
            <li id="">통합검색</li>
        </ul>
        <ul>
            <div id="">참여공간</div>
            <li id="">공지사항</li>
            <li id="">자주하는 질문</li>
        </ul>
        <c:choose>
            <c:when test="${sMTy eq 0}">
               <ul>
                  <div id="">마이페이지</div>
                  <li id="">계정관리</li>
                  <li id="">이력서관리</li>
                  <li id="">활동내역</li>
                  <li id="">관심정보</li>
               </ul>
            </c:when>
            <c:when test="${sMTy eq 1 || sMTy eq 2}">
               <ul>
                  <div id="">마이페이지</div>
                  <li id="">계정관리</li>
                  <li id="">채용공고</li>
                  <li id="">활동내역</li>
                  <li id="">관심정보</li>
               </ul>
            </c:when>
            <c:when test="${sMTy eq 3}">
               <ul>
                  <div id="">마이페이지</div>
                  <li id="">계정관리</li>
                  <li id="">회원관리</li>
                  <li id="">신고관리</li>
                  <li id="">평점관리</li>
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
                  	<a href="#mngMypage"><strong>마이페이지</strong></a>
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

    <!-- 클래스명, 아이디명 수정-->
    <!--  -->
    <main>

        <div class="main_button_box">
            <!--<button class="main_button" onclick="openPage('main_regi', this)" id="defaultOpen">이용약관</button>
            <button class="main_button" onclick="openPage('main_apply', this)" id="personalSpaceBtn">개인정보처리방침</button>
            <button class="main_button" onclick="openPage('main_act', this)" id="ntcSpaceABListBtn">공지사항</button>
            <button class="main_button" onclick="openPage('main_inter', this)" id="quesSpaceBtn">자주하는질문</button> --> 
            <input type="button" class="main_button" onclick="openPage('main_regi', this)" value="이용약관" id="mainSpaceBtn" />
            <input type="button" class="main_button" onclick="openPage('main_apply', this)" value="개인정보처리방침" id="defaultOpen" />
            <input type="button" class="main_button" onclick="openPage('main_act', this)" value="공지사항" id="ntcSpaceABListBtn" />
            <input type="button" class="main_button" onclick="openPage('main_inter', this)" value="자주하는질문" id="quesSpaceBtn" />
        </div>
        <div class="main_info">
			<div id="main_apply" class="main_content">
                <div class="vertical_menu">
                    <div><br/><h3>개인정보처리방침</h3>
                        <div class="apply_content">
                            <br/><h4>제1조(개인정보의 처리목적)</h4>
                            <br/><p>일력거는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

                                <br/><br/> 1. 홈페이지 회원 가입 및 관리
                                회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리 등을 목적으로 개인정보를 처리합니다.
                                <br/><br/> 2. 민원사무 처리
                                민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.
                                일력거는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
                                
                                <br/><br/><h4>제2조(개인정보의 처리 및 보유기간)</h4>
                                <br/><p>일력거는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처··보유합니다.
                                개인정보보호법 제32조에 따라 등록·공개하는 각각의 개인정보파일의 개인정보 처리 및 보유기간에 대한 자세한 사항은 제1조 제2항과 같습니다.</p>
                                <br/><h4>제3조(개인정보의 제3자 제공)</h4>
                                <br/> <p>일력거는 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조, 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
                                <br/> <h4>제4조(처리하는 개인정보 항목)</h4>
                                <br/> <p>일력거가 개인정보보호법 제32조에 따라 등록·공개하는 각각의 개인정보 파일의 개인정보 항목은 제1조 제2항과 같습니다.
                                일력거 홈페이지 등의 인터넷 서비스 이용과정에서 인터넷서버 도메인과 방문일시 및 홈페이지 내 방문 기록정보 등은 자동적으로 수집·저장되며 이러한 정보는 관련 법령에 따라 제출할 수 있습니다.</p>
                                <br/> <h4>제5조(개인정보의 파기)</h4>
                                <br/><p>일력거는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
                                정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보(또는 개인정보파일)을 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
                                개인정보 파기의 절차 및 방법은 다음과 같습니다.
                                <br/>1. 파기절차
                                일력거는 파기하여야 하는 개인정보(또는 개인정보파일)에 대해 개인정보 파기계획을 수립하여 파기합니다. 일력거는 파기 사유가 발생한 개인정보(또는 개인정보파일)을 선정하고, 일력거는 개인정보 보호책임자의 승인을 받아 개인정보(또는 개인정보파일)을 파기합니다.
                                <br/>2. 파기방법
                                일력거는 전자적 파일 형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 영구 삭제하며, 종이 문서에 기록·저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.</p>
                        </div>
                    </div>                    
                </div>
            </div>
         </div>
      </main>
            <!-- 바닐라스크립트 로드 -->
    <script type="text/javascript" src="resources/script/Mypage/header.js"></script>
    <script type="text/javascript" src="resources/script/space/mainbox.js"></script>
</body>
</html>