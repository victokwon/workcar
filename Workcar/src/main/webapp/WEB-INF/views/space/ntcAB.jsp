<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<style>
main{
	height: calc(100% - 20px);
}
table {
	background-color: #E6E6FA;
   	border: 1px solid #222;
  	border-collapse: collapse;
  	width: 900px;
  	/* align: center; */
 	text-align: center;
 	color: #191970;
}

.main_content{
   display: flex;
   height: 90%;
}
.vertical_menu {
   width: 100%;
}

th, td {
   height: 50px;
}

.cntt {
   height: 500px;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
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
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "ntcSpaceABList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "ntcABUpdate");
	    $("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();  //데이터를 문자열화
			
			$.ajax({
				url: "ntcABDeletes",   //이 주소로 데이터 주고받을거야, 새 주소 나오면 컨트롤러에 만들어줘야함.
				type: "post",
				dataType: "json",  
				data: params,
				success: function(res) { 
					if(res.result == "success") { 
						location.href = "ntcSpaceABList";
					} else if(res.result == "failed") {
						alert("삭제에 실패하였습니다.");
					} else {
						alert("삭제중 문제가 발생했습니다.");
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});	
		}
	});
});

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
            <button type="button" class="main_button" onclick="openPage('main_regi', this)" id="mainSpaceBtn">이용약관</button>
            <button type="button" class="main_button" onclick="openPage('main_apply', this)" id="personalSpaceBtn">개인정보처리방침</button>
            <button type="button" class="main_button" onclick="openPage('main_act', this)" id="ntcSpaceBtn">공지사항</button>
            <button type="button" class="main_button" onclick="openPage('main_inter', this)" id="quesSpaceBtn">자주하는질문</button> 
            <!--<input type="button" class="main_button" value="이용약관" id="mainSpaceBtn" />
            <input type="button" class="main_button" value="개인정보처리방침" id="personalSpaceBtn" />
            <input type="button" class="main_button" value="공지사항" id="defaultOpen" />
            <input type="button" class="main_button" value="자주하는질문" id="quesSpaceBtn" /> -->
        </div>
        <div class="main_info">
			<div id="main_act" class="main_content">
                <div class="vertical_menu">
                        <div class="act_content">
                        	<form action="#" id="actionForm" method="post">
								<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
								<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
								<input type="hidden" name="page" value="${param.page}" />
								<input type="hidden" name="no" value="${param.no}" />
							</form>
<div>
<table>
	<tbody>
		<tr>
			<th>번호</th>
			<td>
				${data.NOTICE_NO}
			</td>
			<td>
				구분
			</td>
			<td>
				${data.NOTICE_GBN}
			</td>
			<td>
				작성자
			</td>
			<td>
				${data.NAME}
			</td>
			<td>
				등록일
			</td>
			<td>
				${data.REG_DATE}
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="7">
				${data.NOTICE_TITLE}
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="cntt" colspan="7">
				${data.NOTICE_CNTT}
			</td>
		</tr>
	</tbody>
</table>
</div>

 <c:if test="${!empty data.ATTCH_NAME}">
<div>
	<!-- c:set => 변수선언 -->
	<!-- fn:length => 문자열 : 문자열길이, 리스트나 배열 : 개수 -->
	<c:set var="len" value="${fn:length(data.ATTCH_NAME)}"></c:set>
	첨부파일 : 
	<!-- fn:substring(값, 숫자1, 숫자2) => 인덱스 숫자1번째부터 숫자2미만까지 자름 -->
	<!-- a의 download : href의 파일을 다운로드하겠다. 만약 download에 값이 있는 경우
					    해당이름으로 다운로드하겠다. 서버에 있는 파일의 앞에 20자리 빼고 사용자에게 보여줌.
	 -->
	 <a href="resources/upload/${data.ATTCH_NAME}" download="${fn:substring(data.ATTCH_NAME, 20, len)}">
	${fn:substring(data.ATTCH_NAME, 20, len)}
	</a>
</div>
</c:if> 
							<c:if test="${sMTy eq 3}">
								<input type="button" value="수정" id="updateBtn" />
								<input type="button" value="삭제" id="deleteBtn" />
							</c:if>
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