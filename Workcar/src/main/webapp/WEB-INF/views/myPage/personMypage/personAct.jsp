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
    <link rel="stylesheet" href="resources/css/Mypage/personMypage/Mypage_act.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/script/Mypage/header.js"></script>
    <script src="resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="resources/script/Mypage/personMypage/Mypage_act.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
	$("#PerRegiBtn").on("click", function() {
		location.href = "personRegi";
	});
	
	$("#PerResBtn").on("click", function() {
		location.href = "resumeList";
	});
	
	$("#PerIntBtn").on("click", function() {
		location.href = "personInter";
	});
	});
	</script>
</head>
<body>
   <!-- 사이드바 -->
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
    <!-- 사이드바 종료 -->
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
            <div class="topnav-right">
                <a href="#login"><strong>Login</strong></a>
                <a href="#about"><strong>회원가입</strong></a>
            </div>
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
            <input type="button" class="main_button" onclick="openPage('main_act', this)" value="활동내역" id="defaultOpen" />
            <input type="button" class="main_button" onclick="openPage('main_inter', this)" value="관심정보" id="PerIntBtn" />
            <!--  <a class="main_button regi" onclick="openPage('main_regi', this, '#88a2f2')" id="PerRegiBtn">계정관리</a>
            <a class="main_button apply" onclick="openPage('main_apply', this, '#88a2f2')" id="PerResBtn">이력서관리</a>
            <a class="main_button act" onclick="openPage('main_act', this, '#88a2f2')" id="main_button">활동내역</a>
            <a class="main_button inter" onclick="openPage('main_inter', this, '#88a2f2')" id="PerIntBtn">관심정보</a>-->
        </div>
        <!-- 메인 -->
        <div class="main_info">
        <div id="main_act" class="main_content"> 
            <!-- 메인 메뉴 -->
            <div class="vertical_menu">
                <a href="#" class="act_apply">받은 입사요청</a>
                <a href="#" class="act_submit">보낸 이력서</a>
                <a href="#" class="act_evaluate">등록 평점</a>
            </div>
            <!-- 메인메뉴 종료 -->

            <!-- 받은 입사요청 -->
            <div class="main_box main_box_act1">
                <div><h3 class="main_box_title main_box_title2">받은 입사요청</h3>
                    <div>
                        <div class="main_box_text main_box_card">
                            <div class="main_box_contents">로고</div>
                            <div class="main_box_contents">
                                <div>공고명</div>
                                <div>기업명</div>
                            </div>
                            <div class="main_box_contents">평점</div>
                            <div class="main_box_contents">
                                <div>제안일ㅣ2021-10-08</div>
                                <div>마감일ㅣ2099-99-99</div>
                            </div>
                            <div class="act_content_button">
                                <button class="act_button">지원하기</button>
                                <button class="act_button">삭제</button>
                            </div>
                        </div>
                        <div>
                        <div>+</div>
                    </div>
                    </div>
                </div>
                </div>
                <!-- 받은 입사요청 종료 -->

                <!-- 보낸이력서 -->
            <div class="main_box main_box_act2">
                <h3 class="main_box_title main_box_title2">보낸 이력서</h3>
                <div>
                    <div class="main_box_text main_box_card">
                        <div>로고</div>
                        <div>
                            <div>이력서ㅣ<a href="">공...</a> </div>
                        </div>
                        <div>처리일</div>
                        <div>
                            <div>제출일ㅣ2021-10-08</div>
                            <div>마감일ㅣ2099-99-99</div>
                        </div>
                        <div class="act_content_button">
                            <button class="act_button_visit">미열람</button>
                            <button class="act_button">지원하기</button>
                            <button class="act_button">삭제</button>
                        </div>
                    </div>
                    <div></div>
                </div>
            </div>
            <!-- 보낸 이력서 종료 -->

            <!-- 등록 평점 -->
            <div class="main_box main_box_act3">
                <h3 class="main_box_title main_box_title2">등록 평점</h3>
                <div>
                    <div class="main_box_text main_box_card">
                        <div>로고</div>
                        <div>
                            <div>공고명</div>
                            <div>기업명</div>
                        </div>
                        <div>평점</div>
                        <div>
                            <div>제안일ㅣ2021-10-08</div>
                            <div>마감일ㅣ2099-99-99</div>
                        </div>
                        <div class="act_content_button">
                            <button class="act_button">지원하기</button>
                            <button class="act_button">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!-- 등록평점 종료 -->
    </main>
    <footer>
		<!-- 링크작업 -->
		<div class="inner_content">
			<div id="ntc">공지사항</div>
			<div id="paticp">참여마당</div>
			<div id="pvc">개인정보처리방침</div>
			<div id="tou">이용약관</div>
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