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
<style>
table {
	background-color: #E6E6FA;
	border: 1px solid #222;
	border-collapse: collapse;
	width:900px;
	/* align: center; */
	text-align: center;
	color: #191970;
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
	
	if(data.ATTCH_NAME != null) {
		html += "<img src=\"resources/images/space/freepik_attach1.png\" />";
	}
	
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
	
	if($("#page").val() == pb.maxPcount) {
		html += "<span page=\"" + pb.maxPcount + "\">다음</span>";
	} else {
		html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
	}
	
	html += "<span page=\"" + pb.maxPcount + "\">마지막</span>";
	
	$(".paging_wrap").html(html);
}
function linkGo(url){
	location.href = url
};
</script>
</head>
<body>
<%@include file="/resources/jsp/header.jsp"%>
    <main>
        <div class="main_button_box">
            <input type="button" class="main_button" onclick="openPage('main_regi', this)" value="이용약관" id="mainSpaceBtn" />
            <input type="button" class="main_button" onclick="openPage('main_apply', this)" value="개인정보처리방침" id="personalSpaceBtn" />
            <input type="button" class="main_button" onclick="openPage('main_act', this)" value="공지사항" id="defaultOpen" />
            <input type="button" class="main_button" onclick="openPage('main_inter', this)" value="자주하는질문" id="quesSpaceBtn" /> 
        </div>
        <div class="main_info">
			<div id="main_act" class="main_content">
                <div class="vertical_menu">
                        <div class="act_content">
                        <div class="form_block">
							<form action="#" id="actionForm" method="post">
								<select name="searchGbn" id="searchGbn">
									<option value="0">전체</option>
									<option value="1">구분</option>
									<option value="2">제목</option>
								</select>
								<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
								<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
								<input type="hidden" name="page" id="page" value="${page}" />
								<input type="hidden" name="no" id="no" />
								<input type="button" value="검색" id="searchBtn" />
								<c:if test="${sMTy eq 3}">
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
	<%@include file="/resources/jsp/footer.jsp"%>
            <!-- 바닐라스크립트 로드 -->
    <script type="text/javascript" src="resources/script/Mypage/header.js"></script>
    <script type="text/javascript" src="resources/script/space/mainbox.js"></script>
</body>
</html>