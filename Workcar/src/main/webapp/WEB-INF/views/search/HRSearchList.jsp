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
	href="resources/css/hrsch/HRsearch.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/hrsch/paging.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/empsch/qualsch.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>


<script type="text/javascript">

$(document).ready(function(){
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
	 $("#actionForm").submit();
	 //눌렀을때 번호를 저장하고 그것에 따라 상세보기에 보내겠다.
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
	var params1 = $("#actionForm1").serialize();
 	var params2 = $("#actionForm2").serialize();
	var params3 = $("#actionForm3").serialize();
	
	$.ajax({
		url : "HRSearchListAjax",
		type : "post",
		dataType : "json",
		data : params1+"&"+params2+"&"+params3,
		success : function(res){
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request,status,error){
			console.log(error);
		}
	});
}
//목록 그리기
function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<td class=\"column\">";
		html += "<div class=\"content\">";
		html += "<div>"+ data.EMP_NO +"</div>";
		html += "<h3>" + data.C_NAME + "</h3>"; 
		html += "<span>" + data.EMP_TITLE + "</span>";
		html += "</div>";
		html += "</td>";
	}
	
	$(".row").html(html);
}
function drawPaging(pb) {
	var html = "";
	/* html += "<span page=\"1\">처음</span>      "; */
	
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
			<div class="main_h1_box">
                <h1 class="main_h1">인재검색</h1>
            </div>
			
			<div class="main_info">
				<div id="main_search" class="main_content">
					<div class="search_top">
						<form action="#" id="actionForm1" method="post" class="tab_search_btn">
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

						</form>

					</div>
					<!-- 검색 -->
					<!-- 메인컨텐츠 -->
					<div class="main_section">
						<form action="#" id="actionForm2" method="post">
							
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
                                            <span class="text">희망직종 : </span>
                                            <input type="hidden" name="sectorNo" id="sectorNo" value="${DATA.SECTOR_NO}">
                                            <input type="text" class="input_box" id="sectorInput" name="sName" sNo="${DATA.SECTOR_NO}" value="직종검색"  readonly/>
                                            <input type="button" id="sectorBtn" btn="s" value="직종검색" />
                                            <input type="button" id="resetBtn"  value="초기화" />
                                            
								</div>
							</div>
							<div class="location">
	                            <span class="text">희망근무지역 : </span>
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
								<span>희망임금(월급) :</span>
								<div class="input">
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
									<label> 무관 <input type="radio" name="carr" id="career0" class="radiobox" value="0" /></label> 
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
								<span>희망근무형태 :</span>
								
								<label> 정규직 <input type="radio" name="empGbn" class="radiobox" value="0" /></label>
								<label> / 계약직 <input type="radio" name="empGbn" class="radiobox" value="1" /> </label> 
								<label> / 시간제 <input type="radio" name="empGbn" class="radiobox" value="2" /></label> 
								
							</div>
						</form>

					</div>
					<div id="more">
						<form action="#" id="actionForm3" method="post">
							<input type="hidden" id="actGbn" name="actGbn">
							<div>
								<span>최종학력 :</span> 
								<label> 전체 <input type="radio" name="gradu" class="radiobox" value="0" /></label>
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
						</form>

					</div>
					<button onclick="moreBtn()" id="img_btn">
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
								<tbody>
									<tr class="row"></tr>
								</tbody>
							</table>
						</div>
						<!-- 페이징 -->
						<div class="page"></div>
					</div>
				</div>


			</div>
		</div>
		</div>
	</main>
	<footer>
		<div class="inner_content">
			<div>
				<b>공지사항</b>
			</div>
			<div>참여마당</div>
			<div>개인정보처리방침</div>
			<div>이용약관</div>
		</div>
		<h2>Coding is too hard</h2>
		<p>please make it complete within the time frame</p>
	</footer>

	<script type="text/javascript"
		src="resources/script/hrsch/hr_search.js"></script>
	<script type="text/javascript" src="resources/script/empsch/header.js"></script>

	<script type="text/javascript" src="resources/script/hrsch/qualsch.js"></script>
	<script type="text/javascript" src="resources/script/hrsch/sectorsch.js"></script>

</body>
</html>