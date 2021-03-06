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
	href="resources/css/empsch/Employ_search.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/empsch/paging.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/empsch/qualsch.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 달력css,js  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/empsch/DatePicker.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
	
	
	let qualCnt = 0;
	$(".qual_wrap").on("click", "tr", function () {
		if($(".pop-container").attr("btn") == "q"){
			let html = "";
	    	html += '<div class="data_container ">';
		    html += '<input type="button" class="minus_btn" id="delBtn" value="－">';
		    html += '<input type="hidden" name="qualno" id="qualno'+qualCnt+'" no = "'+qualCnt+ '" value="데이터">';
			html += '<input type="text" class="input_box qual_box" id="qualInput'+qualCnt+'" no = "'+qualCnt+ '" name="qName" value="자격증명" />';
		    html += " </div>";
		    
			$(".add_box").parent().append(html);
			
			$("#qualList").attr("no", qualCnt);
			
			
			qualCnt += 1;
			
			let target = $("#qualList").attr("no")
			$("#qualInput"+target+"").val($(this).attr("qName"));
		   	$("#qualno"+target+"").val($(this).attr("qNo"));
		   	if(!qaulOverChk()){
		   		$("#qualInput"+target+"").parent().remove();
		    }
		    
		   	$(".pop-container").hide()
		}else if($(".pop-container").attr("btn") == "s"){
			$("#sectorInput").val($(this).attr("sName"))
		    $("#sectorInput").attr( "sNo",$(this).attr("sNo"))
		    $("#sectorNo").val($(this).attr("sNo"))
		  $(".pop-container").hide()
		}
	  	$(".paging_wrap").html("");
	});
	
	$("#row_box").on("click","td",function(){
		if($(this).attr("class") != "no_data"){
			$("#empno").val($(this).attr("empno"))
			let target = "applyDetail"
			$("#actionForm1").attr("action", target)
			$("#actionForm1").submit()
		}
	}) 
	
	
	$(".paging_wrap").on("click","span",function(){
		$("#pop_page").val($(this).attr("pop_page"));
		if($(".pop-container").attr("btn") == "q"){
			schQual();
		}else if($(".pop-container").attr("btn") == "s"){
			schSector();
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
		if($("#sal1").is(":checked")){
			if(checkVal("#minSal")){
				alert("최소금액을 입력해 주세요.")
				$("#minSal").focus();
				return false
			}else if(checkVal("#maxSal")){
				alert("최대금액을 입력해 주세요.")
				$("#maxSal").focus();
				return false
			}else if(Number($("#minSal").val()) >= Number($("#maxSal").val())){
				alert("최소금액이 최대금액보다 큽니다.")
				return false
			}
		}
		
		if($("#career2").is(":checked")){
			if(checkVal("#minCareer")){
				alert("최소경력을 입력해 주세요.")
				$("#minCareer").focus();
				return false
			}else if(checkVal("#maxCareer")){
				alert("최대경력을 입력해 주세요.")
				$("#maxCareer").focus();
				return false
			}else if(Number($("#minCareer").val()) >= Number($("#maxCareer").val())){
				alert("최소경력이 최대경력보다 큽니다.")
				return false
			}
		}
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


	$(".locSelectBox").on("change",".citySel",function(){
	   getRegion($(this).val(), $(this).next())
	}) 
	$("select[name='region']").each(function(idx) {
		getRegion($("#city" + idx + "").val(), $(this), $(this).attr("selValue"));
	});	
});

//데이터 취득
function reloadList(){
	var params = $("#actionForm1").serialize();

	
	$.ajax({
		url : "EmploySearchListAjax",
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
	if(cnt<=0){
		html += "<td class='no_data'>";
		html += "검색조건에 해당하는 데이터가 없습니다.";
		html += "</td>";
	}else{
		for(var data of list) {
			
			html += '<td class="column" empno="'+data.EMP_NO+'">';
			html += "<div class=\"content\">";
			html += "<div>"+ data.EMP_NO +"</div>";
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
	$(".card_list_char").children().html("검색리스트 "+cnt + "건") 
	$(".row").html(html); 
}
function drawPaging(pb,cnt) {
	var html = "";
	/* html += "<span page=\"1\">처음</span>      "; */
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
	
	
	$(".page").html(html);
}
function getRegion(city, target, val){
	console.log(city);
	console.log(target);
	console.log(val);
   $.ajax({
         type : "POST",
         data : "cityNo=" + city,
         url : "getRegionList",
         dataType : "json",
         success : function(res) {
            if (res.result == "SUCCESS") {
               regionOptionDraw(res.list ,target, val)
            } else if (res.result == "FAILED") {
               console.log(res.result)
            }
         },
         error : function(request, status, error) {
            console.log(error);
         }
      });
}
function regionOptionDraw(list, target, val){
   var html= "" 
      for(data of list){
            html += '<option value="'+data.REGION_NO+'">'+data.REGION_NAME +'</option>'
      }
   target.html(html);
   
   if(val != null) {
	   target.val(val);
   }
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
		<div class="pop-container">
			<div class="pop-out-container">
				<div class="pop-in-container">
					<div class="pop-text-header">
						<h1>자격증 검색</h1>
					</div>

					<form class="pop-user" id="qualSchForm" method="post">
						<input type="hidden" name="pop_page" id="pop_page" value="${pop_page}">
						
						<div class="pop-input">
							<input type="button" class="sch-btn" id="schSectorBtn" value="검색">
							<input type="button" id="schQualBtn" value="검색">
							<input type="text" name="schCName" id="schCName" placeholder="검색어">
						</div>
						<input type="button" id="cancelBtn" value="X">
					</form>
						<div class="qual_wrap">
							<table>
								<thead>
									<tr id="qual_th">
										<th>번호</th>
										<th>이름(명)</th>
									</tr>
								</thead>
	
								<tbody id="qualList" no="">
								</tbody>
							</table>
						</div>
					<hr>
					<div class="paging_wrap"></div>


				</div>
			</div>
		</div>
		<div class="main_wrap">
			<div class="main_button_box">
				<button class="main_button"
					onclick="linkGo('EmploySearchList')"  id="defaultOpen" >채용 통합
					검색</button>
				<button class="main_button"
					onclick="linkGo('EmployViewsTopList')">조회수 100</button>
				<button class="main_button"
					onclick="openPage('main_garde', this,'#88a2f2')">평점 100</button>
			</div>
			<div class="main_info">
						<form action="#" id="actionForm1" method="POST" class="tab_search_btn">
				<div id="main_search" class="main_content">
					<div class="search_top">
							<input type="hidden" id="empno" name="empno" value="">
							<select name="searchGbn" class="search_select" id="searchGbn">
								<option value="0">전체</option>
								<option value="1">기업명</option>
								<option value="2">공고명</option>
							</select> 
							<input type="text" placeholder="기업명 / 채용공고명" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
							<button type="button" id="searchBtn">
								<i class="fa fa-search"></i>
							</button>
							<input type="hidden" id="oldTxt" value="${param.searchTxt}" /> <input
								type="hidden" name="page" id="page" value="${page}" /> <input
								type="hidden" name="no" id="no" />

						

					</div>
					<!-- 검색 -->
					<!-- 메인컨텐츠 -->
					<div class="main_section">
						
							<div>
								공고일 / 마감일 : 공고일
								<input type="text" id="startDate" name="startDate" class="date_picker" /> 
								~
								마감일
								<input type="text" id="endDate" name="endDate" class="date_picker" />
							</div>
							<div>
								<!-- <span>직종분류 :</span> 
								<select name="fst_cate" id="fst_cate">
									<option value="fst_cate1">1차 분류</option>
								</select> <select name="scd_cate" id="scd_cate">
									<option value="scd_cate1">2차 분류</option>
								</select> <select name="trd_cate" id="trd_cate">
									<option value="trd_cate1">3차 분류</option>
								</select> -->
								<div class="job">
                                            <span class="text">직종 : </span>
                                            <input type="hidden" name="sectorNo" id="sectorNo" value="${DATA.SECTOR_NO}">
                                            <input type="text" class="input_box" id="sectorInput" name="sName" sNo="${DATA.SECTOR_NO}" value="직종검색"  readonly/>
                                            <input type="button" id="sectorBtn" btn="s" value="직종검색" />
                                            <input type="button" id="resetBtn"  value="초기화" />
                                            
								</div>
							</div>
							<div class="location">
	                            <span class="text">근무지역 : </span>
	                            <div class="input">
	                                <div class="locSelectBox">
	                                    <select class="citySel" id="city0" name="city" locResumNo="0" selValue="${DATA.CITY_NO }">
	                                        <option value="-1" >시도 선택</option>
	                                        <option value="16" selected="selected">전체</option>
	                                        <option value="0">강원</option>
	                                        <option value="1">경기</option>
	                                        <option value="2">경남</option>
	                                        <option value="3">경북</option>
	                                        <option value="4">광주</option>
	                                        <option value="5">대구</option>
	                                        <option value="6">대전</option>
	                                        <option value="7">부산</option>
	                                        <option value="8">서울</option>
	                                        <option value="9">울산</option>
	                                        <option value="10">인천</option>
	                                        <option value="11">전남</option>
	                                        <option value="12">전북</option>
	                                        <option value="13">제주</option>
	                                        <option value="14">충남</option>
	                                        <option value="15">충북</option>
	                                    </select>
	                                    <select id="region0" name="region" selValue="${DATA.REGION_NO }">
	
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
							<div class="sal">
								<span>급여(월급) :</span>
								<div class="input">
									<label for="sal2">전체</label> 
									<input type="radio" name="sal" value="2" id="sal2" checked="checked">
									<label for="sal0">내규</label> 
									<input type="radio" name="sal" value="0" id="sal0"> 
									<label for="sal1">일반</label> 
									<input type="radio" name="sal" value="1" id="sal1"> 
									<input type="text" placeholder="최저금액" name="minSal" id="minSal" disabled>만원 ~ 
									<input type="text" placeholder="최대금액" name="maxSal" id="maxSal" disabled>만원
								</div>
							</div>
							<div class="career">
								<span>경력 :</span>
								<div class="input">
									<label> 전체 
									<input type="radio" name="carr" id="career4" class="radiobox" value="4" checked="checked"/>
									</label> 
									<label> 무관 
									<input type="radio" name="carr" id="career0" class="radiobox" value="0" />
									</label> 
									<label> / 신입 
										<input type="radio" name="carr" id="career1" class="radiobox" value="1" />
									</label> 
									<label> / 경력 
										<input type="radio" name="carr" id="career2" class="radiobox" value="2" />
									</label> 
									<input type="text" class="input_box" placeholder="0" name="minCareer" id="minCareer" disabled class="year_input"> 년 ~ 
									<input type="text" class="input_box" placeholder="10" name="maxCareer"  id="maxCareer" disabled class="year_input"> 년
								</div>
							</div>
							<div>
								<span>고용형태 :</span>
								<label> 전체 <input type="radio" name="empGbn" class="radiobox" value="4" checked="checked"/></label>
								<label> /정규직 <input type="radio" name="empGbn" class="radiobox" value="0" /></label>
								<label> / 계약직 <input type="radio" name="empGbn" class="radiobox" value="1" /> </label> 
								<label> / 시간제 <input type="radio" name="empGbn" class="radiobox" value="2" /></label> 
								<label> / 기타 <input type="radio" name="empGbn" class="radiobox" value="3" /></label>
							</div>
						

					</div>
					<div id="more">
						
							<input type="hidden" id="actGbn" name="actGbn">
							<div>
								<span>최종학력 :</span> 
								<label> 전체 <input type="radio" name="gradu" class="radiobox" value="6" checked="checked"/></label>
								<label> /무관 <input type="radio" name="gradu" class="radiobox" value="0" /></label>
								<label> / 고등학교 <input type="radio" name="gradu" class="radiobox" value="1" /> </label> 
								<label> / 전문대학 <input type="radio" name="gradu" class="radiobox" value="2" /></label>
								<label> / 대학교 <input type="radio" name="gradu" class="radiobox" value="3" /></label> 
								<label> / 석사 <input type="radio" name="gradu" class="radiobox" value="4" /> </label> 
								<label> / 박사 <input type="radio" name="gradu" class="radiobox" value="5" /></label>
							</div>
							<div class="lisence_box">
								<!-- <input type="button" class="minus_btn" id="delBtn" value="－"> -->
								<span>자격증 :</span>
								<!-- 자격증 검색 api 팝업창 -->
								<div class="add_box">
									<input type="button" id="qualSchBtn"  btn="q" value="자격증 검색">
									<!-- <input type="button" class="plus_btn" id="addBtn1" value="＋"> -->
								</div>
				

							</div>

					</div>
					<button type="button" onclick="moreBtn()" id="img_btn">
						<img src="resources/images/empsch/down.png" alt="down" id="icon">
					</button>
					<!-- Portfolio Gallery Grid -->
					<div class="card_list  ">

						<div class="card_list_char">
							<h2>
								검색 리스트
							</h2>
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
		</div>
	</main>
	<%@include file="/resources/jsp/footer.jsp"%>

	<script type="text/javascript"
		src="resources/script/empsch/Employ_search.js"></script>
	<script type="text/javascript" src="resources/script/empsch/header.js"></script>
	<script type="text/javascript"
		src="resources/script/empsch/DatePicker.js"></script>
	<script type="text/javascript" src="resources/script/empsch/qualsch.js"></script>
	<script type="text/javascript" src="resources/script/empsch/sectorsch.js"></script>

</body>
</html>