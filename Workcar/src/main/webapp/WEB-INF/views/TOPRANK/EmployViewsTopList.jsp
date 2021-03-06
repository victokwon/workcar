<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common/default.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/common/header.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/common/sidebar.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/empsch/topviews.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/empsch/paging.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	if($("#gradu").val()==""){
	 	$("#gradu").val(6)
	 }
 	 if($("#empGbn").val()==""){
	 	$("#empGbn").val(4)
	 }
 	 if($("#carr").val()==""){
 	 	$("#carr").val(4)
 	 }
 	  
	
	$("#row_box").on("click","td",function(){
		if($(this).attr("class") != "no_data"){
			$("#empno").val($(this).attr("empno"))
			let target = "applyDetail"
			$("#actionForm1").attr("action", target)
			$("#actionForm1").submit()
		}

	}) 

	
	/* var  noBox = {qualNo: ${conCnt}}

	console.log(noBox); */


	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${params.searchGbn}");
	}
	
	reloadList();
	
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		$("#oldTxt").val($("#searchTxt").val());
		

		reloadList();
	});
	//키방지
	$("#searchTxt").on("keypress", function(event){
		if(event.keyCode ==13 ){
		$("#searchBtn").click();
	  
		return false;
		}
	});
	$(".page").on("click", "span", function(){
		$("#page").val($(this).attr("page"));
		$("#searchTxt").val($("#oldTxt").val()); 
		
		reloadList();
	});	
	$("tbody").on("click", "tr", function(){
	 $("#no").val($(this).attr("no"));
	 //눌렀을때 번호를 저장하고 그것에 따라 상세보기에 보내겠다.
	});

	
	
});

//데이터 취득
function reloadList(){
	var params = $("#actionForm1").serialize();
 
	
	$.ajax({
		url : "EmployViewsTopListAjax",
		type : "post",
		dataType : "json",
		data : params,
		success : function(res){
			drawList(res.list,res.cnt);
			drawPaging(res.pb,res.cnt);
		},
		error: function(request,status,error){
			console.log(error);
		}
	});
}
//목록 그리기
function drawList(list,cnt) {
	var html = "";
	var i=1;
	if(cnt<=0){
		html += "<td class='no_data'>";
		html += "검색조건에 해당하는 데이터가 없습니다.";
		html += "</td>";
	}else{
		for(var data of list) {
			html += '<td class="column" empno="'+data.EMP_NO+'">';
			html += "<div class=\"content\">";
			html += "<div class=\"content_div\"> 순위 : "+ i++ +"</div>";
			html += "<span class=\"content_emp_no\"> 공고 번호 : "+ data.EMP_NO +"</span>";
			html += "<img src=\"resources/images/common/logo.png\" />     ";
				if(data.CORP_IMG != null){
					"<img src=\"resources/images/upload/" + data.CORP_IMG + ".png\" />     ";				
				}
			html += "<h3>" + data.C_NAME + "</h3>"; 
			html += "<span class=\"sn_overflow\">" + data.EMP_TITLE + "</span>";
			html += "</div>";
			html += "</td>";
	
		}
	} 
	$(".row").html(html);
}
function drawPaging(pb,cnt) {
	var html = "";
	/* html += "<span page=\"1\">처음</span>      "; */
	
	if(cnt<=0){
		$("#page").val() == "0";
	}else{
		if($("#page").val() == "1") {
		   html += "<span page=\"1\" class=\"prev\" \">&#10094;</span>      ";
		} else {
		   html += "<span class=\"prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">&#10094;</span>      ";
		}                                 // *1 해주면 int 로 자동변환됨. -는 상관없음. 
		                                 // +는 문자열 결합으로 인식시켜버림.
		                                 
		for(var j = pb.startPcount ; j <= pb.endPcount ; j++) {
		   if($("#page").val() == j) {
		      html += "<span class=\"dot\"  page=\"" + j + "\" style=\"background-color:#717171\"> </span>  ";
		   } else {
		      html += "<span class=\"dot\"  page=\"" + j + "\"> </span>  ";
		   }
		}                                    
		
		if($("#page").val() == pb.maxPcount) {
		   html += "<span class=\"next\"  page=\""
		   html += pb.maxPcount
		   html += "\">&#10095;</span>      "
		} else {
		   html += "<span class=\"next\"  page=\"" 
		   html += ($("#page").val() * 1 + 1)
		   html += "\">&#10095;</span>      ";
		}
	}
	
	
	/* $(".page").html(html); */
}

function checkInputText(){
	$("input[type=text]").each(function(idx){
		if($(this).val() == ""){
			alert("입력값이 누락되었습니다.")
			$(this).focus()
			return false
		}
	})
}
function checkVal(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}
function linkGo(url){
		location.href = url
	}
</script>
</head>
<body>
	<%@include file="/resources/jsp/header.jsp"%>

	<main>
		
		<div class="main_wrap">
			<div class="main_h1_box">
				<div class="main_button_box">
					<button class="main_button"
						 onclick="linkGo('EmploySearchList')" >채용 통합
						검색</button>
					<button class="main_button"
						 onclick="linkGo('EmployViewsTopList')"  id="defaultOpen">채용 조회수 100</button>
					<button class="main_button"
						onclick="openPage('main_garde', this,'#88a2f2')">평점 100</button>
				</div>
                <h1 class="main_h1" onclick="linkGo('EmployViewsTopList')">채용 조회수 Top 100</h1>
            </div>
			
			<div class="main_info">
				<form action="#" id="actionForm1" method="post" class="tab_search_btn">
				<div id="main_search" class="main_content">
					<div class="search_top">
						
						<input type="hidden" name="empno" id="empno"/>
							
							<input type="hidden" id="oldTxt" value="${param.searchTxt}" /> 
							<input type="hidden" name="page" id="page" value="${page}" />
							

						

					</div>
					<!-- 검색 -->
					<!-- 메인컨텐츠 -->

					
					<!-- Portfolio Gallery Grid -->
					<div class="card_list  ">

						<div class="card_list_char">
							
						</div>
						<div class="mySlides">
							<table>
								<thead></thead>
								<tbody id="row_box">
									<tr class="row"></tr>
								</tbody>
							</table>
						</div>
						<!-- 페이징 -->
						<div class="page"></div>
					</div>
				</div>
			</form>

			</div>
		</div>
	</main>
	<%@include file="/resources/jsp/footer.jsp"%>


	<script type="text/javascript" src="resources/script/empsch/header.js"></script>

	

</body>
</html>