<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources\css\common\default.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\footer.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\header.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\common\sidebar.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\resume\resumeInsert.css">
<link rel="stylesheet" type="text/css"
	href="resources\css\resume\floatRightNav.css">

<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources\script\resume\resumeInsert.js"></script>
<script type="text/javascript" src="resources\script\common\sidebar.js"></script>
<script type="text/javascript">
	$(function() {
		if("${msg}"!=""){
			alert(${msg})
		}
		
		$("tr").on("click","#delBtn",function(){
			let resumeNo = $(this).parent().parent().attr("resumeNo")
			$("#resumeNo").val(resumeNo)
			$("#actGbn").val(1)
			$("#resumeGo").attr("action", "applyResume")
			$("#resumeGo").submit()
		})
		
		$("tr").on("click","#applyBtn",function(){
			let resumeNo = $(this).parent().parent().attr("resumeNo")
			$("#resumeNo").val(resumeNo)
			$("#actGbn").val(0)
			$("#openYN").val($(this).parent().children("select").val())
			$("#resumeGo").attr("action", "applyResume")
			$("#resumeGo").submit()
		})
		
		$("tr").on("click","#resumeDtlBtn",function(){
			let resumeNo = $(this).parent().parent().attr("resumeNo")
			$("#resumeNo").val(resumeNo)
			$("#actGbn").val(3)
			$("#resumeGo").attr("action", "resumeDtl")
			$("#resumeGo").submit()
		})
		
		$("#addBtn").on("click",function(){
			 
		})
		
	})

	function linkGo(url) {
		location.href = url
	}
</script>
</head>

<body>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="sdienav_ul">
			<!-- 링크작업 -->
			<ul>
				<div onclick="linkGo()">채용정보</div>
				<li id="">통합검색</li>
				<li id="">조회수 100</li>
				<li id="">평점 100</li>
			</ul>
			<ul>
				<div id="">기업정보</div>
				<li id="">통합검색</li>
			</ul>
			<ul>
				<div id="">인재정보</div>
				<li id="">통합검색</li>
			</ul>
			<ul>
				<div id="">참여공간</div>
				<li id="">공지사항</li>
				<li id="">자주하는 질문</li>
			</ul>
			<c:choose>
				<c:when test="${sMTy eq 0}">
					<ul>
						<div id="">마이페이지</div>
						<li id="">계정관리</li>
						<li id="">이력서관리</li>
						<li id="">활동내역</li>
						<li id="">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 1 || sMTy eq 2}">
					<ul>
						<div id="">마이페이지</div>
						<li id="">계정관리</li>
						<li id="">채용공고</li>
						<li id="">활동내역</li>
						<li id="">관심정보</li>
					</ul>
				</c:when>
				<c:when test="${sMTy eq 3}">
					<ul>
						<div id="">마이페이지</div>
						<li id="">계정관리</li>
						<li id="">회원관리</li>
						<li id="">신고관리</li>
						<li id="">평점관리</li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="side_bcc" id="side_bcc" onclick="closeNav()"></div>

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
		<div id="test"></div>
		<div class="main_button_box">
			<button type="button" class="main_button">계정관리</button>
			<button type="button" class="main_button" id="defaultOpen">이력서관리</button>
			<button type="button" class="main_button">활동내역</button>
			<button type="button" class="main_button">관심정보</button>
		</div>
		<div class="main_info">

			<div id="main_apply" class="main_content">
				<div class="vertical_menu">
                    <table>
                        <tr>
                            <div class="apply_list">
                                <a href="#">이력서명</a>
                            </div>
                        </tr>
                        <tr>
                            <div class="apply_list">
                                <a href="#">이력서명</a>
                            </div>
                        </tr>
                    </table>
                </div>
                <!-- form 내부의 button 동작 막기 -->
                <div class="main_box">
                    <form action="#" class="resume" id="resumeName">
                        <div class="content apply_dtl_header" id="resumeName">
                            <div class="apply_dtl">
                                <span class="apply_dtl_name">이력서 제목</span><br>
                                <span class="apply_dtl_date">최종수정일 | 데이터 / 최종수정일</span>
                            </div>
                            <div class="apply_btn">
                                <select name="opencase" class="opencase">
                                    <option value="0">공개</option>
                                    <option value="1">비공개</option>
                                </select>
                                <button type="button">저장</button>
                                <button type="button" class="apply_back_btn">목록</button>
                            </div>
                        </div>
                    </form>
                    <!-- form 설정 -->
                    <form action="#">
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
                                            <div class="input"><input type="text" value="데이터 / 이름" readonly></div>
                                        </div>
                                        <div class="gender">
                                            <div class="text">성별</div>
                                            <div class="input">
                                                <input type="radio" name="gender" value="남성" id="male" checked>
                                                <label for="male">남성</label>
                                                <input type="radio" name="gender" value="여성" id="female">
                                                <label for="female">여성</label>
                                            </div>
                                        </div>
                                        <div class="birth">
                                            <div class="text">출생년도</div>
                                            <div class="input"><input type="text" value="데이터 / 출생년도" readonly></div>
                                        </div>
                                        <div class="phone">
                                            <div class="text">연락처</div>
                                            <div class="input"><input type="text" value="데이터 / 연락처" readonly></div>
                                        </div>
                                        <div class="email">
                                            <div class="text">이메일</div>
                                            <div class="input"><input type="text" value="데이터 / 이메일" readonly></div>
                                        </div>
                                        <div class="location">
                                            <div class="text">거주지역</div>
                                            <div class="input">
                                                <select>
                                                    <!-- <option value="">전체</option> -->
                                                    <option value="-1">도/광역시 선택</option>
                                                    <option value="강원">강원</option>
                                                    <option value="경기">경기</option>
                                                    <option value="경남">경남</option>
                                                    <option value="경북">경북</option>
                                                    <option value="광주">광주</option>
                                                    <option value="대구">대구</option>
                                                    <option value="대전">대전</option>
                                                    <option value="부산">부산</option>
                                                    <option value="서울">서울</option>
                                                    <option value="울산">울산</option>
                                                    <option value="인천">인천</option>
                                                    <option value="전남">전남</option>
                                                    <option value="전북">전북</option>
                                                    <option value="제주">제주</option>
                                                    <option value="충남">충남</option>
                                                    <option value="충북">충북</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="edu">
                                            <div class="text">최종학력</div>
                                            <div class="input">
                                                <input type="radio" name="edu" value="고등학교" id="edu0" checked>
                                                <label for="edu0">고등학교</label>
                                                <input type="radio" name="edu" value="전문대학" id="edu1">
                                                <label for="edu1">전문대학</label>
                                                <input type="radio" name="edu" value="대학교" id="edu2">
                                                <label for="edu2">대학교</label>
                                                <input type="radio" name="edu" value="석사" id="edu3">
                                                <label for="edu3">석사</label>
                                                <input type="radio" name="edu" value="박사" id="edu4">
                                                <label for="edu4">박사</label>
                                                <input type="radio" name="edu" value="기타" id="edu5">
                                                <label for="edu5">기타</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- form 설정 -->
                    <form action="#">
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
                                                <select>
                                                    <!-- 희망직종 셀렉 재구성 필요 -->
                                                    <option value="-1">희망직종 선택</option>
                                                    <option value="강원">강원</option>
                                                    <option value="경기">경기</option>
                                                    <option value="경남">경남</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="hope_loc">
                                            <div class="text">근무지역</div>
                                            <div class="input">
                                                <select>
                                                    <!-- <option value="">전체</option> -->
                                                    <option value="-1">도/광역시 선택</option>
                                                    <option value="강원">강원</option>
                                                    <option value="경기">경기</option>
                                                    <option value="경남">경남</option>
                                                    <option value="경북">경북</option>
                                                    <option value="광주">광주</option>
                                                    <option value="대구">대구</option>
                                                    <option value="대전">대전</option>
                                                    <option value="부산">부산</option>
                                                    <option value="서울">서울</option>
                                                    <option value="울산">울산</option>
                                                    <option value="인천">인천</option>
                                                    <option value="전남">전남</option>
                                                    <option value="전북">전북</option>
                                                    <option value="제주">제주</option>
                                                    <option value="충남">충남</option>
                                                    <option value="충북">충북</option>
                                                </select>
                                                <select>
                                                    <!-- 세부지역 셀렉 재구성 필요 -->
                                                    <option value="-1">세부지역 1</option>
                                                    <option value="강원">강원</option>
                                                    <option value="경기">경기</option>
                                                    <option value="경남">경남</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="work_format">
                                            <div class="text">근무형태</div>
                                            <div class="input">
                                                <input type="radio" name="workFormat" value="정규직" id="workFormat0"
                                                    checked>
                                                <label for="workFormat0">정규직</label>
                                                <input type="radio" name="workFormat" value="계약직" id="workFormat1">
                                                <label for="workFormat1">계약직</label>
                                                <input type="radio" name="workFormat" value="시간제" id="workFormat2">
                                                <label for="workFormat2">시간제</label>
                                                <input type="radio" name="workFormat" value="기타" id="workFormat3">
                                                <label for="workFormat3">기타</label>
                                            </div>
                                        </div>
                                        <div class="sal">
                                            <div class="text">희망연봉</div>
                                            <div class="input">최저<input type="text" name="">만원 - 최고
                                                <input type="text" name="">만원
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- form 설정 -->
                    <form action="">
                        <div class="content apply_dtl_lisence" id="resumeLisence">
                            <div class="dtl">
                                <div class="header">
                                    자격증
                                </div>
                                <div class="con add_box">
                                    <!-- js를 통해 추가되는 내용 -->
                                    <div class="input_box ">
                                        <input type="button" class="minus_btn" id="delBtn" value="－">
                                        <div class="data_container">
                                            <!-- 자격증 검색 api 팝업창 -->
                                            <input type="button" class="" id="lisenceSchBtn" value="자격증 검색">
                                            <input type="text" value="데이터 / 자격증명" readonly>
                                            <input type="text" value="데이터 / 발급처" readonly>
                                            <input type="text" placeholder="발급일">
                                            <input type="text" placeholder="기타사항">
                                        </div>
                                    </div>

                                    <input type="button" class="plus_btn" id="addBtn1" value="＋">
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- form 설정 -->
                    <form action="">
                        <div class="content apply_dtl_forei" id="resumeForeign">
                            <div class="dtl">
                                <div class="header">
                                    외국어능력
                                </div>
                                <div class="con add_box">
                                    <!-- js를 통해 추가되는 내용 -->
                                    <div class="input_box ">
                                        <input type="button" class="minus_btn" id="delBtn" value="－">
                                        <div class="data_container">
                                            <select name="foreignLv" id="foreignLv">
                                                <option value="-1">언어 선택</option>
                                                <option value="0">영어</option>
                                                <option value="1">일본어</option>
                                                <option value="2">중국어</option>
                                                <option value="2">독일어</option>
                                                <option value="2">불어</option>
                                                <option value="2">스페인어</option>
                                                <option value="2">러시아어</option>
                                                <option value="2">이탈리아어</option>
                                                <option value="2">에스파냐어</option>
                                                <option value="2">아랍어</option>
                                                <option value="2">기타</option>
                                            </select>
                                            <label for="RLv">읽기/쓰기</label>
                                            <select name="RLv" id="RLv">
                                                <option value="-1">수준 선택</option>
                                                <option value="0">상</option>
                                                <option value="1">중</option>
                                                <option value="2">하</option>
                                            </select>
                                            <label for="SLv">회화</label>
                                            <select name="SLv" id="SLv">
                                                <option value="-1">수준 선택</option>
                                                <option value="0">상</option>
                                                <option value="1">중</option>
                                                <option value="2">하</option>
                                            </select>
                                        </div>
                                    </div>

                                    <input type="button" class="plus_btn" id="addBtn2" value="＋">
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="content apply_dtl_history" id="resumeHistory">
                        <div class="dtl">
                            <div class="header">
                                경력사항
                            </div>
                            <div class="con add_box">
                                <!-- js를 통해 추가되는 내용 -->
                                <div class="input_box more">
                                    <input type="button" class="minus_btn r" id="delBtn" value="－">
                                    <div class="data_container ">
                                        <div class="detail">
                                            기업
                                            <input type="text" placeholder="기업명">
                                        </div>
                                        <div class="detail">
                                            부서
                                            <input type="text" placeholder="부서명">
                                            직책
                                            <input type="text" placeholder="직책명">
                                        </div>
                                        <div class="detail">
                                            재직기간
                                            <input type="text" placeholder="시작 년/월">~
                                            <input type="text" placeholder="종료 년/월">
                                        </div>
                                        <div class="detail">
                                            직무내용
                                            <textarea name="" placeholder="직무내용" spellcheck="false"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <input type="button" class="plus_btn" id="addBtn3" value="＋">
                            </div>
                        </div>
                    </div>
                    <form action="">
                        <!-- form 설정 -->
                        <div class="content apply_dtl_Edu" id="resumeEdu">
                            <div class="dtl">
                                <div class="header">
                                    학력사항
                                </div>
                                <div class="con add_box">
                                    <!-- js를 통해 추가되는 내용 -->
                                    <div class="input_box more">
                                        <input type="button" class="minus_btn r" id="delBtn" value="－">
                                        <div class="data_container ">
                                            <div class="detail">
                                                학교
                                                <input type="text" placeholder="학교명">
                                            </div>
                                            <div class="detail">
                                                학부
                                                <input type="text" placeholder="학부명">
                                                학과
                                                <input type="text" placeholder="학과명">
                                            </div>
                                            <div class="detail">
                                                재학기간
                                                <input type="text" placeholder="시작 년/월">~
                                                <input type="text" placeholder="종료 년/월">
                                            </div>
                                            <div class="detail">
                                                특이사항
                                                <textarea name="" placeholder="특이사항" spellcheck="false">없음</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="button" class="plus_btn" id="addBtn4" value="＋">
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action="">
                        <!-- form 설정 -->
                        <div class="content apply_dtl_job_edu" id="resumeJobEdu">
                            <div class="dtl">
                                <div class="header">
                                    직무교육
                                </div>
                                <div class="con add_box ">
                                    <!-- js를 통해 추가되는 내용 -->
                                    <div class="input_box more">
                                        <input type="button" class="minus_btn r" id="delBtn" value="－">
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
                                                교육기관
                                                <input type="text" placeholder="시작 년/월">~
                                                <input type="text" placeholder="종료 년/월">
                                            </div>
                                            <div class="detail">
                                                교육내용
                                                <textarea name="" placeholder="교육내용" spellcheck="false"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="button" class="plus_btn" id="addBtn5" value="＋">
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- form 설정 -->
                    <form action="">
                        <div class="content apply_dtl_intro" id="resumeIntro">
                            <div class="dtl">
                                <div class="header">
                                    자기소개서
                                </div>
                                <div class="con add_box">
                                    <!-- js를 통해 추가되는 내용 -->
                                    <div class="input_box text_box">
                                        <input type="text" placeholder="자기소개서 제목 입력">
                                        <input type="button" class="minus_btn r" id="delBtn" value="－">
                                        <div class="data_container">
                                            <textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false"></textarea>
                                        </div>
                                    </div>

                                    <input type="button" class="plus_btn" id="addBtn6" value="＋">
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- form 설정 -->
                    <form action="fileUploadAjax" id="fileForm" method="post" enctype="multi/form-data">
                        <input type="file" accept="image/*" name="att" id="att">
                    </form>
                    <form action="">
                        <div class="content apply_dtl_attch" id="resumeAttach">
                            <div class="dtl">
                                <div class="header">
                                    첨부파일
                                </div>
                                <div class="con add_box">
                                    <!-- js를 통해 추가되는 내용 -->
                                    <div class="input_box ">
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
        <div class="float_right_nav_wrap" id="floatRightNavWrap">
            <div class="float_right_nav">
                <div><a href="#resumeName">이력서제목</a></div>
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
</body>
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
</html>