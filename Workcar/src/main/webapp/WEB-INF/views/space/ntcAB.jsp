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
function linkGo(url){
	location.href = url
};
</script>
</head>
<body>
<%@include file="/resources/jsp/header.jsp"%>
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
	<%@include file="/resources/jsp/footer.jsp"%>
<script type="text/javascript" src="resources/script/Mypage/header.js"></script>
<script type="text/javascript" src="resources/script/space/mainbox.js"></script>
</body>
</html>