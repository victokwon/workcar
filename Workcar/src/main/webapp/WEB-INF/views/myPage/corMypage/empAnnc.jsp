<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/resources/jsp/header.jsp"%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일력거</title>
	<link rel="stylesheet" type="text/css" href="resources/css/common/default.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css">
    <link rel="stylesheet" href="resources/css/empannc/empannc.css">
    <link rel="stylesheet" type="text/css" href="resources/css/resume/pop.css">


<body>
    <main>

		<div class="main_button_box">
			<div class="main_button_box">
				<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" class="main_button" onclick="linkGo('mngancpage')">이력서관리</button>
				<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
			</div>

			<div class="main_info">
				<input type="hidden" name="MEM_NO" value="${data.MEM_NO}">

				<div id="main_apply" class="main_content">

					         <div class="vertical_menu">

                 
                    <a href="#" id="jobPost">채용공고 관리</a>
                    
                    <a href="#" id="jobResume">받은 이력서</a>
                </div>

					<div class="main_box">
					<form action="#" id="uptForm1" method="post" class="form1" >
						<input type="hidden" name="MEM_NO" value="${data.MEM_NO}">
						<div class="tilte">
							<div class="header">
								<div class="job_post_title">
									<input type="text" placeholder="공고이름을 입력하세요" class="headline" NAME="EMP_TITLE" id="EMP_TITLE" >
								</div>
							</div>
						</div>
	
							<div class="content " id="recru_info">
								<div class="dtl">
									<div class="header">채용정보</div>
									<div class="con">
										<div class="input_box">
											<div class="name">
												<div class="text">업종</div>
												<div class="input">
													<input type="hidden" id="SECTOR_NO" name="SECTOR_NO" readonly />
													<input type="text" id="SECTOR_NAME" name="SECTOR_NAME" readonly />
													<button type="button" id="sectorBtn" btn="s">업종 검색</button>
												</div>
											</div>
											<div class="count">
												<div class="text">모집인원</div>
												<div class="input">
													<input type="text" placeholder="모집인원" name="EMP_PER"  id="EMP_PER">명
												</div>
											</div>
											<div class="type">
												<div class="text">모집조건</div>
												<div class="input">
													<input type="radio" name="EMP_GBN" value="0" id="type0">
													<label for="type0">정규직</label> 
													<input type="radio"name="EMP_GBN" value="1" id="type1"> 
													<label for="type1">계약직</label>
													<input type="radio" name="EMP_GBN" value="2" id="type2">
													<label for="type2">시간제</label>
													<input type="radio" name="EMP_GBN" value="3" id="type3">
													<label for="type3">기타</label>
												</div>
											</div>
											<div class="sal">
												<div class="text">급여(월)</div>
												<div class="input">
													<input type="radio" name="PAY_GBN" value="0" id="sal0">
													<label for="sal0">내규</label> 
													<input type="radio" name="PAY_GBN" value="1" id="sal1"> 
													<label for="sal1">일반</label>
													<input type="text" placeholder="최저금액" id="minSal" name="PAY_MIN" disabled>만 원
													~ 
													<input type="text" placeholder="최대금액" id="maxSal" name="PAY_MAX" disabled>만 원
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="#" id="uptForm2" method="post" class="form1">
							<div class="content" id="recru_condition">
								<div class="dtl">
									<div class="header">자격요건</div>
									<div class="con">
										<div class="profile0"></div>
										<div class="input_box">
											<div class="edu">
												<div class="text">최종학력</div>
												<div class="input">
													<input type="radio" name="GRADU" id="edu0"  value="0">
													<label for="edu0">무관</label> 
													<input type="radio"name="GRADU" id="edu1"  value="1"> 
													<label for="edu1">고등학교</label> 
													<input type="radio" name="GRADU" id="edu2" value="2"> 
													<label for="edu2">전문대학</label>
													<input type="radio" name="GRADU" id="edu3" value="3">
													<label for="edu3">대학교</label> 
													<input type="radio" name="GRADU" id="edu4" value="4"> 
													<label for="edu4">석사</label>
													<input type="radio" name="GRADU" id="edu5" value="5">
													<label for="edu5">박사</label>
												</div>
											</div>
											<div class="major">
												<div class="text">전공</div>
												<div class="input">
													<input name="MAJOR" type="text" placeholder="전공">
												</div>
											</div>
											<div class="career">
												<div class="text">경력</div>
												<div class="input">
													<input type="radio" name="CARR" id="career0" value="0">
													<label for="career0">무관</label> 
													<input type="radio"name="CARR" id="career1" value="1">
													<label for="career1">신입</label>
													<input type="radio" name="CARR" id="career2" value="2">
													<label for="career2">경력</label>
												
											
													<input type="text" id="CARR_Y" NAME="CARR_Y" style="width:20px; height:20px;" disabled> 년
												<!-- 	~ <input type="text" placeholder="0" id="maxCareer"
														disabled>년 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="#" id="uptForm3" method="post">
							<div class="content apply_dtl_lisence" id="resumeLisence">
								<div class="dtl">
									<div class="header">자격증</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
<!-- 										<div class="input_box ">
											<input type="button" class="minus_btn" id="delBtn" value="－">
											<div class="data_container">
												자격증 검색 api 팝업창
												<input type="button" class="" id="lisenceSchBtn"
													value="자격증 검색"> <input type="text"
													value="데이터 / 자격증명" readonly>
											</div>
										</div> -->
										<input type="button" class="plus_btn" id="addBtn1" value="＋">
									</div>
								</div>
							</div>
						</form>

<!-- 						<form action="fileUploadAjax" id="fileForm" method="post"
							enctype="multi/form-data">
							<input type="file" accept="image/*" name="att" id="att">
						</form> -->
						<form id="empFileForm" action="empFileAploadAjax" method="post">
							<div class="content apply_dtl_attch" id="resumeAttach">
								<div class="dtl">
									<div class="header">첨부파일</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
										<div class="input_box ">
											<!-- <input type="button" class="minus_btn" id="delBtn" value="－"> -->
											<div class="data_container file_container">
												파일이름 : <input type ="text" id="showName" name="showName" disabled>
												<input type="hidden" id="ATTCH_NAME" name="ATTCH_NAME">
												<button type="button" id="empFileUploadBtn">파일업로드</button>
												<button type="button" id="empFileUpDelBtn">파일삭제</button>
											</div>
										</div>

										<!-- <input type="button" class="plus_btn" id="addBtn7" value="＋"> -->
									</div>
								</div>
							</div>
						</form>
						
						
						<form action="#" id="uptForm4" method="post">
							<div class="content " id="">
								<div class="dtl">
									<div class="header">채용정보 세부 사항</div>
									<div class="con add_box">
										<!-- js를 통해 추가되는 내용 -->
										<div class="input_box text_box">
											<div class="data_container">
												<textarea name="DTL" id="DTL" placeholder="채용정보 세부 사항" 
													spellcheck="false"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="content " id="showImgFileDiv">
							<div class="dtl">
								<div class="header">파일 이미지 미리보기</div>
								<div class="con add_box">
									<!-- js를 통해 추가되는 내용 -->
									<div class="input_box text_box">
										<div class="data_container">
											<img src="" name="empFileShow" id="empFileShow">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="right">
						<form action="#" id="uptForm5" method="post">
							<div class="content " id="recru_info">
								<div class="dtl">
									<div class="header">채용정보</div>
									<div class="con">
										<div class="input_box">
											<div class="name">
												<div class="text">성명</div>
												<div class="input">
													<input type="text" value="${data.NAME}"  readonly>
												</div>
											</div>
											<div class="dept">
												<div class="text">부서</div>
												<div class="input">
													<input type="text" value="${data.POS}" readonly>
												</div>
											</div>
											<div class="phone">
												<div class="text">연락처</div>
												<div class="input">
													<input type="text" value="${data.PHONE}" readonly>
												</div>
											</div>
											<div class="email">
												<div class="text">이메일</div>
												<div class="input">
													<input type="text" value="${data.EMAIL}" readonly>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="uptempannc" id="uptForm6" method="post">
							<div class="content " id="">
								<div class="dtl">
									<div class="header">진행사항</div>
									<div class="con ">
										<div class="input_box">
											<div class="start">
												<div class="text">공고일</div>
												<div class="input">
													<input type="date" name="REG_DATE" id="REG_DATE" size="5" placeholder="공고일">
												</div>
											</div>
											<div class="end">
												<div class="text">마감일</div>
												<div class="input">
													<input type="date" name="DLINE" id="DLINE" placeholder="마감일">
												</div>
											</div>
											<div class="method">
												<div class="text">서류</div>
												<div class="input">
													<input type="checkbox" name="EMP_DOC" value="0" > 
													<label for="method0">이력서</label> <br>
													<input type="checkbox" name="EMP_DOC" value="1"  > 
													<label for="method1">경력기술서</label> <br>
													<input type="checkbox" name="EMP_DOC" value="2" > 
													<label for="method2">포트폴리오</label> <br>
													<input type="checkbox" name="EMP_DOC" value="3" >
													<label for="method3">기타</label>
												</div>
											</div>
											<div class="apply">
												<div class="text">전형</div>
												<div class="input">
													<input type="checkbox" name="EMP_PRCS" value="0" >
													<label for="apply0">서류전형</label> <br> <input
														type="checkbox" name="EMP_PRCS" value="1" >
													<label for="apply1">면접</label> <br> <input
														type="checkbox" name="EMP_PRCS" value="2" >
													<label for="apply2">인적성검사</label> <br> <input
														type="checkbox" name="EMP_PRCS" value="3" >
													<label for="apply3">기타</label>
												</div>
											</div>
											<!--                                         <div class="apply">
                                            <div class="text">서류</div>
                                            <div class="input">
                                                <input type="text" placeholder="제출서류">
                                            </div>
                                        </div> -->
										</div>
									</div>
								</div>
							</div>
						</form>

						<form action="#" id="findregionAjax" method="post">
							<div class="content " id="">
								<div class="dtl">
									<div class="header">근무지</div>
									<div class="con ">
										<div class="input_box">
											<div class="location">
												<div class="input">
													<select name="CITY" id="CITY">
														<option value="-1">도/광역시 선택</option>
														<option value="0">강원</option>
														<option value="1">경기</option>
														<option value="2">경남</option>
														<option value="3">경북</option>
														<option value="4">광주</option>
														<option value="5">대구</option>
														<option value="6">대전</option>
														<option value="7">부산</option>
														<option value="8">서울</option>
														<option value="9">울산</option>
														<option value="10">인천</option>
														<option value="11">전남</option>
														<option value="12">전북</option>
														<option value="13">제주</option>
														<option value="14">충남</option>
														<option value="15">충북</option>
													</select> 
													<select name="REGION" id="REGION">
											<!-- 			<option value="-1">시/군/구 선택</option> -->
													</select>
													<!-- <div class="location_dtl">세부주소 검색</div> -->
													<!--   <button type="button">근무지 검색</button> -->
												</div>
											</div>
											<!-- 위치 api -->
											<!-- 지도 검색 api -->
										</div>
									</div>
								</div>
							</div>
						</form>

							<form class="content " id="uptForm7" method="post">
								<div class="dtl">
									<div class="header">저장</div>
									<div class="con ">
										<div class="input_box">
											<div class="location">
												<div class="input">
													<select name="RECRUIT_GBN" id="RECRUIT_GBN">
														<option value="-1">공개 여부 선택</option>
														<option value="0">공개</option>
														<option value="1">비공개</option>
													</select>
												 <button type="button" id="uptBtn">저장</button> 
												</div>
											</div>
											<!-- 위치 api -->
											<!-- 지도 검색 api -->
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>

		<div id="empfile">	
			<form id="empfileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
				<input type="file" name="empanncfile" id="empanncfile" >
			</form>	
		</div>


	<div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1></h1>
                </div>
                <form class="pop-user" id="schForm">
                    <input type="hidden" name="page" id="page" value="${page}">
                    <div class="pop-input">
                        <input type="button" class="sch-btn" id="schSectorBtn" value="검색">
                        <input type="button" class="sch-btn" id="schQualBtn" value="검색">
                        <input type="text" name="schDataName" id="schName" placeholder="검색어">
                    </div>
                </form>
                <!-- 5개 리스트 -->
                <div class="list_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th class='td_no'>번호</th>
                                <th class='td_name'>내용</th>
                            </tr>
                        </thead>
                        <tbody id="list_box" no="">
                        </tbody>
                    </table>
                </div>
                <div class="paging_wrap"></div>
                <hr>
            </div>
        </div>
    </div>

	</main>



<%@include file="/resources/jsp/footer.jsp"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/script/cormypage/empannc/header.js"></script>
<script src="resources/script/cormypage/empannc/mainbox.js"></script>
<script src="resources/script/cormypage/empannc/empannc.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/cormypage/empannc/sector.js"></script>
<script type="text/javascript" src="resources/script/cormypage/empannc/qual.js"></script>
<script type="text/javascript">
  	function linkGo(url) {
	location.herf = url
}
 </script>
</body>
</html>
