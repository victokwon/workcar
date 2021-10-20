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
    <link rel="stylesheet" href="../../resources/css/Mypage/manageMypage/Mypage_star_man.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../resources/script/Mypage/header.js"></script>
    <script src="../../resources/script/Mypage/Mypage_main_dp.js"></script>
    <script src="../../resources/script/Mypage/manageMypage/Mypage_star_man.js"></script>
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
                <a class="main_button star" onclick="openPage('main_star', this, '#88a2f2')">평점등록 관리</a>
            </div>
            <!-- 메인 -->
            <div class="main_info">
                <div id="main_star" class="main_content">
                    <!-- 메인 메뉴 -->
                    <div class="vertical_menu">
                        <a href="#" class="star_report_ing">처리 중</a>
                        <a href="#" class="star_report_ed">처리 완료</a>
                    </div>
                    <!-- 메인메뉴 종료 -->

                    <!-- 받은 입사요청 -->
                    <div class="main_box main_box_star1">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">처리 중</h3>
                        </div>
                        <div class="main_box_select">
                            <select>
                                <option value="1">신고자</option>
                                <option value="2">신고사유</option>
                                <option value="3">공고명</option>
                                <option value="4">기업명</option>
                            </select>
                            <input type="text" class="main_box_search">
                            <button class="main_box_search_button">search</button>
                        </div>
                        <div class="main_box_client_list">
                            <div class="main_box_report_list">
                                <div>
                                    <div>신청</div>
                                    <div>개인/기업</div>
                                </div>
                                <div>
                                    <img src="../img/testLogo.png" alt="" class="sub_img">
                                </div>
                                <div>
                                    <div>기업명</div>
                                    <div>별점</div>
                                </div>
                                <div>
                                    <div>등록신청일</div>
                                    <div>0000-00-00</div>
                                </div>
                                <div>
                                    <div>처리상태</div>
                                    <button class="main_report_status btn btn-primary" data-toggle="modal"
                                        data-target=".star_process">처리</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_box main_box_star2">
                        <div class="main_box_title_position">
                            <h3 class="main_box_title main_box_title1">처리 완료</h3>
                        </div>
                        <div class="main_box_select">
                            <select>
                                <option value="1">신고자</option>
                                <option value="2">신고사유</option>
                                <option value="3">공고명</option>
                                <option value="4">기업명</option>
                            </select>
                            <input type="text" class="main_box_search">
                            <button class="main_box_search_button">search</button>
                        </div>
                        <div class="main_box_client_list">
                            <div class="main_box_report_list">
                                <div>
                                    <img src="../img/testLogo.png" alt="" class="sub_img">
                                </div>
                                <div>
                                    <div>신고자</div>
                                    <div>해당채용공고</div>
                                    <div>기업명</div>
                                </div>
                                <div>신고사유</div>
                                <div>
                                    <div>신고일</div>
                                    <div>0000-00-00</div>
                                </div>
                                <div>
                                    <div>처리상태</div>
                                    <div class="main_report_status_com">승인</div>
                                </div>
                            </div>
                            <div class="main_box_report_list">
                                <div>
                                    <img src="../img/testLogo.png" alt="" class="sub_img">
                                </div>
                                <div>
                                    <div>신고자</div>
                                    <div>해당채용공고</div>
                                    <div>기업명</div>
                                </div>
                                <div>신고사유</div>
                                <div>
                                    <div>신고일</div>
                                    <div>0000-00-00</div>
                                </div>
                                <div>
                                    <div>처리상태</div>
                                    <div class="main_report_status_com">거절</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="star_process modal fade bd-example-modal-xl" tabindex="-1" role="dialog"
                aria-labelledby="process_title" aria-hidden="true">
                <div class="modal-dialog .modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="process_title">평점 등록 요청</h3>
                        </div>
                        <div class="modal-body">
                            <div class="modal-text">
                                <div>
                                    <div class="modal_subject ">요청내용</div>
                                    <div class="modal_flex">
                                        <div>성명</div>
                                        <div>기업명</div>
                                    </div>
                                </div>
                                <div>
                                    <div class="modal_subject">등록평점</div>
                                    <div class="modal_flex">기업명 <p class="modal_rating">0.5</p>
                                        <div class='RatingStar'>
                                            <div class='RatingScore'>
                                              <div class='outer-star'><div class='inner-star'></div></div>
                                            </div>
                                          </div>
                                    </div>
                                    <div>
                                        <div>
                                            <div class="modal_flex"><span>업무와 삶의 균형</span>
                                                <p class="modal_rating">0.5</p>
                                                <div class='RatingStar'>
                                                    <div class='RatingScore'>
                                                      <div class='outer-star'><div class='inner-star'></div></div>
                                                    </div>
                                                  </div>
                                                  
                                            </div>
                                            <div class="modal_flex"><span>승진 기회 및 가능성</span>
                                                <p class="modal_rating">0.5</p>
                                                <div class='RatingStar'>
                                                    <div class='RatingScore'>
                                                      <div class='outer-star'><div class='inner-star'></div></div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="modal_flex"><span>사내문화</span>
                                                <p class="modal_rating">0.5</p>
                                                <div class='RatingStar'>
                                                    <div class='RatingScore'>
                                                      <div class='outer-star'><div class='inner-star'></div></div>
                                                    </div>
                                                  </div>
                                            </div>
                                            <div class="modal_flex"><span>복지 및 급여</span>
                                                <p class="modal_rating">0.5</p>
                                                <div class='RatingStar'>
                                                    <div class='RatingScore'>
                                                      <div class='outer-star'><div class='inner-star'></div></div>
                                                    </div>
                                                  </div>
                                            </div>
                                        </div class="modal_flex">
                                        <div class="modal_flex"><span>경영진</span>
                                            <p class="modal_rating">0.5</p>
                                            <div class='RatingStar'>
                                                <div class='RatingScore'>
                                                  <div class='outer-star'><div class='inner-star'></div></div>
                                                </div>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="modal_subject">한줄평</div>
                                    <textarea name="" id="" cols="60" rows="1" placeholder="내용을 입력해 주세요"></textarea>
                                </div>
                                <div>
                                    <div class="modal_subject">처리사유</div>
                                    <textarea name="" id="" cols="60" rows="5" placeholder="내용을 입력해 주세요"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal_button">
                            <button class="btn btn-primary submit">승인</button>
                            <button class="btn btn-primary refuse">거절</button>
                            <button class="btn btn-primary" data-dismiss="modal">취소</button>
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