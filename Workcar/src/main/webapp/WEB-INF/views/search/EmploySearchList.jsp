<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css">
<link rel="stylesheet" type="text/css" href="resources/css/empsch/Employ_search.css">
<link rel="stylesheet" type="text/css" href="resources/css/empsch/paging.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
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
	 
	 /* $("#actionForm").attr("action","testAB"); */
	 $("#actionForm").submit();
	 //눌렀을때 번호를 저장하고 그것에 따라 상세보기에 보내겠다.
	});
});
//데이터 취득
function reloadList(){
	var params1 = $("#actionForm1").serialize();
 	var params2 = $("#actionForm2").serialize();
	var params3 = $("#actionForm3").serialize();
	
	$.ajax({
		url : "EmploySearchListAjax",
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
		html += "<img src=\"resources/images/common/logo.png\" />     ";
			if(data.CORP_IMG != null){
				"<img src=\"resources/images/upload/" + data.CORP_IMG + ".png\" />     ";				
			}
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
        <div class="main_wrap">
            <div class="main_button_box">
                <button class="main_button" onclick="openPage('main_search', this, '#88a2f2')" id="defaultOpen">통합
                    검색</button>
                <button class="main_button" onclick="openPage('main_hits', this,'#88a2f2')">조회수 100</button>
                <button class="main_button" onclick="openPage('main_garde', this,'#88a2f2')">평점 100</button>
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
                           <button type="button" id="searchBtn"><i class="fa fa-search"></i></button>
                           <input type="hidden" id="oldTxt" value="${param.searchTxt}" />
                           <input type="hidden" name="page"  id="page" value="${page}" />
                           <input type="hidden" name="no" id="no" />
                           
						</form>
                       
                    </div>
                    <!-- 검색 -->
                    <!-- 메인컨텐츠 -->
                    <div class="main_section">
                        <form action="#" id="actionForm2" method="post">
                        	<div>
	                            <span>공고일 / 마감일 :</span>
	                            <span>공고일</span>
	                            <select name="start_date" id="start_date">
	                                <option value="start_date1">날짜선택</option>
	                            </select>
	                            <span>~</span>
	                            <span>마감일</span>
	                            <select name="closing_date" id="closing_date">
	                                <option value="closing_date1">날짜선택</option>
	                            </select>
                        	</div>
                            <div>
	                            <span>직종분류 :</span>
	                            <select name="fst_cate" id="fst_cate">
	                                <option value="fst_cate1">1차 분류</option>
	                            </select>
	                            <select name="scd_cate" id="scd_cate">
	                                <option value="scd_cate1">2차 분류</option>
	                            </select>
	                            <select name="trd_cate" id="trd_cate">
	                                <option value="trd_cate1">3차 분류</option>
	                            </select>
                            </div>
                            <div>
	                            <span>근무지역 :</span>
	                            <select name="bic_city" id="bic_city">
	                                <option value="city1">도/광역시</option>
	                            </select>
	                            <select name="city_fst" id="city_fst">
	                                <option value="city_fst1">시/군/구</option>
	                            </select>
	                            <select name="city_scd" id="city_scd">
	                                <option value="city_scd">시/군/구</option>
	                            </select>
	                            <select name="city_trd" id="city_trd">
	                                <option value="city_trd1">시/군/구</option>
	                            </select>
                            </div>                        
                        	<div class="sal">
	                            <span>급여(월급) :</span>
	                            <div class="input">
	                            	<label for="sal0">내규</label>
	                                <input type="radio" name="sal" value="0" id="sal0">
	                                <label for="sal1">일반</label>
	                                <input type="radio" name="sal" value="1" id="sal1">
	                                <input type="text" placeholder="최저금액" id="minSal" disabled>만원 ~
	                                <input type="text" placeholder="최대금액" id="maxSal" disabled>만원
                            	</div>
                        	</div>
                        	<div class="career">
	                            <span>경력 :</span>
	                            <div class="input">
		                            <label> 전체 <input type="radio" name="carr" id="career0" class="radiobox" value="0" /></label>
		                            <label> / 신입 <input type="radio" name="carr" id="career1" class="radiobox" value="1" /></label>
		                            <label> / 경력 <input type="radio" name="carr" id="career2" class="radiobox" value="2" /></label>
		                            <input type="text" class="input_box" placeholder="0" id="minCareer" disabled class="year_input"> 년 ~
		                            <input type="text" class="input_box" placeholder="10" id="maxCareer" disabled class="year_input"> 년
	                            </div>
                        	</div>
                        	<div>
	                            <span>고용형태 :</span>
	                            <label>  정규직 <input type="radio" name="emp" class="radiobox"value="0" /></label>
	                            <label> / 계약직 <input type="radio" name="emp" class="radiobox" value="1" /></label>
	                            <label> / 시간제 <input type="radio" name="emp" class="radiobox" value="2" /></label>
	                            <label> / 기타 <input type="radio" name="emp" class="radiobox" value="3" /></label>
                        	</div>
                        </form>

                    </div>
                    <div id="more">
                    	<form action="#" id="actionForm3" method="post">
                    		<div>
	                            <span>최종학력 :</span>
	                            <label> 전체 <input type="radio" name="gradu" class="radiobox" value="0" /></label>
	                            <label> / 고등학교 <input type="radio" name="gradu" class="radiobox"value="1" /></label>
	                            <label> / 전문대학 <input type="radio" name="gradu" class="radiobox" value="2" /></label>
	                            <label> / 대학교 <input type="radio" name="gradu" class="radiobox" value="3" /></label>
	                            <label> / 석사 <input type="radio" name="gradu" class="radiobox" value="4" /></label>
	                            <label> / 박사 <input type="radio" name="gradu" class="radiobox" value="5" /></label>
                    		</div>
                        	<div class="lisence_box">
	                            <!-- <input type="button" class="minus_btn" id="delBtn" value="－"> -->
	                            <span>자격증 :</span>
                                        <input type="text" class="input_box" placeholder="자격증">
                                        <!-- 자격증 검색 api 팝업창 -->
                                        <input type="button" class="" id="lisenceSchBtn" value="자격증 검색">
                                        <input type="text" class="input_box" value="데이터 / 자격증명" readonly>
                                    <input type="button" class="plus_btn" id="addBtn1" value="＋">
                        	</div>
                        </form>
	
                    </div>
                    <button onclick="moreBtn()" id="img_btn"><img src="resources/images/empsch/down.png" alt="down" id="icon"></button>
                    <!-- Portfolio Gallery Grid -->
                    <div class="card_list  ">
                    	
                        <div class="card_list_char">
                            <h2>검색 리스트</h3>
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
	                    <div class="page">
	                    </div>
                    </div>

                    
                </div>





                <div id="main_hits" class="main_content">
                    <div class="main_margin"></div>
                    <div class="main_section">
                        <div class="vertical_menu">
                            <a href="#">
                                <div class="apply_content">지원자</div>
                            </a>
                            <a href="#">
                                <div class="apply_content">지원자</div>
                            </a>
                        </div>
                        <div class="main_box">
                        </div>
                    </div>
                </div>

                <div id="main_garde" class="main_content">
                    <div class="main_margin"></div>
                    <div class="main_section">
                        <div class="vertical_menu">
                            <a href="#">개인정보 설정</a>
                            <a href="#">비밀번호 변경</a>
                        </div>
                        <div class="main_regi_contents">
                            <h3>Contact</h3>
                            <p>Get in touch, or swing by for a cup of coffee.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </main>
    <footer>
        <div class="inner_content">
            <div><b>공지사항</b></div>
            <div>참여마당</div>
            <div>개인정보처리방침</div>
            <div>이용약관</div>
        </div>
        <h2>Coding is too hard </h2>
        <p>please make it complete within the time frame</p>
    </footer>
    
	<script type="text/javascript" src="resources/script/empsch/Employ_search.js"></script>
	<script type="text/javascript" src="resources/script/empsch/header.js"></script>
</body>
</html>