<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../../resources/css/common/main.css">
    <link rel="stylesheet" href="../../resources/css/common/default.css">
    <link rel="stylesheet" href="../../resources/css/common/footer.css">
    <link rel="stylesheet" href="../../resources/css/Mypage/manageMypage/Mypage_member_man.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../resources/script/Mypage/header.js"></script>
    <script src="../../resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="../../resources/script/Mypage/manageMypage/Mypage_member_man.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
                <a href="#login"><strong>관리자</strong></a>
                <a href="#about"><strong>로그아웃</strong></a>
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
            <div class="main_button_box">
                <div class="main_button_box">
                    <a class="main_button regi" onclick="openPage('main_regi', this, '#88a2f2')">계정관리</a>
                    <a class="main_button member" onclick="openPage('main_member', this, '#88a2f2')">회원관리</a>
                    <a class="main_button report" onclick="openPage('main_report', this, '#88a2f2')" id="main_button">신고관리</a>
                    <a class="main_button star_manage" onclick="openPage('main_inter', this, '#88a2f2')">평점등록 관리</a>
                </div>
            <!-- 메인 -->
            <div class="main_info">
                <div id="main_member" class="main_content">
                    <!-- 메인 메뉴 -->
                    <div class="vertical_menu">
                        <a href="#" class="member_client_per">개인회원</a>
                        <a href="#" class="member_client_enter">기업회원</a>
                    </div>
                    <!-- 메인메뉴 종료 -->

                    <!-- 받은 입사요청 -->
                    <div class="main_box main_box_member1">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">개인 회원</h3>
                        </div>
                        <div class="main_box_select">
                            <select>
                                <option value="1">회원번호</option>
                                <option value="2">성명</option>
                                <option value="3">아이디</option>
                                <option value="4">연락처</option>
                            </select>
                            <input type="text" class="main_box_search">
                            <button class="main_box_search_button">search</button>
                        </div>
                        <div class="main_box_client_list">
                            <table>
                                <tr>
                                    <th>회원번호 ㅣ</th>
                                    <th>성별 ㅣ</th>
                                    <th>성명 ㅣ</th>
                                    <th>아이디 ㅣ</th>
                                    <th>연락처 ㅣ</th>
                                    <th>가입일 ㅣ</th>
                                </tr>
                            </table>
                            <hr class="list_hr">
                            <table>
                                <tr>
                                    <td>회원번호</td>
                                    <td>성별</td>
                                    <td>성명</td>
                                    <td>아이디</td>
                                    <td>연락처</td>
                                    <td>가입일</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="main_box main_box_member2">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">기업 회원</h3>
                        </div>
                        <div class="main_box_select">
                            <select>
                                <option value="1">회원번호</option>
                                <option value="2">성명</option>
                                <option value="3">아이디</option>
                                <option value="4">연락처</option>
                            </select>
                            <input type="text" class="main_box_search">
                            <button class="main_box_search_button">search</button>
                        </div>
                        <div class="main_box_client_list">
                            <table>
                                <tr>
                                    <th>회원번호 ㅣ</th>
                                    <th>기업명 ㅣ</th>
                                    <th>성명 ㅣ</th>
                                    <th>아이디 ㅣ</th>
                                    <th>연락처 ㅣ</th>
                                    <th>가입일 ㅣ</th>
                                    <th>승인여부</th>
                                </tr>
                            </table>
                            <hr class="list_hr">
                            <table>
                                <tr>
                                    <td>회원번호</td>
                                    <td>기업명</td>
                                    <td>성명</td>
                                    <td>아이디</td>
                                    <td>연락처</td>
                                    <td>가입일</td>
                                    <td>승인여부</td>
                                </tr>
                            </table>
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