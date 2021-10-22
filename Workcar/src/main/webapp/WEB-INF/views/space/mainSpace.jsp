<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
    
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/mainbox.css" />
<link rel="stylesheet" type="text/css" href="resources/css/space/space.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	/* if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	}
	
	if("${page}" > "${pb.maxPcount}") { //데이터 변조로 인하여 페이지가 총페이지를 넘어가는 경우
		$("#page").val()("${pb.maxPcount}");
		$("#searchForm").submit();
	}
	
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#dtlForm").submit();
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#searchForm").submit();
	}); //searchBtn click end */
	
	$("#personalSpaceBtn").on("click", function() {
		location.href = "personalSpace";
	});
	
	$("#ntcSpaceABListABListBtn").on("click", function() {
		location.href = "ntcSpaceABListABList";
	});
	
	$("#quesSpaceBtn").on("click", function() {
		location.href = "quesSpace";
	});
	
	/* $("#pagingWrap").on("click", "span", function() {
		$("#searchTxt").val($("#oldTxt").val());
		$("#page").val($(this).attr("page"));
		$("#searchForm").submit();
	});
	
	$("#loginBtn").on("click", function() {
		location.href = "testLogin";
	});
	$("#logoutBtn").on("click", function() {
		location.href = "testLogout";
	}); */
}); //document ready end
</script>
</head>
<body>
<!-- 헤더 -->
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

    <!-- 클래스명, 아이디명 수정-->
    <!--  -->
    <main>

        <div class="main_button_box">
            <!--<button class="main_button" onclick="openPage('main_regi', this)" id="defaultOpen">이용약관</button>
            <button class="main_button" onclick="openPage('main_apply', this)" id="personalSpaceBtn">개인정보처리방침</button>
            <button class="main_button" onclick="openPage('main_act', this)" id="ntcSpaceABListBtn">공지사항</button>
            <button class="main_button" onclick="openPage('main_inter', this)" id="quesSpaceBtn">자주하는질문</button> -->
            <input type="button" class="main_button" onclick="openPage('main_regi', this)" value="이용약관" id="defaultOpen" />
            <input type="button" class="main_button" onclick="openPage('main_apply', this)" value="개인정보처리방침" id="personalSpaceBtn" />
            <input type="button" class="main_button" onclick="openPage('main_act', this)" value="공지사항" id="ntcSpaceABListBtn" />
            <input type="button" class="main_button" onclick="openPage('main_inter', this)" value="자주하는질문" id="quesSpaceBtn" /> 
        </div>

        <div class="main_info">
            <div id="main_regi" class="main_content">
                <div class="vertical_menu">
                    <div><br/><h3>이용약관</h3>
                        <div class="apply_content">
                            <br/><h4>제1조(목적)</h4>
                            <br/><p>이 약관은 일력거가 무료로 제공하는 웹서비스(이하 "서비스"라 한다)에 대한 이용 조건 및 운영 절차에 관한 사항을 규정함을 목적으로 합니다.</p>
                            <br/><h4>제2조 (약관의 명시와 개정)</h4>
                            <br/><p> ① 일력거는 이 약관의 내용과 주소지, 대표자명, 개인정보관리책임자명, 연락처(전화, 팩스, 전자우편주소 등) 등을 이용자가 알 수 있도록 당 사이트의 초기화면(전면)에 게시합니다.
                                <br/>② 일력거는 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용 촉진 및 정보보호이용등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 약관을 개정할 경우에는 적용일자 등을 명시하여 현행약관과 함께 당 사이트에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
                                <br/>③ 일력거는 귀하가 본 약관 내용에 동의하는 것을 조건으로 귀하에게 서비스를 제공할 것이며, 귀하가 본 약관의 내용에 동의하는 경우, 당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다.
                                <br/>④ 이 약관에 동의하는 것은 정기적으로 당 사이트를 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 당 사이트에서 책임지지 않습니다.
                                <br/>⑤ 당 사이트 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
                                <br/> ⑥ 본 약관에 명시되지 않은 사항은 관계 법령에 규정 되어있을 경우 그 규정에 따르며, 그렇지 않은 경우에는 일반적인 관례에 따릅니다.</p>
                                <br/><h4>제3조 (계약사항의 변경)</h4>
                                <br/> <p>이용자는 다음 사항을 변경하고자 하는 경우 서비스에 접속하여 서비스 내의 기능을 이용하여 변경할 수 있습니다.

                                <br/> ① 개인 이력사항
                                <br/> ② 비밀번호
                                <br/> ③ 기타 일력거가 인정하는 사항</p>
                                <br/><h4>제4조 (개인정보보호)</h4>
                                <br/> <p>1. 일력거는 정보통신이용촉진등에 관한 법률등 관계법령에 따라 제공받는 이용자의 개인정보 및 서비스 이용 중 생성되는 개인정보를 보호하여야 합니다.
                                    <br/>2. 당 사이트의 관리책임자는 관리담당 부서장이며,개인정보 관리책임자의 성명은 별도로 공지하거나 서비스 안내에 게시합니다.
                                    <br/>3. 이용자가 자신의 개인정보를 전송 등의 방법으로 당 사이트에 제공하는 행위는 일력거의 개인정보 수집 및 이용 등에 동의하는 것으로 간주되며, 당 사이트의 이용자 개인정보의 수집 및 이용목적은 다음 각 호와 같습니다.
                                <br/>① 서비스 제공 등 이용계약의 이행
                                <br/>② 마케팅 정보 생성 및 이용 고객별 안내
                                <br/>③ 광고 전송 또는 우송
                                <br/>4. 일력거는 개인정보를 이용고객의 별도의 동의 없이 제3자에게 제공하지 않습니다. 다만, 다음 각 호의 경우는 이용고객의 별도 동의 없이 제3자에게 이용고객의 개인정보를 제공할 수있습니다.
                                <br/>① 수사상의 목적에 따른 수사기관의 서면 요구가 있는 경우에 수사협조의 목적으로 국가수사 기관에 성명, 주소 등 신상정보를 제공하는 경우
                                <br/>② 신용정보의 이용 및 보호에 관한 법률, 전기통신관련법률 등 법률에 특별한 규정이 있는 경우
                                <br/>③ 통계, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
                                <br/>5. 이용자는 자신의 개인정보를 열람할 수 있으며, 오류 수정 등 변경할 수 있습니다. 열람 및 변경은 원칙적으로 이용신청과 동일한 방법으로 하며, 자세한 방법은 당 사이트의 공지사항안내 등의 정한 바에 따릅니다.
                                <br/>6. 이용자는 이용계약을 해지함으로써 개인정보의 수집 및 이용에 대한 동의, 목적 이외의 사용에 대한 별도 동의, 제3자 제공에 대한 별도 동의를 철회할 수 있으며, 해지방법은 본 약관에서 별도로 규정한 바에 따릅니다.</p>
                            <h4></h4>
                            <p></p>
                            <h4></h4>
                            <p></p>
                            <h4></h4>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
            
        for (i = 0; i < acc.length; i++) {
          acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
              panel.style.display = "none";
            } else {
              panel.style.display = "block";
            }
          });
        }

        

    </script>
    <script>
        $(function () {
            $(".writeBtn").on("click", function () {
                $(".write").css({"display" :"block" });
                $(".list").css({"display" : "none"});

            })

            $(".addBtn").on("click", function () {
                $(".write").css({"display" :"none" });
                $(".list").css({"display" : "block" });

            })
        });
        
        // $(function () {
            
        // });
    </script>
    
    <!-- 바닐라스크립트 로드 -->
    <script type="text/javascript" src="resources/script/Mypage/header.js"></script>
    <script type="text/javascript" src="resources/script/space/mainbox.js"></script>
    
</body>
</html>