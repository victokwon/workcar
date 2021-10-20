<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/common/default.css">
    <link rel="stylesheet" href="resources/css/detail/header.css">
    <link rel="stylesheet" href="resources/css/detail/sidebar.css">
    <link rel="stylesheet" href="resources/css/detail/footer.css">
    
    <link rel="stylesheet" href="resources/css/detail/paging.css">
    <link rel="stylesheet" href="resources/css/detail/Human_Resources_Detail.css">
    <link rel="stylesheet" href="resources/css/detail/floatRightNav.css">
    
   
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
    
    <div class="main_profile_div">
        <div class="main_title">
            <h2>채용 공고명</h2>
            <span>등록일 : 2021-10-14</span>
            <div class="main_title_btn">
                <button class="attned_hr_btn">관심인재</button>
                <button class="jc_propo_btn">입사제안</button>
            </div>
        </div>
    </div>
    <main class="main">

        <div class="left_main_menu">
            <div class="vertical-menu">
                <span class="total_cnt">총 0건</span>
                <div class="mySlides">
                    <a href="#" class="card">
                        <p>인재명 :</p>
                        <p>희망직종 :</p>
                        <p>희망근무지역 :</p>
                        <p>등록일 :</p>
                    </a>
                    <a href="#" class="card">
                        <p>인재명 :</p>
                        <p>희망직종 :</p>
                        <p>희망근무지역 :</p>
                        <p>등록일 :</p>
                    </a>
                    <a href="#" class="card">
                        <p>인재명 :</p>
                        <p>희망직종 :</p>
                        <p>희망근무지역 :</p>
                        <p>등록일 :</p>
                    </a>
                    <a href="#" class="card">
                        <p>인재명 :</p>
                        <p>희망직종 :</p>
                        <p>희망근무지역 :</p>
                        <p>등록일 :</p>
                    </a>
                    <a href="#" class="card">
                        <p>인재명 :</p>
                        <p>희망직종 :</p>
                        <p>희망근무지역 :</p>
                        <p>등록일 :</p>
                    </a>
                </div>
                <div class="mySlides"></div>
                <div class="mySlides"></div>
            </div>
            <!-- 페이징 -->
            <div class="page">
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
        </div>
        <!-- left menu -->
        <div id="main_apply" class="main_content">
            <div class="main_box">
                    <div class="content apply_dtl_user" id="resumeUser">
                        <div class="dtl">
                            <div class="header">
                                지원자정보
                            </div>
                            <div class="con">
                                <div class="profile"></div>
                                <div class="input_box">
                                    <div class="name">
                                        <div class="text">성명</div>
                                        <div class="input">${data.NAME}</div>
                                    </div>
                                    <div class="gender">
                                        <div class="text">성별</div>
                                        <div class="input">
                                            <label for="male">${data2.GENDER}</label>
                                        </div>
                                    </div>
                                    
                                    <div class="location">
                                        <div class="text">거주지역</div>
                                        <div class="input">
                                            독도
                                        </div>
                                    </div>
                                    <div class="edu">
                                        <div class="text">최종학력</div>
                                        <div class="input">
                                            한국대학교
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content apply_dtl_hope" id="resumeHope">
                        <div class="dtl">
                            <div class="header">
                                구직희망사항
                            </div>
                            <div class="con">
                                <div class="input_box">
                                    <div class="job">
                                        <div class="text">희망직종</div>
                                        <div class="input">
                                            웹개발자
                                        </div>
                                    </div>
                                    <div class="hope_loc">
                                        <div class="text">근무지역</div>
                                        <div class="input">
                                            서울 강서 강남
                                        </div>
                                    </div>
                                    <div class="work_format">
                                        <div class="text">근무형태</div>
                                        <div class="input">
                                            <label for="workFormat0">정규직</label>
                                        </div>
                                    </div>
                                    <div class="sal">
                                        <div class="text">희망연봉</div>
                                        <div class="input">최저 <input type="text" name="" value="3000">만원 - 최고
                                            <input type="text" name="" value="3500">만원
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content apply_dtl_lisence" id="resumeLisence">
                        <div class="dtl">
                            <div class="header">
                                자격증
                            </div>
                            <div class="con add_box">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box">
                                    <div class="data_container">
                                        <!-- 자격증 검색 api 팝업창 -->
                                        <span>운전면허증 </span>
                                        <span>경찰청 </span>
                                        <span>2020.01.02 </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content apply_dtl_forei" id="resumeForeign">
                        <div class="dtl">
                            <div class="header">
                                외국어능력
                            </div>
                            <div class="con add_box">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box ">
                                    <div class="data_container">
                                        <span>영어</span>
                                        <label for="RLv">읽기/쓰기 :</label>
                                        <span>상</span>
                                        <label for="SLv">회화 :</label>
                                        <span>상</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <div class="content apply_dtl_history" id="resumeHistory">
                    <div class="dtl">
                        <div class="header">
                            경력사항
                        </div>
                        <div class="con add_box">
                            <!-- js를 통해 추가되는 내용 -->
                            <div class="input_box more">
                                <div class="data_container data_conainer_box">
                                    <div class="detail">
                                        기업
                                        <span>구글코리아</span>
                                    </div>
                                    <div class="detail">
                                        부서
                                        <span>개발1팀</span>
                                        직책
                                        <span>주임</span>
                                    </div>
                                    <div class="detail">
                                        재직기간
                                        <input type="text" placeholder="시작 년/월" value="2021년/01월">~
                                        <input type="text" placeholder="종료 년/월" value="2021년/10월">
                                    </div>
                                    <div class="detail">
                                        직무내용
                                        <textarea name="" placeholder="직무내용" spellcheck="false"
                                            disabled>밥먹고 잠자기</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="content apply_dtl_Edu" id="resumeEdu">
                        <div class="dtl">
                            <div class="header">
                                학력사항
                            </div>
                            <div class="con add_box">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box more">
                                    <div class="data_container ">
                                        <div class="detail">
                                            학교
                                            <input type="text" placeholder="학교명" value="한국대학교">
                                        </div>
                                        <div class="detail">
                                            학부
                                            <input type="text" placeholder="학부명" value="경영">
                                            학과
                                            <input type="text" placeholder="학과명" value="경영학">
                                        </div>
                                        <div class="detail">
                                            재학기간
                                            <input type="text" placeholder="시작 년/월" value="2017년/02">~
                                            <input type="text" placeholder="종료 년/월" value="2021년/02">
                                        </div>
                                        <div class="detail">
                                            특이사항
                                            <textarea name="" placeholder="특이사항" spellcheck="false"
                                                readonly>없음</textarea>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                        <div class="dtl">
                            <div class="header">
                                직무교육
                            </div>
                            <div class="con add_box ">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box more">
                                    <div class="data_container ">
                                        <div class="detail">
                                            기관
                                            <input type="text" placeholder="기관명">
                                        </div>
                                        <div class="detail">
                                            훈련과정
                                            <input type="text" placeholder="훈련과정명">
                                        </div>
                                        <div class="detail">
                                            교육기간
                                            <input type="text" placeholder="시작 년/월">~
                                            <input type="text" placeholder="종료 년/월">
                                        </div>
                                        <div class="detail">
                                            교육내용
                                            <textarea name="" placeholder="교육내용" spellcheck="false"></textarea>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="content apply_dtl_intro" id="resumeIntro">
                        <div class="dtl">
                            <div class="header">
                                자기소개서
                            </div>
                            <div class="con add_box">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box text_box">
                                    <input type="text" placeholder="자기소개서 제목 입력" value="밥도잘먹더라">
                                    <div class="data_container">
                                        <textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false"
                                            readonly>밥도잘먹고 잠도 잘자더라</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content apply_dtl_attch" id="resumeAttach">
                        <div class="dtl">
                            <div class="header">
                                첨부파일
                            </div>
                            <div class="con add_box">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box ">
                                    <div class="data_container file_container">
                                        <div id="fileSNm">홍길동_이력서.doc</div>
                                        <input type="hidden" id="fileLNm">
                                        <button type="button">파일다운로드</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- 페이징 -->
            <div class="page">
                <a class="prev" >&#10094; PREV</a>
                <a class="list_move">목록</a>
                <a class="next" >NEXT &#10095;</a>
            </div>
       </div>
       
        <div class="float_right_nav_wrap" id="floatRightNavWrap">
            <div class="float_right_nav">
                <div><a href="#resumeUser">지원자정보</a></div>
                <div><a href="#resumeHope">구직희망사항</a></div>
                <div><a href="#resumeLisence">자격증</a></div>
                <div><a href="#resumeForei">외국어능력</a></div>
                <div><a href="#resumeHistory">경력사항</a></div>
                <div><a href="#resumeEdu">학력사항</a></div>
                <div><a href="#resumeJobEdu">직무교육</a></div>
                <div><a href="#resumeIntro">자기소개서</a></div>
                <div><a href="#resumeAttach">첨부파일</a></div>
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
        <h2 class="footer_main_wirte">Coding is too hard </h2>
        <p class="footer_sub_wirte">please make it complete within the time frame</p>
    </footer>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="resources/script/detail/header.js"></script>
    <script src="resources/script/detail/paging.js"></script> 
</body>
</html>