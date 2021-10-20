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
    <link rel="stylesheet" href="../../resources/css/Mypage/corMypage/Mypage_regi_cor.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../resources/script/Mypage/header.js"></script>
    <script src="../../resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="../../resources/script/Mypage/corMypage/Mypage_regi_cor.js"></script>
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
                        <a href="#" class="regi_corpoation">기업정보 설정</a>
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
                                    <p class="main_box_text2">아이디</p>
                                    <p class="main_box_text3">이름</p>
                                    <p class="main_box_text6">연락처</p>
                                    <p class="main_box_text9">이메일 주소</p>
                                    <p class="main_box_text10">이메일 수신 설정</p>
                                </div>
                            </div>
                            <form action="">
                                <div class="main_box_text_grid main_box_text_grid1">
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
                                    <div class="main_content_button_div main_regi_secession_button">
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
                            <h3 class="main_box_title main_box_title1">기업정보 설정</h3>
                        </div>
                        <form action="">
                        <div>
                            <div class="content " id="recru_info">
                                <div class="dtl">
                                    <button type="button">저장</button>
                                    <!-- <button type="button">수정</button> -->
                                    <div class="con">
                                        <div class="company">
                                            <div class="text">기업로고</div>
                                            <div class="input">
                                                <div class="logo"></div>
                                            </div>
                                            <div><button type="button" id="companySchBtn">업로드</button></div>
                                        </div>
                                        <div class="company">
                                            <div class="text">기업검색</div>
                                            <div class="input">
                                                <button type="button">기업검색</button>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">기업명</div>
                                            <div class="input">
                                                <input type="text" placeholder="기업명" readonly>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">법인등록번호</div>
                                            <div class="input">
                                                <input type="text" placeholder="법인등록번호" readonly>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">사업자등록번호</div>
                                            <div class="input">
                                                <input type="text" placeholder="사업자등록번호" readonly>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">대표 연락처</div>
                                            <div class="input">
                                                <input type="text" placeholder="대표 연락처">
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">대표 이메일</div>
                                            <div class="input">
                                                <input type="text" placeholder="대표 이메일">
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">주소</div>
                                            <div class="input">
                                                <div class="location_dtl">주소</div>
                                                <button type="button">주소검색</button>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">상세주소</div>
                                            <div class="input">
                                                <input type="text" placeholder="상세주소">
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">업종</div>
                                            <div class="input">
                                                <select>
                                                    <option value="-1">업종 선택</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">홈페이지 주소</div>
                                            <div class="input">
                                                <input type="text" placeholder="홈페이지 주소">
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">중소기업 유무</div>
                                            <div class="input">
                                                <input name="middleCompany" type="radio" id="middleCompany1"><label
                                                    for="middleCompany1">유</label>
                                                <input name="middleCompany" type="radio" id="middleCompany2"><label
                                                    for="middleCompany2">무</label>
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">연매출</div>
                                            <div class="input">
                                                <input type="text" placeholder="연매출" readonly> 만원
                                            </div>
                                        </div>
                                        <div class="company">
                                            <div class="text">근로자수</div>
                                            <div class="input">
                                                <input type="text" placeholder="근로자수" readonly>
                                            </div>
                                        </div>
        
                                    </div>
                                    <form action="">
                                        <div class="apply_dtl_attch" id="resumeAttach">
                                            <div class="dtl">
                                                <div class="header">
                                                    사업내용
                                                </div>
                                                <div class="con add_box">
                                                    <!-- js를 통해 추가되는 내용 -->
                                                    <div class="company">
                                                        <textarea></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form action="">
                                        <div class="apply_dtl_attch" id="resumeAttach">
                                            <div class="dtl">
                                                <div class="header">
                                                    첨부파일
                                                </div>
                                                <div class="con add_box">
                                                    <!-- js를 통해 추가되는 내용 -->
                                                    <div class="file_box ">
                                                        <input type="button" class="minus_btn" id="delBtn" value="－">
                                                        <div class="data_container file_container">
                                                            <div id="fileSNm">파일명</div>
                                                            <input type="hidden" id="fileLNm">
                                                            <button type="button">파일업로드</button>
                                                        </div>
                                                    </div>
        
                                                    <input type="button" class="plus_btn" id="addBtn7" value="＋">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
        
                        </div>
                    </form>
                    </div>


                    <div class="main_box main_box_regi3">
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
                                <div class="main_content_button_div main_content_button_div1">
                                    <button>비밀번호 변경</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 -->
            </div>
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