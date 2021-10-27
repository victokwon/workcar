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
    <link rel="stylesheet" href="resources/css/Mypage/personMypage/Mypage_regi.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/script/Mypage/header.js"></script>
    <script src="resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="resources/script/Mypage/personMypage/Mypage_regi.js"></script>
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
        	<a class="main_button regi" onclick="openPage('main_regi', this, '#88a2f2')">계정관리</a>
            <a class="main_button member" onclick="openPage('main_member', this, '#88a2f2')">회원관리</a>
            <a class="main_button report" onclick="openPage('main_report', this, '#88a2f2')"
                    id="main_button">신고관리</a>
            <a class="main_button star_manage" onclick="openPage('main_inter', this, '#88a2f2')">평점등록 관리</a>
        </div>
            <!-- 메인 -->
            <div class="main_info">
                <div id="main_regi" class="main_content">
                    <!-- 메인 메뉴 -->
                    <div class="vertical_menu">
                        <a href="#" class="regi_info">개인정보 설정</a>
                        <a href="#" class="regi_update">비밀번호 변경</a>
                    </div>
                    <!-- 메인메뉴 종료 -->

                    <!-- 받은 입사요청 -->
                    <div class="main_box main_box_regi1">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">개인정보 설정</h3>
                        </div>
                        <div class="main_box_texts">
                            <div>
                                <div class="main_box_text">
                                    <p class="main_box_text1">프로필 사진</p>
                                    <p class="main_box_text2">아이디</p>
                                    <p class="main_box_text3">이름</p>
                                    <p class="main_box_text4">생년월일</p>
                                    <p class="main_box_text5">성별</p>
                                    <p class="main_box_text6">연락처</p>
                                    <p class="main_box_text7">주소</p>
                                    <p class="main_box_text8">상세주소</p>
                                    <p class="main_box_text9">이메일 주소</p>
                                    <p class="main_box_text10">이메일 수신 설정</p>
                                </div>
                            </div>
                            <form action="">
                                <div class="main_box_text_grid">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <input type="text">
                                    <div class="email_permission">
                                        <div class="form-group">
                                            <div>
                                                관심내역 수신동의
                                                <input type="radio" name="custom1" id="custom1Y"><label
                                                    for="custom1Y">동의</label>
                                                <input type="radio" name="custom1" id="custom1N"><label
                                                    for="custom1N">비동의</label>
                                            </div>
                                            <div>
                                                활동내역 수신동의
                                                <input type="radio" name="custom2" id="custom2Y"><label
                                                    for="custom2Y">동의</label>
                                                <input type="radio" name="custom2" id="custom2N"><label
                                                    for="custom2N">비동의</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="main_box_text_grid">
                                <div class="main_content_button">
                                    <div class="main_content_button_div">
                                        <button class="main_regi_secession btn btn-primary" data-toggle="modal"
                                            data-target=".secession_process">회원탈퇴</button>
                                        <button>수정</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_box main_box_regi2">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">비밀번호 변경</h3>
                        </div>
                        <form action="">
                            <div class="main_box_text_grid">
                                <p>현재 비밀번호</p>
                                <input type="text">
                                <p>새 비밀번호</p>
                                <input type="text" placeholder="비밀번호 (10자리이상)">
                                <input type="text" placeholder="비밀번호 확인">
                            </div>
                        </form>
                        <div class="main_box_text_grid">
                            <div class="main_content_button">
                                <div class="main_content_button_div">
                                    <button>비밀번호 변경</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 -->
            <div class="secession_process modal fade bd-example-modal-xl" tabindex="-1" role="dialog"
            aria-labelledby="process_title" aria-hidden="true">
            <div class="modal-dialog .modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="process_title">회원 탈퇴</h3>
                    </div>
                    <div class="modal-body">
                        <div class="modal_last_pw">
                            <div class="modal_subject" aria-placeholder="현재 비밀번호 입력">비밀번호 확인</div>
                            <textarea name="" id="" cols="60" rows="1" class="modal_text_area"></textarea>
                        </div>
                            <div class="modal_last_notification">
                                <div class="modal_subject modal_notification">탈퇴 안내 사항</div>
                                <div>
                                <p> <strong>탈퇴 후 회원정보가 모두 삭제됩니다.</strong><br/>
                                    메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
                                </p>
                                <p>
                                <strong>탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</strong><br/>
                                    각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.
                                    삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.
                                    (탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)
                                </p>
                            </div>
                            </div>
                            <div class="modal_button">
                                <button class="btn btn-primary submit modal-btn">처리</button>
                                <button class="btn btn-primary modal-btn" data-dismiss="modal">취소</button>
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