<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css">
<link rel="stylesheet" type="text/css" href="resources/css/empsch/Employ_search.css">
<link rel="stylesheet" type="text/css" href="resources/css/empsch/paging.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

</script>
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
                <div class="logo_img" style="background-image: url(resources/images/empsch/logo.png)"></div>
            </div>

            <!-- 왼쪽 -->
            <div class="hambuger" onclick="openNav()">
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
            <div class="main_button_box">
                <button class="main_button" onclick="openPage('main_search', this, '#88a2f2')" id="defaultOpen">통합
                    검색</button>
                <button class="main_button" onclick="openPage('main_hits', this,'#88a2f2')">조회수 100</button>
                <button class="main_button" onclick="openPage('main_garde', this,'#88a2f2')">평점 100</button>
                </div>
            <div class="main_info">
                <div id="main_search" class="main_content">
                    <div class="search_top">
                        <form action="#" id="actionForm" method="post" class="tab_search_btn">
                            <select name="searchGbn" class="search_select" id="searchGbn">
                                <option value="0">기업명</option>
                                <option value="1">공고명</option>
                            </select>
                           <input type="text" placeholder="기업명 / 채용공고명" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
                           <button type="submit"><i class="fa fa-search"></i></button>
                           <input type="hidden" id="oldTxt" value="${param.searchTxt}" />
                           <input type="hidden" id="page"  id="page" value="${page}" />
                           
						</form>
                       
                    </div>
                    <!-- 검색 -->
                    <!-- 메인컨텐츠 -->
                    <div class="main_section">
                        <form>
                            <span>공고일 / 마감일 :</span>
                            <span>공고일</span>
                            <select name="start_date" id="start_date">
                                <option value="start_date1">날짜선택</option>
                            </select>
                            <span>~</span>
                            <span>마감일</span>
                            <select name="closing_date" id="closing_date">
                                <option value="closing_date1">날짜선택</option>
                            </select>
                        </form>
                        <form>
                            <span>직종분류 :</span>
                            <select name="fst_cate" id="fst_cate">
                                <option value="fst_cate1">1차 분류</option>
                            </select>
                            <select name="scd_cate" id="scd_cate">
                                <option value="scd_cate1">2차 분류</option>
                            </select>
                            <select name="trd_cate" id="trd_cate">
                                <option value="trd_cate1">3차 분류</option>
                            </select>
                        </form>
                        <form>
                            <span>근무지역 :</span>
                            <select name="bic_city" id="bic_city">
                                <option value="city1">도/광역시</option>
                            </select>
                            <select name="city_fst" id="city_fst">
                                <option value="city_fst1">시/군/구</option>
                            </select>
                            <select name="city_scd" id="city_scd">
                                <option value="city_scd">시/군/구</option>
                            </select>
                            <select name="city_trd" id="city_trd">
                                <option value="city_trd1">시/군/구</option>
                            </select>
                        </form>
                        <form>
                            <span>급여(월급) :</span>
                            <label> 전체 <input type="checkbox" name="sal" class="ckbox" value="all" /></label>
                            <span>최저</span>
                            <input type="text" class="input_box" placeholder="최저금액"> 만원 ~ 최고
                            <input type="text" class="input_box" placeholder="최고금액"> 만원
                        </form>
                        <form>
                            <span>경력 :</span>
                            <label> 전체 <input type="checkbox" name="carr" class="ckbox" value="carr_all" /></label>
                            <label> / 신입 <input type="checkbox" name="carr" class="ckbox" value="carr_ncomer" /></label>
                            <label> / 경력 <input type="checkbox" name="carr" class="ckbox" value="carr_carr" /></label>
                            <input type="text" class="input_box" placeholder="0" class="year_input"> 년 ~
                            <input type="text" class="input_box" placeholder="10" class="year_input"> 년
                        </form>
                        <form>
                            <span>고용형태 :</span>
                            <label> 전체 <input type="checkbox" name="emp" class="ckbox" value="emp_all" /></label>
                            <label> / 정규직 <input type="checkbox" name="emp" class="ckbox"value="emp_ftime" /></label>
                            <label> / 계약직 <input type="checkbox" name="emp" class="ckbox" value="emp_cwrk" /></label>
                            <label> / 시간제 <input type="checkbox" name="emp" class="ckbox" value="emp_ptime" /></label>
                            <label> / 기타 <input type="checkbox" name="emp" class="ckbox" value="emp_etc" /></label>
                        </form>

                    </div>
                    <div id="more">
                    	<form>
                            <span>최종학력 :</span>
                            <label> 전체 <input type="checkbox" name="gradu" class="ckbox" value="gradu_all" /></label>
                            <label> / 고등학교 <input type="checkbox" name="gradu" class="ckbox"value="gradu_hc" /></label>
                            <label> / 전문대학 <input type="checkbox" name="gradu" class="ckbox" value="gradu_jc" /></label>
                            <label> / 대학교 <input type="checkbox" name="gradu" class="ckbox" value="gradu_univ" /></label>
                            <label> / 석사 <input type="checkbox" name="gradu" class="ckbox" value="gradu_master" /></label>
                            <label> / 박사 <input type="checkbox" name="gradu" class="ckbox" value="gradu_doc" /></label>
                        </form>
                        <form>
                            <span>기업분류 :</span>
                            <label> 무관 <input type="checkbox" name="c_cate" class="ckbox" value="c_cate_invant" /></label>
                            <label> 중소 <input type="checkbox" name="c_cate" class="ckbox" value="c_cate_middle_small" /></label>
                        </form>
                        <form>
                            <!-- <input type="button" class="minus_btn" id="delBtn" value="－"> -->
                            <span>자격증 :</span>
                            <label> 전체 <input type="checkbox" name="qual" class="ckbox" value="qual_all" /></label>
                            <input type="text" class="input_box" placeholder="자격증">
                            <select name="qual_bic_cate" >
                                <option value="qual_bic_cate1">대분류</option>
                            </select>
                            <select name="qual_small_cate" >
                                <option value="qual_small_cate1">소분류</option>
                            </select>
                            <label> / 급수 <input type="checkbox" name="qual" class="ckbox" value="qual_rating" /></label>
                            <input type="button" class="plus_btn" id="addBtn1" value="＋">
                        </form>
	
                    </div>
                    <button onclick="moreBtn()" id="img_btn"><img src="resources/images/empsch/down.png" alt="down" id="icon"></button>
                    <!-- Portfolio Gallery Grid -->
                    <div class="card_list  ">
                        <div class="card_list_char">
                            <h2>검색 리스트</h3>
                        </div>
                        <div class="mySlides">
                            <div class="row">
                                <div class="column">
                                    <div class="content">
                                        <img src="img/samsung.png" alt="samsung">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/apple.png" alt="apple">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/lg.png" alt="lg">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="content">
                                        <img src="img/samsung.png" alt="samsung">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/apple.png" alt="apple">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/lg.png" alt="lg">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="content">
                                        <img src="img/samsung.png" alt="samsung">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/apple.png" alt="apple">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/lg.png" alt="lg">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 두번째 -->
                        <div class="mySlides">
                            <div class="row">
                                <div class="column">
                                    <div class="content">
                                        <img src="img/apple.png" alt="apple">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/samsung.png" alt="samsung">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/lg.png" alt="lg">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="content">
                                        <img src="img/apple.png" alt="apple">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/lg.png" alt="lg">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/samsung.png" alt="samsung">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="content">
                                        <img src="img/lg.png" alt="lg">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/samsung.png" alt="samsung">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                                <div class="column">
                                    <div class="content">
                                        <img src="img/apple.png" alt="apple">
                                        <h3>My Work</h3>
                                        <p>Lorem ipsum..</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 세번째 -->
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





                <div id="main_hits" class="main_content">
                    <div class="main_margin"></div>
                    <div class="main_section">
                        <div class="vertical_menu">
                            <a href="#">
                                <div class="apply_content">지원자</div>
                            </a>
                            <a href="#">
                                <div class="apply_content">지원자</div>
                            </a>
                        </div>
                        <div class="main_box">
                        </div>
                    </div>
                </div>

                <div id="main_garde" class="main_content">
                    <div class="main_margin"></div>
                    <div class="main_section">
                        <div class="vertical_menu">
                            <a href="#">개인정보 설정</a>
                            <a href="#">비밀번호 변경</a>
                        </div>
                        <div class="main_regi_contents">
                            <h3>Contact</h3>
                            <p>Get in touch, or swing by for a cup of coffee.</p>
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
    
	<script type="text/javascript" src="resources/script/empsch/Employ_search.js"></script>
	<script type="text/javascript" src="resources/script/empsch/header.js"></script>
	<script type="text/javascript" src="resources/script/empsch/paging.js"></script>
</body>
</html>