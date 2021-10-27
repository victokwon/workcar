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
</head>
<body>
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
            <a class="main_button regi" onclick="openPage('main_regi', this, '#88a2f2')">계정관리</a>
            <a class="main_button apply" onclick="openPage('main_apply', this, '#88a2f2')">이력서관리</a>
            <a class="main_button act" onclick="openPage('main_act', this, '#88a2f2')">활동내역</a>
            <a class="main_button inter" onclick="openPage('main_inter', this, '#88a2f2')" id="main_button">관심정보</a>
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
        <div class="inner_content">
            <div><b>공지사항</b></div>
            <div>참여마당</div>
            <div>개인정보처리방침</div>
            <div>이용약관</div>
        </div>
        <h2>Coding is too hard </h2>
        <p>please make it complete within the time frame</p>
    </footer>
</body>
</html>