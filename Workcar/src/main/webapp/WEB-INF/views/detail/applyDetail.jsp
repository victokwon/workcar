
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

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
   <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5a7222e84f43da6e7dad790c0611a4f&libraries=services"></script> -->
    <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ccb33b4781aed7d9d9321c853fa3055&libraries=services"></script> 
   	
	<script type="text/javascript"
	src="resources\script\detail\ReportPop.js"></script>	
	<link rel="stylesheet" type="text/css"
   href="resources\css\manage\Report.css">
	<link rel="stylesheet" type="text/css"
   href="resources\css\manage\pop.css">		
   	
	<script>
	 $(function () {
		 $("#goList").on("click",function(){
			 $("#empListForm").attr("action", "EmploySearchList")
			 $("#empListForm").submit()
		 })
	 /* 	 $("#cNameBox").on("click", function(){
			 let corpNo = $(this).attr("cNo")
			 $("#corpNo").val(corpNo)
			 $("#empListForm").attr("action", "corDetail")
			 $("#empListForm").submit()
		 })  */
		 $(".star_rating").each(function(idx){
				let score = $(this).attr("score")
					html = ''
				for(let i = 0; i<Math.round(score); i++){
					html+= '	    <span class="fa fa-star checked"></span>             '
				}
				for(let i = 0; i<5-Math.round(score); i++){
					html+= '	    <span class="fa fa-star"></span>             '
				}
				$(this).html(html)
			})

	 });
		 function linkGo(url){
		 		location.href = url
		 	}
	</script>

	
	
</head>
<body>
<div class="pop_wrap">
	<div class="pop-container1"></div> 
</div>
	
	<input type="hidden" id="userNo" no=${sMNo }>
	<%@include file="/resources/jsp/header.jsp"%>	
	
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
                            <tr rNo="X">
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                                <th class='td_date'>최종수정일</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" >
                        	<tr rNo="X">
                        		<td class='td_no'></td>
                        		<td class='td_name'>지원가능한 이력서가 없습니다.</td>
                        		<td class='td_date'></td>
                        	</tr>
                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="paging_wrap"></div>
                <div class="pop-input">
               		<div class="text_box"></div>
                    <input type="button" class="sch-btn" id="applyBtn" rNo="" eNo="" value="지원하기">
                </div>
            </div>
        </div>
    </div>
	
    <main class="main">
    
   
   <form action="#" id="empListForm" method="post">
   		<input type="hidden" id="memNo" name="memNo" value="${sMNo }">
      	<input type="hidden" id="page" name="page" value="${param.page}">
      	<input type="hidden" id="corpNo" name="corpno" value="">
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
	                              <div class="input" id="cNameBox" cname="${applyinfo.C_NAME}" cNo="${applyinfo.CORP_NO}"><b>${applyinfo.C_NAME}</b></div>
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
                    <div class="apply_dtl">
                    ${fn:replace(applyinfo.DTL, '.', '.<br>')}
                    </div>
                </div>
					<div class="main_rating">
						<h3>총 평점</h3>
						<div class="star_rating total_rating" score="${rating.TOTAL }">
						</div>
					</div>
					<div class="main_rating">
						<h3>업무와 삶의 균형</h3>
						<div class="star_rating work_rating" score="${rating.WLB }">
						</div>
					</div>
					<div class="main_rating">
						<h3>승진기회 및 가능성</h3>
						<div class="star_rating promotion_rating" score="${rating.PROMO_POSS }">
						</div>
					</div>
					<div class="main_rating">
						<h3>사내문화</h3>
						<div class="star_rating culture_rating" score="${rating.C_CULT }">
						</div>
					</div>
					<div class="main_rating">
						<h3>복지 및 급여</h3>
						<div class="star_rating welfare_rating" score="${rating.WFARE_PAY }">
						</div>
					</div>
					<div class="main_rating">
						<h3>경영진</h3>
						<div class="star_rating management_rating" score="${rating.MGM }">
						</div>
					</div>
            </div>
        </div>
        </div>
        <hr>
        <div class="right_main_menu">
        	<c:if test="${sMTy eq 0 }">
            	<button class="right_main_apply" id="popOpen" eNo="${param.empno}">지원하기</button>
            	<button class="main_detail_repport" id="dclBtn">채용정보신고</button>
        	</c:if>
        	
            <p> 담당자 정보</p>
            <p> 성명 : ${applyinfo.NAME}</p>
            <p> 직책 : ${applyinfo.POS}</p>
            <p> 연락처 : ${applyinfo.PHONE}</p>
            <p> 이메일 : ${applyinfo.EMAIL}</p>
            <p> 회사 위치 : ${applyinfo.ADDR} ${applyinfo.ADDR_DTL}</p>
            
            <div id="map" style="width: 100%; height: 350px;"></div>
							<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									'${applyinfo.ADDR}',
									function(result, status) {

										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">${applyinfo.C_NAME}</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
					
				</script>
        </div>
    </main>
    <%@include file="/resources/jsp/footer.jsp"%>
	
</body>
</html>