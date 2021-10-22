<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
    <script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
   
</head>
<script>
$(function () {
	 reloadList(); 
	 
	 $(".page1").on("click", "span", function(){
	      $("#page").val($(this).attr("page"));
	      
	      reloadList();
	   });
})
function reloadList() {
	var params = $("#actionForm").serialize();    /* serialize:데이터를 문자열로 변환시켜주는 함수 */
													/* form의 데이터를 문자열로 변환 */
	/* j쿼리에 있는 ajax를 호출한 것 */
	$.ajax({
		url: "personListAjax", /* 접속주소 */
		type: "post",   /* 전송방식 */
		dataType: "json", /* 받아 올 데이터 형태(타입) */
		data: params,  /* 보낼 데이터(문자열 형태) */
		success: function(res){ /* ajax 통신이 성공 시 다음 함수 실행 */
			console.log(res.list)
			console.log(res.pb)
			drawList(res.list);
			drawPaging(res.pb);
		}, 
	error: function(request,status,error){ /* ajax 통신이 실패 시 다음 함수 실행 */
		console.log(error);
	}
	})
}

function drawList(list) {
	console.log(list);
	var html="";
	 
	for(var data of list) {        
		html += " <a href=\"#\" class=\"card\">                ";
		html += "     <p>이력서번호 :  "+ data.RNUM + "</p>            ";
        html += "     <p>인재명 :"+ data.NAME +"</p>            ";
        html += "     <p>희망직종 :"+ data.SECTOR_NO+" </p>      ";
        html += "     <p>희망근무지역 :"+ data.REGION_NO +" </p>  ";
        html += "     <p>등록일 :"+ data.DT +" </p>              ";
     	html += " </a>        ";
	}                                
	
	$(".mySlides").html(html);
}


function drawPaging(pb) {
	   var html = "";
	   
	   if($("#page").val() == "1") {
	      html += "<span page=\"1\" class=\"prev\" \">&#10094;</span>      ";
	   } else {
	      html += "<span class=\"prev\" page=\"" + ($("#page").val() * 1 - 1) + "\">&#10094;</span>      ";
	   }                                  
	                                    
	   for(var j = pb.startPcount ; j <= pb.endPcount ; j++) {
	      if($("#page").val() == j) {
	         html += "<span class=\"dot\"  page=\"" + j + "\" style=\"background-color:#717171\"> </span>  ";
	      } else {
	         html += "<span class=\"dot\"  page=\"" + j + "\"> </span>  ";
	      }
	   }                                    
	   
	   if($("#page").val() == pb.maxPcount) {
	      html += "<span class=\"next\"  page=\"" + pb.maxPcount + "\">&#10095;</span>      ";
	   } else {
	      html += "<span class=\"next\"  page=\"" + ($("#page").val() * 1 + 1) + "\">&#10095;</span>      ";
	   }
	   
	   $(".page1").html(html);
	}

</script>
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
                <span class="total_cnt">총 ${cnt}건</span>
                <div class="mySlides">
               		<%-- <c:forEach var="data9" items="${data9}">
	                    <a href="#" class="card">
	                        <p>인재명 : ${data9.NAME}</p>
	                        <p>희망직종 :${data9.SECTOR_NO}</p>
	                        <p>희망근무지역 :${data9.REGION_NO}</p>
	                        <p>등록일 : ${data9.DT}</p>
	                    </a>
                    </c:forEach> --%>
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
                                        <div class="input">${data1.NAME}</div>
                                    </div>
                                    <div class="gender">
                                        <div class="text">성별</div>
                                        <div class="input">
                                            <label for="male">${data1.GENDER}</label>
                                        </div>
                                    </div>
                                    
                                    <div class="location">
                                        <div class="text">거주지역</div>
                                        <div class="input">
                                            ${data1.ADDR} ${data1.ADDR_DTL}
                                        </div>
                                    </div>
                                    <div class="edu">
                                        <div class="text">최종학력</div>
                                        <div class="input">
                                            ${data1.GRADU}
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
                                           ${data2.SNO}
                                        </div>
                                    </div>
                                    <div class="hope_loc">
                                        <div class="text">희망근무지역</div>
                                        <div class="input">
                                            ${data2.RNO}
                                        </div>
                                    </div>
                                    <div class="work_format">
                                        <div class="text">근무형태</div>
                                        <div class="input">
                                             ${data2.WTYPE}
                                        </div>
                                    </div>
                                    <div class="sal">
                                        <div class="text">희망연봉</div>
                                        <div class="input">${data2.RPAYMIN}만원 - ${data2.RPAYMAX}만원
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
                               		 <c:forEach var="data3" items="${data3}">
	                                    <div class="data_container">
	                                        <!-- 자격증 검색 api 팝업창 -->
	                                        <span>${data3.RT}</span>
	                                        <span>${data3.PD}</span>
	                                        <span>${data3.IA}</span>
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
                                <c:forEach var="data8" items="${data8}">
                                    <div class="data_container">
                                        <span>${data8.FNAME}</span>
                                        <span>읽기/쓰기 :</span>
                                        <span>${data8.FG}</span>
                                        <span>회화 :</span>
                                        <span>${data8.FG}</span>
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
                                        <span>${data4.RCNAME}</span>
                                    </div>
                                    <div class="detail">
                                        부서
                                        <span>${data4.RCDP}</span>
                                        직책
                                        <span>${data4.RCP}</span>
                                    </div>
                                    <div class="detail">
                                        재직기간
                                        ${data4.RCST} ~ ${data4.RCED}
                                    </div>
                                    <div class="detail">
                                        직무내용
                                        <textarea name="" placeholder="직무내용" spellcheck="false"
                                            disabled>${data4.RCCT}</textarea>
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
                                            <input type="text" placeholder="학교명" value="${data5.SCNAME}">
                                        </div>
                                        <div class="detail">
                                            학부
                                            <input type="text" placeholder="학부명" value="${data5.RESOL}">
                                            학과
                                            <input type="text" placeholder="학과명" value="${data5.REMAJOR}">
                                        </div>
                                        <div class="detail">
                                            재학기간
                                            <input type="text" placeholder="시작 년/월" value="${data5.REST}">~
                                            <input type="text" placeholder="종료 년/월" value="${data5.REED}">
                                        </div>
                                        <div class="detail">
                                            특이사항
                                            <textarea name="" placeholder="특이사항" spellcheck="false"
                                                readonly>${data5.REEE}</textarea>
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
                                            <input type="text" placeholder="${data6.EDUNAME}">
                                        </div>
                                        <div class="detail">
                                            훈련과정
                                            <input type="text" placeholder="${data6.COSENAME}">
                                        </div>
                                        <div class="detail">
                                            교육기간
                                            <input type="text" placeholder="${data6.ST}">~
                                            <input type="text" placeholder="${data6.ED}">
                                        </div>
                                        <div class="detail">
                                            교육내용
                                            <textarea name="" placeholder="${data6.CNT}" spellcheck="false"></textarea>
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
                                    <input type="text" placeholder="자기소개서 제목 입력" value="${data7.HENAME}" disabled>
                                    <div class="data_container">
                                        <textarea name="" placeholder="자기소개서 내용 입력" spellcheck="false"
                                            readonly>${data7.SINTRONAME}</textarea>
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