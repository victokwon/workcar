<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/common/main.css">
    <link rel="stylesheet" href="resources/css/detail/footer.css">
    <link rel="stylesheet" href="resources/css/common/default.css">
	<link rel="stylesheet" href="resources/css/detail/header.css">
	<link rel="stylesheet" href="resources/css/detail/detailApply.css">
	<link rel="stylesheet" href="resources/css/detail/sidebar.css">
	<link rel="stylesheet" href="resources/css/detail/paging.css">

    <link rel="stylesheet" href="resources/css/detail/Apply_Resources_Detail.css">
      <!-- Add icon library -->
      <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
    <script src="resources/script/detail/header.js"></script>
    <script type="text/javascript" src="resources/script/detail/apply_dtl_paging.js"></script>
    	<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ccb33b4781aed7d9d9321c853fa3055&libraries=services"></script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}">
		<input type="hidden" id="eNo" name="eNo" value="">
		<input type="hidden" id="cRNo" name="cRNo" value=""> 
	</form>
	<div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div id="sdienav_ul">
            <ul>
                <div>채용정보</div>
                <li>통합검색</li>
                <li>조회수 100</li>
                <li>평점 100</li>
            </ul>

            <ul>
                <div>기업정보</div>
                <li>통합검색</li>
            </ul>
            <ul>
                <div>인재정보</div>
                <li>통합검색</li>
            </ul>
            <ul>
                <div>참여공간</div>
                <li>공지사항</li>
                <li>자주하는 질문</li>
            </ul>
        </div>
    </div>
    <div class="side_bcc" id="side_bcc"></div>

            <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div id="sdienav_ul">
            <ul>
                <div>채용정보</div>
                <li>통합검색</li>
                <li>조회수 100</li>
                <li>평점 100</li>
            </ul>

            <ul>
                <div>기업정보</div>
                <li>통합검색</li>
            </ul>
            <ul>
                <div>인재정보</div>
                <li>통합검색</li>
            </ul>
            <ul>
                <div>참여공간</div>
                <li>공지사항</li>
                <li>자주하는 질문</li>
            </ul>
        </div>
    </div>
    <div class="side_bcc" id="side_bcc"></div>

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
    <main class="main">
        <div class="left_main_menu">
            <div class="vertical-menu">
                <a href="#" class="active">Home</a>
                <div class="mySlides">

                </div>
            </div>
            <div class="page1">

            </div>
        </div>
        <hr>
        <div class="main_profile">
            <div class="main_profile_div">
                <div class="main_title">
                    <p>${applyinfo.EMP_TITLE}</p>
                </div>
            </div>
            <div>
                <div class="main_detail_1">
                    <p>기업명:${applyinfo.C_NAME}</p>
                    <p>직종 :${applyinfo.SECTOR_NO}</p>
                    <p>학력 : ${applyinfo.GRADU}</p>
                    <p>경력 : ${applyinfo.CARR}</p>
                    <p>고용형태 : ${applyinfo.EMP_GBN}</p>
                    <p>급여 : 월 ${applyinfo.PAY_LOW} 만원 ~ ${applyinfo.PAY_HIGH} 만원</p>
                    <p>자격증 :  </p>
                </div>
                <hr>
                <div class="main_detail_2">
                    <button class="main_detail_repport">채용정보신고</button>
                    <p>급여</p>
                    <p>퇴직금</p>
                    <p>근무형태</p>
                    <p>근무시간</p>
                    <p>휴일</p>
                    <p>가입보험</p>
                    <p>기타 복지사항</p>
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
        <hr>
        <div class="right_main_menu">
            <button class="right_main_apply">지원하기</button>
            <p> 담당자 정보</p>
            <p> 성명 : ${managerinfo.NAME}</p>
            <p> 연락처 : ${managerinfo.PHONE}</p>
            <p> 이메일 : ${managerinfo.EMAIL}</p>
            <p> 회사 위치 : ${managerinfo.ADDR} ${managerinfo.ADDR_DTL}</p>
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
									'${managerinfo.ADDR} ${managerinfo.ADDR_DTL}',
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
    <footer>
        <div class="inner_content">
            <div><b>공지사항</b></div>
            <div>참여마당</div>
            <div>개인정보처리방침</div>
            <div>이용약관</div>
        </div>
        <h2 class="footer_main_wirte">Coding is too hard </h2>
        <p class="footer_sub_wirte">please make it complete within the time frame</p>
    </footer>
</body>
</html>