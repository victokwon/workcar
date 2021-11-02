
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/detail/footer.css">
    <link rel="stylesheet" href="resources/css/common/default.css">
	<link rel="stylesheet" href="resources/css/common/header.css">
	<link rel="stylesheet" href="resources/css/detail/detailApply.css">
	<link rel="stylesheet" href="resources/css/common/sidebar.css">
	<link rel="stylesheet" href="resources/css/detail/paging.css">
	<link rel="stylesheet" type="text/css" href="resources\css\detail\pop.css">

      <!-- Add icon library -->
      <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="resources\script\detail\resumeApply.js"></script>
    <script src="resources/script/detail/header.js"></script>
    <script type="text/javascript" src="resources/script/detail/apply_dtl_paging.js"></script>
   	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5a7222e84f43da6e7dad790c0611a4f&libraries=services"></script>
   	
	<script type="text/javascript"
	src="resources\script\detail\ReportPop.js"></script>	
	<link rel="stylesheet" type="text/css"
   href="resources\css\manage\Report.css">
	<link rel="stylesheet" type="text/css"
   href="resources\css\manage\pop.css">		
   	
	<script type="text/javascript">

	</script>
	<script>
	 $(function () {
		 $("#goList").on("click",function(){
			 $("#empListForm").attr("action", "EmploySearchList")
			 $("#empListForm").submit()
		 })
	/* 	 $(".cNameBox").on("click", function(){
			 $("#")
			 $("#empListForm").attr("action", "applyDetail")
			 $("#empListForm").submit()
		 }) */
		
		var mapContainer = document.getElementById("map"), // 지도를 표시할 div
		  mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3,
		    // 지도의 확대 레벨
		  };
		// 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(
		  "${applyinfo.ADDR} ${applyinfo.ADDR_DTL}",
		  function (result, status) {
		    // 정상적으로 검색이 완료됐으면
		    if (status === kakao.maps.services.Status.OK) {
		      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		      // 결과값으로 받은 위치를 마커로 표시합니다
		      var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords,
		      });
		      // 인포윈도우로 장소에 대한 설명을 표시합니다
		      var infowindow = new kakao.maps.InfoWindow({
		        content:
		          '<div style="width:150px;text-align:center;padding:6px 0;">${applyinfo.C_NAME}</div>',
		      });
		      infowindow.open(map, marker);
		      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		      map.setCenter(coords);
		    }
		  }
		)
	}) 
		 function linkGo(url){
		 		location.href = url
		 	}
	</script>
	
	
</head>
<body>
<div class="pop_wrap">
	<div class="pop-container1"></div> 
</div>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo('EmploySearchList')">채용정보</div>
				<li onclick="linkGo(#)">통합검색</li>
				<li onclick="linkGo(#)">조회수 100</li>
				<li onclick="linkGo(#)">평점 100</li>
			</ul> 
			<ul>
				<div onclick="linkGo(#)">기업정보</div>
				<li onclick="linkGo(#)">통합검색</li>
			</ul>
			<ul>
				<div onclick="linkGo(#)">인재정보</div>
				<li onclick="linkGo(#)">통합검색</li>
			</ul>
			<ul>
				<div onclick="linkGo('mainSpace')">참여공간</div>
				<li onclick="linkGo('ntcSpaceABList')">공지사항</li>
				<li onclick="linkGo('quesSpace')">자주하는 질문</li>
			</ul>
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<ul>
						<div onclick="linkGo(#)">마이페이지</div>
						<li onclick="linkGo(#)">계정관리</li>
						<li onclick="linkGo(#)">이력서관리</li>
						<li onclick="linkGo(#)">활동내역</li>
						<li onclick="linkGo(#)">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<ul>
						<div onclick="linkGo(#)">마이페이지</div>
						<li onclick="linkGo(#)">계정관리</li>
						<li onclick="linkGo(#)">채용공고</li>
						<li onclick="linkGo(#)">활동내역</li>
						<li onclick="linkGo(#)">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<ul>
						<div onclick="linkGo('manageRegist')">마이페이지</div>
						<li onclick="linkGo('manageRegist')">계정관리</li>
						<li onclick="linkGo('manageMemberList)">회원관리</li>
						<li onclick="linkGo('manageReport')">신고관리</li>
						<li onclick="linkGo('manageStar)">평점관리</li>
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

			<c:choose>
				<c:when test="${sMTy eq 0}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#iMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong id="userNo" no=${sMNo } name=${sMNm }>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="#cMemMypage"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong id="userNo" no=${sMNo } name=${sMNm }>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
					</div>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<div class="topnav-right">
						<div class="alarm"></div>
						<a href="manageRegi"><strong>마이페이지</strong></a>
						<div class="profile"></div>
						<strong id="userNo" no=${sMNo } name=${sMNm }>${sMNm }님</strong> <a href="logout"><strong>로그아웃</strong></a>
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
	
	<div class="pop-container apply_detail">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1>이력서 리스트</h1>
                </div>
                <!-- 5개 리스트 -->
                <div class="list_wrap">
                    <table>
                        <thead>
                            <tr rNo="다시 선택">
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                                <th class='td_date'>최종수정일</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" >
                        	<tr rNo="1">
                        		<td class='td_no'></td>
                        		<td class='td_name'></td>
                        		<td class='td_date'></td>
                        	</tr>
                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="paging_wrap"></div>
                <div class="pop-input">
               		<div class="text_box"></div>
                    <input type="button" class="sch-btn" id="applyBtn" rNo="" eNo="" value="요청하기">
                </div>
            </div>
        </div>
    </div>
	
    <main class="main">
    
   
   <form action="#" id="empListForm" method="post">
   		<input type="hidden" id="memNo" name="memNo" value="${sMNo }">
      	<input type="hidden" id="page" name="page" value="${param.page}">
      	<input type="hidden" id="empNo" name="empno" value="${param.empno }">
   		<input type="hidden" id="empNo" name="empno" value="${param.empno }">
		<input type="hidden" id="sectorNo" name="sectorNo" value="${param.sectorNo }">
		<input type="hidden" id="startDate" name="startDate" value="${param.startDate }">
		<input type="hidden" id="endDate" name="endDate" value="${param.endDate }">
		<input type="hidden" id="region" name="region" value="${param.region }">
		<input type="hidden" id="empGbn" name="empGbn" value="${param.empGbn }">
		<input type="hidden" id="gradu" name="gradu" value="${param.gradu }">
		<input type="hidden" id="minCareer" name="minCareer" value="${param.minCareer }">
		<input type="hidden" id="maxCareer" name="maxCareer" value="${param.maxCareer }">
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt }">
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn }">
		<input type="hidden" id="sal" name="sal" value="${param.sal }">
		<input type="hidden" id="minSal" name="minSal" value="${param.minSal }">
		<input type="hidden" id="maxSal" name="maxSal" value="${param.maxSal }">
		<input type="hidden" id="carr" name="carr" value="${param.carr }">
		<input type="hidden" id="minCareer" name="minCareer" value="${param.minCareer }">
		<input type="hidden" id="maxCareer" name="maxCareer" value="${param.maxCareer }">
		<input type="hidden" id="qualno" name="qualno" value="${qualno }">
   </form>
   
        <div class="left_main_menu">
            <div class="vertical-menu">
                <a href="#" class="active" id="goList">list</a>
                <div >
                	<table class="mySlides">
                		
                	</table>
                </div>
            </div>
            <div class="page1">

            </div>
        </div>
        <hr>
        <div class="main_profile">
            <div class="main_profile_div">
                <div class="main_title">
                    <h1 id="empTitle" title="${applyinfo.EMP_TITLE}">${applyinfo.EMP_TITLE} / ${applyinfo.D_DAY}</h1>
                </div>
                <div class="emp_date">
                	공고일: ${applyinfo.REG_DATE }<br>
                	마감일: ${applyinfo.DLINE }
                </div>
            </div>
            <div>
                <div class="main_detail_1">
            	        <div class="input_box">
                           <div class="c_name">
	                              <div class="text"><b>기업명</b></div>
	                              <div class="input" id="cNameBox" cname="${applyinfo.C_NAME}" cno="${applyinfo.CORP_NO}"><b>${applyinfo.C_NAME}</b></div>
                           </div>
                           <div class="sector">
	                              <div class="text">직종</div>
	                              <div class="input">${applyinfo.SECTOR_NAME}</div>
                           </div>
                           <div class="gradu">
	                              <div class="text">학력</div>
	                              <div class="input">${applyinfo.GRADU}</div>
                           </div>
                           <div class="carr">
	                              <div class="text">경력</div>
	                              <div class="input">
		                              	${applyinfo.CARR} 
		                              	<c:if test="${applyinfo.CARR eq '경력' }">[ ${applyinfo.CARR_Y }년]</c:if> 
                              	  </div>
                           </div>
                           <div class="work">
	                              <div class="text">고용형태</div>
	                              <div class="input"> ${applyinfo.EMP_GBN}</div>
                           </div>
                           <div class="sal">
	                              <div class="text">급여</div>
	                              <div class="input">  [${applyinfo.PAY_GBN}] 월 ${applyinfo.PAY_LOW} 만원 ~ ${applyinfo.PAY_HIGH} 만원</div>
                           </div>
                           <div class="qual">
	                              <div class="text">자격증</div>
	                              <div class="input">
										<c:forEach var="data" items="${qualList }">
											[&nbsp;${data.QUAL_NAME }&nbsp;] <br>
										</c:forEach>
								  </div>
                           </div>
                </div>
                <br>
                <hr>
                <div class="main_detail_2">
                    <textarea class="apply_dtl" disabled="disabled">${applyinfo.DTL }</textarea>
                </div>
				<script>
					
						$(function () {
						    		for (var i=1; i<=  ${rating.TOTAL}; i++) { 
						    		$(".total_rating"+i).addClass("checked");
						    		}
						    		
						    		for (var i=1; i<=  ${rating.WLB}; i++) { 
							    	$(".work_rating"+i).addClass("checked");
							    	}
						    		for (var i=1; i<=  ${rating.PROMO}; i++) { 
							    	$(".promotion_rating"+i).addClass("checked");
							    	}
						    		for (var i=1; i<=  ${rating.CULTURE}; i++) { 
							    		$(".culture_rating"+i).addClass("checked");
							    		}
						    		for (var i=1; i<=  ${rating.WFARE}; i++) { 
							    		$(".welfare_rating"+i).addClass("checked");
							    		}
						    		for (var i=1; i<=  ${rating.MGM}; i++) { 
							    		$(".management_rating"+i).addClass("checked");
							    		}
						});
					</script>
					<div class="main_rating">
						<h3>총 평점</h3>
						<div class="star_rating total_rating">
							<span class="fa fa-star total_rating1"></span>
							<span class="fa fa-star total_rating2"></span>
							<span class="fa fa-star total_rating3"></span> 
							<span class="fa fa-star total_rating4"></span>
							<span class="fa fa-star total_rating5"></span>
							<span> ${rating.TOTAL}</span>
						</div>
					</div>
					<div class="main_rating">
						<h3>업무와 삶의 균형</h3>
						<div class="star_rating work_rating">
							<span class="fa fa-star work_rating1 "></span>
							<span class="fa fa-star work_rating2"></span>
							<span class="fa fa-star work_rating3"></span> 
							<span class="fa fa-star work_rating4"></span>
							<span class="fa fa-star work_rating5"></span>
							<span> ${rating.WLB}</span>
						</div>
					</div>
					<div class="main_rating">
						<h3>승진기회 및 가능성</h3>
						<div class="star_rating promotion_rating">
							<span class="fa fa-star promotion_rating1 "></span>
							<span class="fa fa-star promotion_rating2"></span>
							<span class="fa fa-star promotion_rating3"></span> 
							<span class="fa fa-star promotion_rating4"></span>
							<span class="fa fa-star promotion_rating5"></span>
							<span> ${rating.PROMO}</span>
						</div>
					</div>
					<div class="main_rating">
						<h3>사내문화</h3>
						<div class="star_rating culture_rating">
							<span class="fa fa-star culture_rating1 "></span>
							<span class="fa fa-star culture_rating2"></span>
							<span class="fa fa-star culture_rating3"></span> 
							<span class="fa fa-star culture_rating4"></span>
							<span class="fa fa-star culture_rating5"></span>
							<span> ${rating.CULTURE}</span>
						</div>
					</div>
					<div class="main_rating">
						<h3>복지 및 급여</h3>
						<div class="star_rating welfare_rating">
							<span class="fa fa-star welfare_rating1 "></span>
							<span class="fa fa-star welfare_rating2"></span>
							<span class="fa fa-star welfare_rating3"></span> 
							<span class="fa fa-star welfare_rating4"></span>
							<span class="fa fa-star welfare_rating5"></span>
							<span> ${rating.WFARE}</span>
						</div>
					</div>
					<div class="main_rating">
						<h3>경영진</h3>
						<div class="star_rating management_rating">
							<span class="fa fa-star management_rating1 "></span>
							<span class="fa fa-star management_rating2"></span>
							<span class="fa fa-star management_rating3"></span> 
							<span class="fa fa-star management_rating4"></span>
							<span class="fa fa-star management_rating5"></span>
							<span> ${rating.MGM}</span>
						</div>
					</div>
            </div>
        </div>
        </div>
        <hr>
        <div class="right_main_menu">
        	<c:if test="${sMTy eq 0 }">
            	<button class="right_main_apply" id="popOpen">지원하기</button>
            	<button class="main_detail_repport" id="dclBtn">채용정보신고</button>
        	</c:if>
        	
            <p> 담당자 정보</p>
            <p> 성명 : ${applyinfo.NAME}</p>
            <p> 직책 : ${applyinfo.POS}</p>
            <p> 연락처 : ${applyinfo.PHONE}</p>
            <p> 이메일 : ${applyinfo.EMAIL}</p>
            <p> 회사 위치 : ${applyinfo.ADDR} ${applyinfo.ADDR_DTL}</p>
            
            <div id="map" style="width: 100%; height: 350px;"></div>

        </div>
    </main>
    
	<footer>
		<!-- 링크작업 -->
		<div class="inner_content">
			<div id="ntc" onclick="linkGo'ntcSpaceABList'">공지사항</div>
			<div id="pvc" onclick="linkGo'mainSpace'">참여공간</div>
			<div id="pvc" onclick="linkGo'quesSpace'">자주하는질문</div>
			<div id="tou" onclick="linkGo'mainSpace'">이용약관</div>
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
</body>
</html>