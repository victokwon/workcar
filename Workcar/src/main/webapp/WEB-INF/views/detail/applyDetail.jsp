<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="/resources/script/Mypage/Mypage_main_dp.js"></script>
    <script type="text/javascript" src="resources/script/detail/apply_dtl_paging.js"></script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}">
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

    <header>
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
    <main class="main">
        <div class="left_main_menu">
            <div class="vertical-menu">
                <a href="#" class="active">Home</a>
                <div class="mySlides">
              <%--   <a href="#" class="card">
                    <h3>공고명 : </h3>
                    <p>기업명 : ${applyinfo.C_NAME}</p>
                    <p>직종 : ${applyinfo.SECTOR_NO}</p>
                    <p>마감일 : ${applyinfo.DLINE}</p>
                </a> --%>
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
                <div class="main_rating">
                    <h3>평점</h3>
                    <div class="star_rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
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