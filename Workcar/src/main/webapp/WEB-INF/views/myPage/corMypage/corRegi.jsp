<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/resources/jsp/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common/default.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/sidebar.css">
<link rel="stylesheet" type="text/css" href="resources/css/cormypage/corinfo/Mypage_regi_cor.css">
<link rel="stylesheet" type="text/css" href="resources/css/cormypage/corinfo/csch.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/script/Mypage/header.js"></script>
<script src="resources/script/Mypage/Mypage_main_dp.js"></script>
<script src="resources/script/cormypage/corinfo/Mypage_regi_cor.js"></script>
<script src="resources/script/cormypage/corinfo/csch.js"></script>
<script src="resources/script/cormypage/corinfo/corinfo.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
function linkGo(url){
	location.href = url;
}
</script>

<body>

	<main>
		<!-- Tab 버튼 태그 -->
			<div class="main_button_box">
				<button type="button" class="main_button" onclick="linkGo('cmyinfopage')">계정관리</button>
				<button type="button" class="main_button" onclick="linkGo('mngancpage')">채용공고</button>
				<button type="button" class="main_button" onclick="linkGo('sendReq')">활동내역</button>
				<button type="button" class="main_button" onclick="linkGo('cmemAttnd')">관심정보</button>
			</div>
			<!-- 메인 -->
			<div class="main_info">
				<div id="main_regi" class="main_content">
					<!-- 메인 메뉴 -->
					<div class="vertical_menu">
						<a href="#" class="regi_info">개인정보 설정</a> <a href="#"
							class="regi_corpoation">기업정보 설정</a> <a href="#"
							class="regi_update">비밀번호 변경</a>
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
									<p class="main_box_text1">아이디</p>
									<p class="main_box_text2">이름</p>
									<p class="main_box_text3">연락처</p>
									<p class="main_box_text4">이메일 주소</p>
									<p class="main_box_text5">소속</p>
									<p class="main_box_text6">직책</p>
									<p class="main_box_text7">이메일 수신 설정</p>
								</div>
							</div>
							<form action="#" method="post" id="uptinfoc">
								<div class="main_box_text_grid main_box_text_grid1">
									<input type="text" name ="C_ID"  id="C_ID" value="${data.ID}" readonly><Br>
									<input type="text" name ="C_NAME" id="C_NAME" value="${data.NAME}"> 
									<input type="text" name ="C_PHONE" id="C_PHONE" value="${data.PHONE}"> 
									<input type="text" name ="C_EMAIL" id="C_EMAIL" value="${data.EMAIL}">
									<input type="text" name ="C_CNAME"  value="${data.C_NAME}" readonly >
									<Br>
									<input type="text" name ="C_POS" id="C_POS" value="${data.POS}">
									<div class="email_permission">
										<div class="form-group">
											<div>
											
												관심내역 수신동의
													<input type="radio" name="INFOR_AGR" id="c1Y" value="0" <c:if test="${data.INFOR_AGR eq 0}">checked="checked"</c:if>/>
													<label for="custom1Y">동의</label>
													<input type="radio" name="INFOR_AGR" id="c1N" value="1" <c:if test="${data.INFOR_AGR eq 1}">checked="checked"</c:if>/>
													<label for="custom1N">비동의</label>
											</div>
											<div>
													활동내역 수신동의 
													<input type="radio" name="ACT_AGR" id="c2Y" value="0" <c:if test="${data.ACT_AGR eq 0}">checked="checked"</c:if>/>
													<label for="custom2Y">동의</label> 
													<input type="radio"name="ACT_AGR" id="c2N" value="1" <c:if test="${data.ACT_AGR eq 1}">checked="checked"</c:if>/>
													<label for="custom2N">비동의</label>
											</div>
										</div>
									</div>
								</div>
							</form>
							<div class="main_box_text_grid">
								<div class="main_content_button">
									<div class="main_content_button_div main_regi_secession_button">
										<button class="main_regi_secession btn btn-primary"
											data-toggle="modal" data-target=".secession_process">회원탈퇴</button>
										<button id="uptinfo">수정</button>
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="main_box main_box_regi2">
						<div class="main_box_title_position">
							<h3 class="main_box_title main_box_title1">기업정보 설정</h3>
						</div>
						<form action="#" id="uptCpInfoForm" method="post">
							<div>
								<div class="content ">
									<div class="dtl">
										<button type="button" id="uptcpinfo">저장</button>
										<div class="con">
											<div class="company">
												<div class="text">기업로고</div>
													<div class="input">
														<img class="logo" id ="logo" name ="logo" src="">
													</div>
												<div>	
													<button type="button" id="picuptbtn">사진올리기</button>
													<button type="button" id="delpictbtn">파일삭제</button>
												</div>
											</div>

											<div class="company">
												<div class="text">기업명</div>
												<div class="input">
													<input type="text" name="C_CNAME" id ="C_CNAME" value="${data.C_NAME}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">법인등록번호</div>
												<div class="input">
													<input type="text" name="CORP_NO" id="CORP_NO" value="${data.CORP_NO}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">사업자등록번호</div>
												<div class="input">
													<input type="text" name="C_BIZNO" id="C_BIZNO" value="${data.C_BIZNO}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">대표자명</div>
												<div class="input">
													<input type="text" name="C_BOSS" id="C_BOSS" value="${data.C_BOSS}" readonly>
												</div>
											</div>
											<div class="company">
												<div class="text">대표 연락처</div>
												<div class="input">
													<input type="text" id="CP_TEL" name="CP_TEL"  value="${data.C_TEL}" placeholder="대표 연락처">
												</div>
											</div>
											
											<div class="company">
												<div class="text">대표 이메일</div>
												<div class="input">
													<input type="text" id="CP_EMAIL" name="CP_EMAIL" value="${data.C_EMAIL}"  placeholder="대표 이메일">
												</div>
											</div>
											<div class="company">				
												<div class="text">주소검색</div>									
												<div class="input">
												<button type="button" id="schaddr">주소검색</button>	
												</div>		
											</div>
											<div class="company">
												<div class="text">우편번호</div>
												<div class="input">
													<input type="text" id="ZIP" name ="ZIP" value="${data.ZIP}" readonly placeholder="우편번호">
												</div>
											</div>
											<div class="company">
												<div class="text">주소</div>
												<div class="input">
													<input type="text" id="ADDR" name="ADDR" readonly placeholder="주소" value="${data.ADDR}">
												</div>
											</div>
											<div class="company">
												<div class="text">상세주소</div>
												<div class="input">
													<input type="text" id="ADDR_DTL" name ="ADDR_DTL" placeholder="상세주소" value="${data.ADDR_DTL}">
												</div>
											</div>

											<div class="company">
												<div class="text">홈페이지 주소</div>
												<div class="input">
													<input type="text" name="C_HPAGE" id="C_HPAGE" value="${data.C_HPAGE}" placeholder="홈페이지 주소">
												</div>
											</div>
											<input type ="hidden" name ="CORP_IMG" id="CORP_IMG" value ="${data.CORP_IMG}">

										</div>
										

										
									</div>
								</div>

							</div>
						</form>
			
		<div id="fileFormh">	
			<form id="cprofileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
				<input type="file" name="cprofile" id="cprofile" >
			</form>	
		</div>
				
				


</div>					

					<div class="main_box main_box_regi3">
						<div class="main_box_title_position">
							<h3 class="main_box_title main_box_title1">비밀번호 변경</h3>
						</div>
						<form action="#" id="changePass" method="post">
							<input type="hidden" name="ID" id="ID" value="${data.ID}">
							<div class="main_box_text_grid">
								<p>현재 비밀번호</p>
								<input type="password" id ="nowpass" name ="nowpass">
								<input class="chkpassbtn" type="button" id ="chkPassBtn" value="비밀번호확인">
							
								<p>새 비밀번호</p>
								<input type="password" id ="newpass" name ="newpass" placeholder="새로운 비밀번호"> 
								<input type="password" id="newpasschk" name="newpasschk" placeholder="비밀번호 확인">
							</div>
						</form>
						<div class="main_box_text_grid">
							<div class="main_content_button">
								<div class="main_content_button_div main_content_button_div1">
									<button id ="chgePassBtn">비밀번호 변경</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 -->
		</div>
		<div class="secession_process modal fade bd-example-modal-xl"
			tabindex="-1" role="dialog" aria-labelledby="process_title"
			aria-hidden="true" id ="modal">
			<div class="modal-dialog .modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="process_title">회원 탈퇴</h3>
					</div>
					<div class="modal-body">
					<form id ="outpassform">
						<div class="modal_last_pw">
						   <input class="form-control" type="hidden" name="ID" id="ID" value="${data.ID}">
							<div class="modal_subject" aria-placeholder="현재 비밀번호 입력">비밀번호확인</div>
							<input type="password" name="outpasschk" id="outpasschk"  class="form-control">
						</div>
					</form>
						<div class="modal_last_notification">
							<div class="modal_subject modal_notification">탈퇴 안내 사항</div>
							<div>
								<p>
									<strong>탈퇴 후 회원정보가 모두 삭제됩니다.</strong><br/> 메일주소, 핸드폰 번호/기타 연락처
									등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
								</p>
								<p>
									<strong>탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</strong><br/> 각 게시판에 등록한
									게시물 및 댓글은 탈퇴 후에도 남아있습니다. 삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다. (탈퇴
									후에는 게시글 임의 삭제 요청을 받지 않습니다.)
								</p>
							</div>
						</div>
						<div class="modal_button">
							<button id ="outmember" class="btn btn-primary submit modal-btn">처리</button>
							<button class="btn btn-primary modal-btn" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	
	<div class="pop-container">
        <div class="pop-out-container">
        <button type="button" class="pop-close-btn">X</button>
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1>기업검색</h1>
                </div>

                <form class="pop-user" id="companySchForm">
                	<input type="hidden" name="page" id="page" value="1">
                	<input type="hidden" name="itemCnt" id="itemCnt">
                    <div class="pop-input">
                        <input type="button" id="schBtn" value="검색">
                        <input type="text" name="schCName" id="schCName" placeholder="기업명">
                    </div>
                </form>

                <!-- 5개 리스트 -->
                <div class="company_wrap">
                    <table>
                        <thead>
                            <tr>

                            </tr>
                        </thead>
                        <tbody>
                            <!-- ㅇ -->
                            <tr>

                            </tr>
                            <!-- ㅇ -->
                        </tbody>
                    </table>
                </div>
                <div class="paging_wrap"></div>
                <hr>
            </div>
        </div>
    </div>
	
<%@include file="/resources/jsp/footer.jsp"%>
	
</body>
</html>