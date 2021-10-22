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
<link rel="stylesheet" type="text/css" href="resources/css/space/mainbox.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/space.css" />
<style>
table {
	border: 1px solid #222;
	border-collapse: collapse;
	width:900px;
	/* align: center; */
	text-align: center;
}
th, td {
	border: 1px solid #ccc;
}
tr:hover{
	cursor: pointer;
}
td {
	height:20px;
}
.main_content{
	width:100%;
	height:400px;
}
table  tr {
height: 40px;
}
       	tr>#no{
       		width: 10%;
       	}
        tr>#gbn{
        	width: 10%;
        }
        tr>#title{
        	width: 40%;
        }
        tr>#name{
        	width: 15%;
        }
        tr>#reg{
        	width: 25%;
        }
.paging_wrap{
    display: flex;
    margin: 5px auto;
    width: 200px;
    justify-content: center;
    }
.form_block {
	margin: 5px auto;
	justify-content: center;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	}
	
	reloadList();
	
	// 글작성
	$("#addBtn").on("click", function() {
		$("#searchTxt").val($("#oldTxt").val()); //검색어 유지 위해서. (비동기라 히스토리백 하면 값이 날라가서 그냥 계속 다시 데이터를 보내줘야함. 데이터 보따리를 계속 들고 다니는 것 )
		
		$("#actionForm").attr("action", "ntcABAdd");
		$("#actionForm").submit();
	});
	
	//로그인
	/* $("#loginBtn").on("click", function(){
	    location.href = "testLogin";
	});
	 */
	//로그아웃
	/* $("#logoutBtn").on("click", function(){
	    location.href = "testLogout";
	}); */
	
	//검색
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#oldTxt").val($("#searchTxt").val()); //페이지 넘길때 검색이 유지되도록.
		reloadList();
	});
	
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) { //엔터 치면
			$("#searchBtn").click(); //검색버튼이 클릭되도록 이벤트 줌
			return false; // 엔터 눌린 거 아니면 없던 일로 해.
		}
	});
	
	$(".paging_wrap").on("click", "span", function() {
		$("#page").val($(this).attr("page"));
		/* $("#searchTxt").val($("#oldTxt").val()); */
		/* 이 주석을 해제하면 검색 후 페이지 이동했을때 검색이 풀림*/
		
		reloadList();
	});
	
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#actionForm").attr("action", "ntcAB");
		$("#actionForm").submit();
	});
	
	$("#personalSpaceBtn").on("click", function() {
		location.href = "personalSpace";
	});
	
	$("#mainSpaceBtn").on("click", function() {
		location.href = "mainSpace";
	});
	
	$("#quesSpaceBtn").on("click", function() {
		location.href = "quesSpace";
	});
	
});
//데이터 취득
function reloadList() {
	var params = $("#actionForm").serialize(); //form의 데이터를 문자열로 변환
	
	$.ajax({ // jquery의 ajax함수 호출
		url: "ntcSpaceABLists", //접속 주소
		type: "post", //전송 방식
		dataType: "json", //받아올 데이터 형태
		data: params, //보낼 데이터(문자열 형태)
		success: function(res) { //(ajax통신이)성공 시 다음 함수 실행
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request, status, error) { //(ajax통신이)실패 시 다음 함수 실행
			console.log(error);
		}
	});
}

//목록 그리기
function drawList(list) {
	var html = "";
	
	for(var data of list) {
	html += "<tr no=\"" + data.NOTICE_NO + "\"> ";
	html += "<td>" + data.NOTICE_NO + "</td>"; //번호
	html += "<td>" + data.NOTICE_GBN + "</td>"; //구분
	html += "<td>";  //제목
	html += data.NOTICE_TITLE;
	
	/* if(data.ATTCH_NAME != null) {
		html += "<img src=\"resources/images/attFile.png\" />";
	} */ 
	
	html += "</td>"; 
	html += "<td>" + data.NAME + "</td>"; //작성자 MEMBER테이블
	html += "<td>" + data.REG_DATE + "</td>";  //등록일
	html += "</tr>";
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html = "";
	
	html += "<span page=\"1\">처음</span>";
	
	if($("#page").val() == "1") {
		html += "<span page=\"1\">이전</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>";
	}											// 숫자가 문자열로 되있는 경우 *1 해주면 int 로 자동변환됨. -는 상관없음. 
												// +는 문자열 결합으로 인식시켜버림. 문자인 문자열에 * 를 하는건 NaN 나옴.
												
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if($("#page").val() == i) {
			html += "<span page=\"" + i + "\"><b>" + i + "</b></span>";
		} else {
			html += "<span page=\"" + i + "\">" + i + "</span>";
		}
	}												
	
	if($("#page").val == pb.maxPcount) {
		html += "<span page=\"" + pb.maxPcount + "\">다음</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
	}
	
	html += "<span page=\"" + pb.maxPcount + "\">마지막</span>";
	
	$(".paging_wrap").html(html);
}
	
	
	
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
            <button type="button" class="main_button" onclick="openPage('main_act', this)" id="defaultOpen">공지사항</button>
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
                        <div class="form_block">
							<form action="#" id="actionForm" method="post">
								<select name="searchGbn" id="searchGbn">
									<option value="0">구분</option>
									<option value="1">제목</option>
									<option value="2">작성자</option>
								</select>
								<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
								<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
								<input type="hidden" name="page" id="page" value="${page}" />
								<input type="hidden" name="no" id="no" />
								<input type="button" value="검색" id="searchBtn" />
								<c:if test="${!empty sMNo}">
									<input type="button" value="작성" id="addBtn" />
								</c:if>
							</form>
						</div>
                        <div>
                             <table>

                                <thead>
                                    <tr>
                                     	<th id="no">번호</th>
	                                   	<th id="gbn">구분</th>
	                                  	<th id="tilte">제목</th>
	                                  	<th id="name">작성자</th>
	                                  	<th id="reg">등록일</th>
	                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
						</div>
						<div class="paging_wrap"></div>
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