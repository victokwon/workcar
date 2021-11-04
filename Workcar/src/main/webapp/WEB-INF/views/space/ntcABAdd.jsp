<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
#att {
	display: none;
}
main{
	height: calc(100% - 170px);
}
.main_content{
	display: flex;
   	height: 90%;
}
.vertical_menu {
   width: 100%;
}
</style>
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.12.4.min.js">
</script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js">
</script>
<script type="text/javascript" 
		src="resources/script/ckeditor/ckeditor.js">
</script> <!-- ckeditor 도 jquery를 기반으로 만들어져서 먼저 문서에 jquery부터 넣고 에디터를 넣어야 작동한다. -->
<script>
$(document).ready(function() {
	CKEDITOR.replace("cntt", {
		resize_enabled : false,  // 사이즈 조절 금지
		language : "ko",
		enterMode : "2"
	});
	
	//상단 메뉴바 클릭시 해당 페이지로 이동
	$("#personalSpaceBtn").on("click", function() {
		location.href = "personalSpace";
	});
	
	$("#mainSpaceBtn").on("click", function() {
		location.href = "mainSpace";
	});
	
	$("#ntcSpaceBtn").on("click", function() {
		location.href = "ntcSpaceABList";
	});
	
	$("#quesSpaceBtn").on("click", function() {
		location.href = "quesSpace";
	});
	
	// 취소버튼
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	});
	
	// 엔터키 폼실행 막기
	$("#addForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) { //엔터키가 눌러졌을 때
			return false; //form실행 이벤트를 하지 않음 (기본할당 동작키 작동 막음)
		}
	});
	
	//첨부파일 버튼 (attach를 줄여서 att)
	$("#fileBtn").on("click", function() {
		$("#att").click();
	});
	
	//첨부파일 선택 시 (파일첨부하면 파일명이 버튼옆에 뜬다. \\는 \를 문자로 인식시키기 위해 두번 쓴 것.)
	$("#att").on("change", function() {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
	});
	
	// 저장 버튼
	$("#addBtn").on("click", function() {
		// ck에디터 중에 con과 관련된 객체에서 데이터를 취득하여  textarea인 con에 값을 넣는다
		$("#cntt").val(CKEDITOR.instances['cntt'].getData());
		
		if(checkVal("#title")) { //입력체크
			alert("제목을 입력해 주세요.");
			$("#title").focus();
		} else if (checkVal("#cntt")) {
			alert("내용을 입력해 주세요.");
		} else {
			var fileForm = $("#fileForm");
			
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						// 업로드 파일명 적용
						if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
							$("#nFile").val(res.fileName[0]);
						}
						
						//글 저장
						var params = $("#addForm").serialize();  //데이터를 문자열화
						
						$.ajax({
							url: "ntcABAdds",   //이 주소로 데이터 주고받을거야
							type: "post",
							dataType: "json",  
							data: params,
							success: function(res) { 
								if(res.result == "success") { // 성공시 그냥 로케이션 이동
									location.href = "ntcSpaceABList";
								} else if(res.result == "failed") {
									alert("작성에 실패하였습니다.");
								} else {
									alert("작성중 문제가 발생했습니다.");
								}
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
						
					} else {
						alert("파일 업로드에 실패하였습니다.");
					}
				},
				error : function(req, status, error) {
					console.log(error);
					alert("파일 업로드중 문제가 발생하였습니다.");
				}
				
			});
			
			fileForm.submit();
		}
	});
});

function checkVal(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}
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
            <button type="button" class="main_button" onclick="openPage('main_regi', this)" id="mainSpaceBtn">이용약관</button>
            <button type="button" class="main_button" onclick="openPage('main_apply', this)" id="personalSpaceBtn">개인정보처리방침</button>
            <button type="button" class="main_button" onclick="openPage('main_act', this)" id="ntcSpaceBtn">공지사항</button>
            <button type="button" class="main_button" onclick="openPage('main_inter', this)" id="quesSpaceBtn">자주하는질문</button> 
        </div>
        <div class="main_info">
			<div id="main_act" class="main_content">
                <div class="vertical_menu">
                        <div class="act_content">
<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" />
</form>
<form action="ntcSpaceABList" id="backForm" method="post">
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="page" value="${param.page}" />
</form>
<form action="#" id="addForm" method="post">
	제목 <input type="text" id="title" name="title" /><br/>
	작성자 : ${sMNm}<input type="hidden" name="memNo" value="${sMNo}" /><br/>
	<textarea rows="5" cols="5" id="cntt" name="cntt"></textarea> 
	첨부파일 : <input type="button" value="첨부파일선택" id="fileBtn" />
	<span id="fileName"></span>
	<input type="hidden" name="nFile" id="nFile" /> <!-- DB저장용 -->
</form>
							<%-- <c:if test="${data.MEM_NO eq sMNo}"> --%>
								<input type="button" value="저장" id="addBtn" />
								<input type="button" value="취소" id="cancelBtn" />
							<%-- </c:if> --%>
							<input type="button" value="목록" id="listBtn" />
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
<script type="text/javascript" src="resources/script/Mypage/header.js"></script>
<script type="text/javascript" src="resources/script/space/mainbox.js"></script>
</body>
</html>