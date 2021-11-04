<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/common/default.css">
    <link rel="stylesheet" href="resources/css/common/header.css">
    <link rel="stylesheet" href="resources/css/detail/sidebar.css">
    <link rel="stylesheet" href="resources/css/detail/footer.css">
    
    <link rel="stylesheet" href="resources/css/detail/paging.css">
    <link rel="stylesheet" href="resources/css/detail/Human_Resources_Detail.css">
    <link rel="stylesheet" href="resources/css/detail/floatRightNav.css">
    <script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="resources/script/detail/joboffer_dtl_paging.js"></script>
	<script>
	function linkGo(url){
 		location.href = url
 	}
	</script>	
   
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" id="page" name="page" value="${page}">
	<input type="hidden" id="sNo" name="sNo" value="${param.sNo}">
	<input type="hidden" id="empno" name="empno" value="${param.empno}">
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
		<!-- 네비게이션바 -->
		<div class="topnav">

			<!-- 로고 -->
			<div class="topnav-centered" onclick="linkGo('mainpage')">
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
    
    <div class="main_profile_div">
        <div class="main_title">
            <h2>${resum.HENAME}</h2>
            <span>${resum.DT}</span>
            <div class="main_title_btn">
                <button class="attned_hr_btn">관심인재</button>
                <button class="jc_propo_btn">입사제안</button>
            </div>
        </div>
    </div>
    <main class="main">

        <div class="left_main_menu">
            <div class="vertical-menu">
                <span class="total_cnt">총 ${cnt}건</span>
                <div class="mySlides">

                </div>
            <!-- 페이징 -->
            <div class="page1">
            </div>
            </div>
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
                                        <div class="input">${jiwonja.NAME}</div>
                                    </div>
                                    <div class="gender">
                                        <div class="text">성별</div>
                                        <div class="input">
                                            <label for="male">${jiwonja.GENDER}</label>
                                        </div>
                                    </div>
                                    
                                    <div class="location">
                                        <div class="text">거주지역</div>
                                        <div class="input">
                                            ${jiwonja.ADDR} ${jiwonja.ADDR_DTL}
                                        </div>
                                    </div>
                                    <div class="edu">
                                        <div class="text">최종학력</div>
                                        <div class="input">
                                            ${jiwonja.GRADU}
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
                                           ${wish.SNM}
                                        </div>
                                    </div>
                                    <div class="hope_loc">
                                        <div class="text">희망근무지역</div>
                                        <div class="input">
                                            ${wish.CITY} ${wish.RNM}
                                        </div>
                                    </div>
                                    <div class="work_format">
                                        <div class="text">근무형태</div>
                                        <div class="input worktype">
                                             ${wish.SNM}
                                        </div>
                                    </div>
                                    <div class="sal">
                                        <div class="text">희망연봉</div>
                                        
                                        <div class="input">${wish.RPAYMIN}만원 - ${wish.RPAYMAX}만원
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
                               		 <c:forEach var="Qualification" items="${Qualification}">
	                                    <div class="data_container">
	                                        <!-- 자격증 검색 api 팝업창 -->
	                                        <span>${Qualification.RT}</span>
	                                        <span>${Qualification.PD}</span>
	                                        <span>${Qualification.IA}</span>
	                                    </div>
                                      </c:forEach>
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
                                <c:forEach var="flang" items="${flang}">
                                    <div class="data_container">
                                        <span>${flang.FNAME}</span>
                                        <span>읽기/쓰기 : ${flang.FG}</span>
                                        <span>회화 : ${flang.FG}</span>
                                    </div>
                                    </c:forEach>
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
                                        <span>${career.RCNAME}</span>
                                    </div>
                                    <div class="detail">
                                        부서
                                        <span>${career.RCDP}</span>
                                        직책
                                        <span>${career.RCP}</span>
                                    </div>
                                    <div class="detail">
                                        재직기간
                                        ${career.RCST} ~ ${career.RCED}
                                    </div>
                                    <div class="detail">
                                        직무내용
                                        <textarea name="" placeholder="직무내용" spellcheck="false"
                                            disabled>${career.RCCT}</textarea>
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
                                            <input type="text" placeholder="학교명" value="${grade.SCNAME}">
                                        </div>
                                        <div class="detail">
                                            학부
                                            <input type="text" placeholder="학부명" value="${grade.RESOL}">
                                            학과
                                            <input type="text" placeholder="학과명" value="${grade.REMAJOR}">
                                        </div>
                                        <div class="detail">
                                            재학기간
                                            <input type="text" placeholder="시작 년/월" value="${grade.REST}">~
                                            <input type="text" placeholder="종료 년/월" value="${grade.REED}">
                                        </div>
                                        <div class="detail">
                                            특이사항
                                            <textarea name="" placeholder="특이사항" spellcheck="false"
                                                readonly>${grade.REEE}</textarea>
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
                                            <input type="text" placeholder="${edu.EDUNAME}">
                                        </div>
                                        <div class="detail">
                                            훈련과정
                                            <input type="text" placeholder="${edu.COSENAME}">
                                        </div>
                                        <div class="detail">
                                            교육기간
                                            <input type="text" placeholder="${edu.ST}">~
                                            <input type="text" placeholder="${edu.ED}">
                                        </div>
                                        <div class="detail">
                                            교육내용
                                            <textarea name="" placeholder="${edu.CNT}" spellcheck="false"></textarea>
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
                                    <input type="text" placeholder="자기소개서 제목 입력" value="${resum.HENAME}" disabled>
                                    <div class="data_container">
                                        <textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false"
                                            readonly>${resum.SINTRONAME}</textarea>
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
    <script src="resources/script/detail/header.js"></script>
</body>
</html>