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
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/mainbox.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/space.css" />

<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script>
$(document).ready(function() {
	$("#personalSpaceBtn").on("click", function() {
		location.href = "personalSpace";
	});
	
	$("#ntcSpaceABListBtn").on("click", function() {
		location.href = "ntcSpaceABList";
	});
	
	$("#mainSpaceBtn").on("click", function() {
		location.href = "mainSpace";
	});
	
	
}); //document ready end
function linkGo(url){
 		location.href = url
 	};
</script>
</head>
<body>
<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div id="sdienav_ul">
    	<!-- 링크작업 -->
        <ul>
        	<div id="" >채용정보</div>
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
            <button class="main_button" onclick="openPage('main_regi', this)" id="mainSpaceBtn">이용약관</button>
            <button class="main_button" onclick="openPage('main_apply', this)" id="personalSpaceBtn">개인정보처리방침</button>
            <button class="main_button" onclick="openPage('main_act', this)" id="ntcSpaceABListBtn">공지사항</button>
            <button class="main_button" onclick="openPage('main_inter', this)" id="defaultOpen">자주하는질문</button> 
        </div>
        <div class="main_info">
			<div id="main_inter" class="main_content">
                <div class="vertical_menu">
                    <div class="inter_content">
                        <div class="list">
                            <button class="accordion"><h4>이력서 등록은 어떻게 하나요?</h4></button>
                            <div class="panel">
                                <p>이력서는 로그인 후 마이페이지에서 등록 및 수정이 가능합니다. </p>
                                <!-- <button class="updateBtn" >수정</button>
                                <button class="delBtn" >삭제</button> -->
                            </div>
                            <br/><button class="accordion"><h4>다른 기업에 지원하려고 이력서를 수정하면 이전에 입사지원한 기업에서도 수정된 이력서를 보는 건가요?</h4></button>
                            <div class="panel">
                                <p>인사담당자는 회원님이 입사지원 시 제출하신 이력서만 열람이 가능합니다.
                                따라서 회원님이 이력서를 수정/삭제 하시더라도 인사담당자는 수정/삭제 된 이력서는 확인할 수 없습니다.
                                '입사지원 현황'에서 회원님이 입사지원한 이력서 및 첨부파일 현황등을 공고별로 확인하실 수 있으니 참고 바랍니다.</p>
                                <!-- <button class="updateBtn" >수정</button>
                                <button class="delBtn" >삭제</button> -->
                            </div>
                            <br/><button class="accordion"><h4>아이디와 비밀번호를 잃어버렸는데 어떻게 찾을 수 있나요?</h4></button>
                            <div class="panel">
                                <p>로그인 화면에서 '아이디/비밀번호 찾기'를 통해 찾을 수 있습니다.</p>
                                <!-- <button class="updateBtn" >수정</button>
                                <button class="delBtn" >삭제</button> -->
                            </div>
                            <%-- <c:if test="${sMTy eq 3}">
                            	<button class="writeBtn">작성</button>
                            </c:if> --%>
                        </div>
                        <div class="write">
                            <div>
                                <h3>Q)</h3>
                                <input type="text" class="q_inp" placeholder="내용을 입력해주세요">
                            </div>
                            <div>
                                <h3>A)답변</h3>
                                <input type="text" class="a_inp" placeholder="내용을 입력해주세요">
                            </div>
                            <!-- <button class="addBtn">저장</button> -->
                        </div>
                        <!-- Paging -->
   						<div class="page">
                            <ul class="pagination modal">
                                <li><a href="#" class="num"><<</a></li>
                                <li><a href="#" class="active num">1</a></li>
                                <li><a href="#" class="num">>></a></li>                                
                            </ul>
                        </div> 
                    </div>             
                </div>
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

	<script>
        var acc = document.getElementsByClassName("accordion");
        var i;
            
        for (i = 0; i < acc.length; i++) {
          acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
              panel.style.display = "none";
            } else {
              panel.style.display = "block";
            }
          });
        }

        

    </script>
            <!-- 바닐라스크립트 로드 -->
    <script type="text/javascript" src="resources/script/Mypage/header.js"></script>
    <script type="text/javascript" src="resources/script/space/mainbox.js"></script>
</body>
</html>