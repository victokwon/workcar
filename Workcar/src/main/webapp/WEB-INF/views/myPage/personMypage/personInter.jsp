<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/common/main.css">
    <link rel="stylesheet" href="resources/css/common/default.css">
    <link rel="stylesheet" href="resources/css/common/footer.css">
    <link rel="stylesheet" href="resources/css/Mypage/personMypage/Mypage_inter.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- Add icon library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .main_regi2 {
            display: none;
        }
    </style>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/script/Mypage/header.js"></script>
    <script src="resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="resources/script/Mypage/personMypage/Mypage_inter.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
	$("#PerRegiBtn").on("click", function() {
		location.href = "personRegi";
	});
	
	$("#PerResBtn").on("click", function() {
		location.href = "resumeList";
	});
	
	$("#PerActBtn").on("click", function() {
		location.href = "personAct";
	});
	});
	</script>
</head>
<body>
<!-- 헤더 -->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo()">채용정보</div>
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
            <div class="user_wrap">
                <div class="user_box">
                    <div class="user_profile"></div>
                    <div class="user">
                        <div class="user_name"></div>
                        <div class="user_status"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tab 버튼 태그 -->
        <div class="main_button_box">
            <input type="button" class="main_button" onclick="openPage('main_regi', this)" value="계정관리" id="PerRegiBtn" />
            <input type="button" class="main_button" onclick="openPage('main_apply', this)" value="이력서관리" id="PerResBtn" />
            <input type="button" class="main_button" onclick="openPage('main_act', this)" value="활동내역" id="PerActBtn" />
            <input type="button" class="main_button" onclick="openPage('main_inter', this)" value="관심정보" id="defaultOpen" />
        </div>
        <!-- 메인 -->
        <div class="main_info">
            <div id="main_inter" class="main_content">
                <!-- 메인 메뉴 -->
                <div class="vertical_menu">
                    <a href="#" class="inter_announcement">관심 채용 공고</a>
                    <a href="#" class="inter_enterprise">관심 기업</a>
                </div>
                <!-- 메인메뉴 종료 -->

                <!-- 관심 채용 공고 -->
                <div class="main_box_inter1 main_box">
                    <div class="main_box_frame">
                        <h3 class="main_box_title main_box_title1">관심 채용 공고</h3>
                        <div>
                            <div class="main_box_text main_box_card">
                                <div class="main_box_contents">
                                   <img src="../img/testLogo.png" alt="" class=".text_Logo">
                                </div>
                                <div class="main_box_contents">
                                    <div>기업명</div>
                                </div>
                                <div class="main_box_contents">직종</div>
                                <div class="main_box_contents_grid main_box_contents">
                                    <div>마감일ㅣ2099-99-99</div>
                                    <div>평균 0,0000만원</div>
                                </div>
                                <div class="main_box_contents act_content_button">
                                    <div>
                                    <button class="act_button">삭제</button>
                                </div>
                                </div>
                            </div>
                            <div>
                                <div class="inter_content_add">
                                    <p>+</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 관심 채용 공고 종료 -->
                <div class="main_box_inter2 main_box">
                    <div class="main_box_frame">
                        <h3 class="main_box_title main_box_title1">관심 기업</h3>
                        <div>
                            <div class="main_box_text main_box_card">
                                <div class="main_box_contents">로고</div>
                                <div class="main_box_contents">
                                    <div>기업명</div>
                                    <div>직종</div>
                                    <div>지역</div>
                                </div>
                                <div class="main_box_contents">평점
                                    <div class="star_rating">                
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                </div>
                                <div class="main_box_contents">
                                    <div>평균ㅣ0,000 만원</div>
                                </div>
                                <div class="main_box_contents act_content_button">
                                    <button class="act_button">삭제</button>
                                </div>
                            </div>
                            <div>
                                <div class="inter_content_add">
                                    <p>+</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
    </main>
    <footer>
		<!-- 링크작업 -->
		<div class="inner_content">
			<div id="regi">계정관리</div>
			<div id="">이력서관리</div>
			<div id="act">활동내역</div>
			<div id="inter">관심정보</div>
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
	<script type="text/javascript" src="resources/script/Mypage/personMypage/mainbox.js"></script>
</body>
</html>