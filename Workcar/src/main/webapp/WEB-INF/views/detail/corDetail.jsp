<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common/default.css">
<link rel="stylesheet" href="resources/css/common/header.css">
<link rel="stylesheet" href="resources/css/detail/sidebar.css">
<link rel="stylesheet" href="resources/css/detail/footer.css">
<link rel="stylesheet" href="resources/css/detail/detail.css">
<link rel="stylesheet" href="resources/css/detail/paging.css">
<link rel="stylesheet" href="resources/css/detail/rating.css">
<link rel="stylesheet" href="resources/css/bootstap/bootstrap.css">

<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>

<script src="resources/script/bootstap/bootstrap.js"></script>
<script src="resources/script/Mypage/header.js"></script>
<script src="resources/script/Mypage/Mypage_main_dp.js"></script>
<script type="text/javascript"
	src="resources/script/detail/corpor_dtl_paging.js"></script>
 <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ccb33b4781aed7d9d9321c853fa3055&libraries=services"></script> 
<script type="text/javascript">
$(function () {
	
	$(".star_rating").each(function(idx){
		let score = $(this).attr("score")
			html = ''
		for(let i = 0; i<Math.round(score); i++){
			html+= '	    <span class="fa fa-star checked"></span>             '
		}
		for(let i = 0; i<5-Math.round(score); i++){
			html+= '	    <span class="fa fa-star"></span>             '
		}
		$(this).html(html)
	})
})
</script>
</head>
<body>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" id="page" name="page" value="${page}"> 
		<input type="hidden" id="cRNo" name="cRNo" value="">
	</form>
	
<%@include file="/resources/jsp/header.jsp"%>	
		<main class="main">
			<div class="left_main_menu">
				<div class="vertical-menu">
					<a href="#" class="active">List</a>
					<div class="mySlides"></div>
				</div>
				<div class="page1"></div>
			</div>
			<hr>
			<div class="main_profile">
				<div class="main_profile_div">
					<div class="main_title">
						<div id="profile"></div>
						<h1>${corpor_info.C_NAME}</h1>
					</div>
				</div>
				<div>
					<div class="main_detail_1">
						<p>????????? : ${corpor_info.BOSS }</p>
						<p>??????:${corpor_info.SECTOR_NAME}</p>
						<p>
							???????????? ??????: <a href="${corpor_info.HPAGE}">${corpor_info.HPAGE}</a>
						</p>


					</div>
					<hr>
					<div class="main_detail_2">
						<p>????????? ??? ${corpor_info.WRK_CNT} ???</p>
						<p>????????? ${corpor_info.SALES_AMOUNT} ???</p>
						<p>???????????? ${corpor_info.LIST_CHK }</p>
						<p>?????????</p>
					</div>
					<script>				
					/* 	$(function () {
						    		for (var i=1; i<=  ${rating.TOTAL}; i++) { 
						    		$(".total_rating"+i).addClass("checked");
						    		}
						    		
						    		for (var i=1; i<=  ${rating.WLB}; i++) { 
							    	$(".work_rating"+i).addClass("checked");
							    	}
						    		
						    		for (var i=1; i<=  ${rating.PROMO_POSS}; i++) { 
							    	$(".promotion_rating"+i).addClass("checked");
							    	}
						    		
						    		for (var i=1; i<=  ${rating.C_CULT}; i++) { 
							    		$(".culture_rating"+i).addClass("checked");
							    		}
						    		for (var i=1; i<=  ${rating.WFARE_PAY}; i++) { 
							    		$(".welfare_rating"+i).addClass("checked");
							    		}
						    		for (var i=1; i<=  ${rating.MGM}; i++) { 
							    		$(".management_rating"+i).addClass("checked");
							    		}
						}); */
					</script>
					<c:if test="${!empty sMNo }">
						<button class="main_detail_repport main_report_status btn btn-primary"
							data-toggle="modal" data-target=".star_process">????????????</button>
					</c:if>
						<div class="main_rating">
						<h3>??? ??????</h3>
						<div class="star_rating total_rating" score="${rating.TOTAL }">
						</div>
					</div>
					<div class="main_rating">
						<h3>????????? ?????? ??????</h3>
						<div class="star_rating work_rating" score="${rating.WLB }">
						</div>
					</div>
					<div class="main_rating">
						<h3>???????????? ??? ?????????</h3>
						<div class="star_rating promotion_rating" score="${rating.PROMO_POSS }">
						</div>
					</div>
					<div class="main_rating">
						<h3>????????????</h3>
						<div class="star_rating culture_rating" score="${rating.C_CULT }">
						</div>
					</div>
					<div class="main_rating">
						<h3>?????? ??? ??????</h3>
						<div class="star_rating welfare_rating" score="${rating.WFARE_PAY }">
						</div>
					</div>
					<div class="main_rating">
						<h3>?????????</h3>
						<div class="star_rating management_rating" score="${rating.MGM }">
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="right_main_menu">
				<p>????????? ??????</p>
				<p>?????? : ${corpor_info.NAME}</p>
				<p>?????? : ${corpor_info.POS}</p>
				<p>????????? : ${corpor_info.PHONE}</p>
				<p>????????? : ${corpor_info.EMAIL}</p>
				<p>
					?????? ?????? : <span id="mapaddress">${corpor_info.ADDR}
						${corpor_info.ADDR_DTL}</span>
				</p>
				<div id="map" style="width: 100%; height: 350px;"></div>

			 	<script>
					var mapContainer = document.getElementById('map'), // ????????? ????????? div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
						level : 3
					// ????????? ?????? ??????
					};

					// ????????? ???????????????    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// ??????-?????? ?????? ????????? ???????????????
					var geocoder = new kakao.maps.services.Geocoder();

					// ????????? ????????? ???????????????
					geocoder
							.addressSearch(
									'${corpor_info.ADDR} ${corpor_info.ADDR_DTL}',
									function(result, status) {

										// ??????????????? ????????? ??????????????? 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// ??????????????? ?????? ????????? ????????? ???????????????
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// ?????????????????? ????????? ?????? ????????? ???????????????
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">${corpor_info.C_NAME}</div>'
													});
											infowindow.open(map, marker);

											// ????????? ????????? ??????????????? ?????? ????????? ??????????????????
											map.setCenter(coords);
										}
									});
					
				</script> 
			</div>
			<!-- ????????? -->
			<script type="text/javascript">
			function linkGo(url){
				location.href = url
			}
			$(function () {
				
						$(".work_modal_rating1").on("click",function () {	
							$(".work_modal_rating1").addClass("checked")
							$(".work_modal_rating2").removeClass("checked")
							$(".work_modal_rating3").removeClass("checked")
							$(".work_modal_rating4").removeClass("checked")
							$(".work_modal_rating5").removeClass("checked")
							$("#work").val(1);
						})
						
						$(".work_modal_rating2").on("click",function () {
							$(".work_modal_rating1").addClass("checked")
							$(".work_modal_rating2").addClass("checked")
							$(".work_modal_rating3").removeClass("checked")
							$(".work_modal_rating4").removeClass("checked")
							$(".work_modal_rating5").removeClass("checked")
							$("#work").val(2);
						})
						$(".work_modal_rating3").on("click",function () {
							$(".work_modal_rating1").addClass("checked")
							$(".work_modal_rating2").addClass("checked")
							$(".work_modal_rating3").addClass("checked")
							$(".work_modal_rating4").removeClass("checked")
							$(".work_modal_rating5").removeClass("checked")
							$("#work").val(3);
						})
						$(".work_modal_rating4").on("click",function () {
							$(".work_modal_rating1").addClass("checked")
							$(".work_modal_rating2").addClass("checked")
							$(".work_modal_rating3").addClass("checked")
							$(".work_modal_rating4").addClass("checked")
							$(".work_modal_rating5").removeClass("checked")
							$("#work").val(4);
						})
						$(".work_modal_rating5").on("click",function () {
							$(".work_modal_rating1").addClass("checked")
							$(".work_modal_rating2").addClass("checked")
							$(".work_modal_rating3").addClass("checked")
							$(".work_modal_rating4").addClass("checked")
							$(".work_modal_rating5").addClass("checked")
							$("#work").val(5);
						}) 
						
						
						
						$(".promotion_modal_rating1").on("click",function () {	
							$(".promotion_modal_rating1").addClass("checked")
							$(".promotion_modal_rating2").removeClass("checked")
							$(".promotion_modal_rating3").removeClass("checked")
							$(".promotion_modal_rating4").removeClass("checked")
							$(".promotion_modal_rating5").removeClass("checked")
							$("#promotion").val(1);
						})
						$(".promotion_modal_rating2").on("click",function () {	
							$(".promotion_modal_rating1").addClass("checked")
							$(".promotion_modal_rating2").addClass("checked")
							$(".promotion_modal_rating3").removeClass("checked")
							$(".promotion_modal_rating4").removeClass("checked")
							$(".promotion_modal_rating5").removeClass("checked")
							$("#promotion").val(2);
						})
						$(".promotion_modal_rating3").on("click",function () {	
							$(".promotion_modal_rating1").addClass("checked")
							$(".promotion_modal_rating2").addClass("checked")
							$(".promotion_modal_rating3").addClass("checked")
							$(".promotion_modal_rating4").removeClass("checked")
							$(".promotion_modal_rating5").removeClass("checked")
							$("#promotion").val(3);
						})
						$(".promotion_modal_rating4").on("click",function () {	
							$(".promotion_modal_rating1").addClass("checked")
							$(".promotion_modal_rating2").addClass("checked")
							$(".promotion_modal_rating3").addClass("checked")
							$(".promotion_modal_rating4").addClass("checked")
							$(".promotion_modal_rating5").removeClass("checked")
							$("#promotion").val(4);
						})
						$(".promotion_modal_rating5").on("click",function () {	
							$(".promotion_modal_rating1").addClass("checked")
							$(".promotion_modal_rating2").addClass("checked")
							$(".promotion_modal_rating3").addClass("checked")
							$(".promotion_modal_rating4").addClass("checked")
							$(".promotion_modal_rating5").addClass("checked")
							$("#promotion").val(5);
						})
						
						
						
						$(".culture_modal_rating1").on("click",function () {	
							$(".culture_modal_rating1").addClass("checked")
							$(".culture_modal_rating2").removeClass("checked")
							$(".culture_modal_rating3").removeClass("checked")
							$(".culture_modal_rating4").removeClass("checked")
							$(".culture_modal_rating5").removeClass("checked")
							$("#culture").val(1);
						})

						$(".culture_modal_rating2").on("click",function () {	
							$(".culture_modal_rating1").addClass("checked")
							$(".culture_modal_rating2").addClass("checked")
							$(".culture_modal_rating3").removeClass("checked")
							$(".culture_modal_rating4").removeClass("checked")
							$(".culture_modal_rating5").removeClass("checked")
							$("#culture").val(2);
						})

						$(".culture_modal_rating3").on("click",function () {	
							$(".culture_modal_rating1").addClass("checked")
							$(".culture_modal_rating2").addClass("checked")
							$(".culture_modal_rating3").addClass("checked")
							$(".culture_modal_rating4").removeClass("checked")
							$(".culture_modal_rating5").removeClass("checked")
							$("#culture").val(3);
						})
	
						$(".culture_modal_rating4").on("click",function () {	
							$(".culture_modal_rating1").addClass("checked")
							$(".culture_modal_rating2").addClass("checked")
							$(".culture_modal_rating3").addClass("checked")
							$(".culture_modal_rating4").addClass("checked")
							$(".culture_modal_rating5").removeClass("checked")
							$("#culture").val(4);
						})
						
						$(".culture_modal_rating5").on("click",function () {	
							$(".culture_modal_rating1").addClass("checked")
							$(".culture_modal_rating2").addClass("checked")
							$(".culture_modal_rating3").addClass("checked")
							$(".culture_modal_rating4").addClass("checked")
							$(".culture_modal_rating5").addClass("checked")
							$("#culture").val(5);
						})
						
						
						
						
						$(".welfare_modal_rating1").on("click",function () {	
							$(".welfare_modal_rating1").addClass("checked")
							$(".welfare_modal_rating2").removeClass("checked")
							$(".welfare_modal_rating3").removeClass("checked")
							$(".welfare_modal_rating4").removeClass("checked")
							$(".welfare_modal_rating5").removeClass("checked")
							$("#welfare").val(1);
						})
						$(".welfare_modal_rating2").on("click",function () {	
							$(".welfare_modal_rating1").addClass("checked")
							$(".welfare_modal_rating2").addClass("checked")
							$(".welfare_modal_rating3").removeClass("checked")
							$(".welfare_modal_rating4").removeClass("checked")
							$(".welfare_modal_rating5").removeClass("checked")
							$("#welfare").val(2);
						})
						$(".welfare_modal_rating3").on("click",function () {	
							$(".welfare_modal_rating1").addClass("checked")
							$(".welfare_modal_rating2").addClass("checked")
							$(".welfare_modal_rating3").addClass("checked")
							$(".welfare_modal_rating4").removeClass("checked")
							$(".welfare_modal_rating5").removeClass("checked")
							$("#welfare").val(3);
						})
						$(".welfare_modal_rating4").on("click",function () {	
							$(".welfare_modal_rating1").addClass("checked")
							$(".welfare_modal_rating2").addClass("checked")
							$(".welfare_modal_rating3").addClass("checked")
							$(".welfare_modal_rating4").addClass("checked")
							$(".welfare_modal_rating5").removeClass("checked")
							$("#welfare").val(4);
						})
						$(".welfare_modal_rating5").on("click",function () {	
							$(".welfare_modal_rating1").addClass("checked")
							$(".welfare_modal_rating2").addClass("checked")
							$(".welfare_modal_rating3").addClass("checked")
							$(".welfare_modal_rating4").addClass("checked")
							$(".welfare_modal_rating5").removeClass("checked")
							$("#welfare").val(5);
						})
						
						
						
					
						$(".management_modal_rating1").on("click",function () {	
							$(".management_modal_rating1").addClass("checked")
							$(".management_modal_rating2").removeClass("checked")
							$(".management_modal_rating3").removeClass("checked")
							$(".management_modal_rating4").removeClass("checked")
							$(".management_modal_rating5").removeClass("checked")
							$("#management").val(1);
						})						
						$(".management_modal_rating2").on("click",function () {	
							$(".management_modal_rating1").addClass("checked")
							$(".management_modal_rating2").addClass("checked")
							$(".management_modal_rating3").removeClass("checked")
							$(".management_modal_rating4").removeClass("checked")
							$(".management_modal_rating5").removeClass("checked")
							$("#management").val(2);
						})						
						$(".management_modal_rating3").on("click",function () {	
							$(".management_modal_rating1").addClass("checked")
							$(".management_modal_rating2").addClass("checked")
							$(".management_modal_rating3").addClass("checked")
							$(".management_modal_rating4").removeClass("checked")
							$(".management_modal_rating5").removeClass("checked")
							$("#management").val(3);
						})						
						$(".management_modal_rating4").on("click",function () {	
							$(".management_modal_rating1").addClass("checked")
							$(".management_modal_rating2").addClass("checked")
							$(".management_modal_rating3").addClass("checked")
							$(".management_modal_rating4").addClass("checked")
							$(".management_modal_rating5").removeClass("checked")
							$("#management").val(4);
						})						
						$(".management_modal_rating5").on("click",function () {	
							$(".management_modal_rating1").addClass("checked")
							$(".management_modal_rating2").addClass("checked")
							$(".management_modal_rating3").addClass("checked")
							$(".management_modal_rating4").addClass("checked")
							$(".management_modal_rating5").addClass("checked")
							$("#management").val(5);
						})						
						
						
						$(".submit").on("click",function () {
							/* 
								$("#GooneEval").val($("#oneEval").html()) */
							
								if(confirm("?????????????????????????")){
									$("#mNo").val($("#userNo").attr("no"))
									$("#starForm").attr("action", "corAdd")
									$("#starForm").submit()
								}
							
						})			
						
			})
			
			</script>
			<div class="star_process modal fade bd-example-modal-xl"
				tabindex="-1" role="dialog" aria-labelledby="process_title"
				aria-hidden="true">
				<div class="modal-dialog .modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title" id="process_title">?????? ?????? ??????</h3>
						</div>
						<div class="modal-body">
							<div class="modal-text">
								<div>
									<div class="modal_subject ">????????????</div>
									<div class="modal_flex">
										<div>??????</div>
										<div>?????????</div>
									</div>
								</div>
								<div>
									<div class="modal_subject">????????????</div>
									<div class="modal_flex">?????????</div>
									<div>
										<div>
											<div class="modal_flex">
												<span>????????? ?????? ??????</span>
												<div class="main_rating">
													<div class="star_rating work_modal_rating">
														<span class="fa fa-star work_modal_rating1"></span> <span
															class="fa fa-star work_modal_rating2"></span> <span
															class="fa fa-star work_modal_rating3"></span> <span
															class="fa fa-star work_modal_rating4"></span> <span
															class="fa fa-star work_modal_rating5"></span>
													</div>
												</div>

											</div>
											<div class="modal_flex">
												<span>?????? ?????? ??? ?????????</span>
												<div class="main_rating">
													<div class="star_rating promotion_modal_rating">
														<span class="fa fa-star promotion_modal_rating1"></span> <span
															class="fa fa-star promotion_modal_rating2"></span> <span
															class="fa fa-star promotion_modal_rating3"></span> <span
															class="fa fa-star promotion_modal_rating4"></span> <span
															class="fa fa-star promotion_modal_rating5"></span>
													</div>
												</div>
											</div>
										</div>
										<div>
											<div class="modal_flex">
												<span>????????????</span>
												<div class="main_rating">
													<div class="star_rating culture_modal_rating">
														<span class="fa fa-star culture_modal_rating1"></span> <span
															class="fa fa-star culture_modal_rating2"></span> <span
															class="fa fa-star culture_modal_rating3"></span> <span
															class="fa fa-star culture_modal_rating4"></span> <span
															class="fa fa-star culture_modal_rating5"></span>
													</div>
												</div>
											</div>
											<div class="modal_flex">
												<span>?????? ??? ??????</span>
												<div class="main_rating">
													<div class="star_rating welfare_modal_rating">
														<span class="fa fa-star welfare_modal_rating1"></span> <span
															class="fa fa-star welfare_modal_rating2"></span> <span
															class="fa fa-star welfare_modal_rating3"></span> <span
															class="fa fa-star welfare_modal_rating4"></span> <span
															class="fa fa-star welfare_modal_rating5"></span>
													</div>
												</div>
											</div>
											<div class="modal_flex">
												<span>?????????</span>
												<div class="star_rating management_modal_rating">
													<span class="fa fa-star management_modal_rating1"></span> <span
														class="fa fa-star management_modal_rating2"></span> <span
														class="fa fa-star management_modal_rating3"></span> <span
														class="fa fa-star management_modal_rating4"></span> <span
														class="fa fa-star management_modal_rating5"></span>
												</div>
											</div>
										</div>
									</div>
									<div>
										<div class="modal_subject">?????????</div>
										<form action="#" id="starForm" method="post">
		<input type="hidden" id="cRNo" name="cRNo" value="${corpor_info.CORP_NO}">
		<input type="hidden" id="mNo" name="mNo" value="">
		<input type="hidden" id="work" name="work" value="">
		<input type="hidden" id="promotion" name="promotion" value="">
		<input type="hidden" id="culture" name="culture" value="">
		<input type="hidden" id="welfare" name="welfare" value="">
		<input type="hidden" id="management" name="management" value="">
		<!-- <input type="hidden" id="GooneEval" name="GooneEval" value=""> -->
										<textarea name="GooneEval" id="GooneEval" cols="60" rows="1"
											placeholder="????????? ????????? ?????????"></textarea>
	</form>
									</div>
								</div>
							</div>
							<div class="modal_button">
								<button class="btn btn-primary submit">??????</button>
								<button class="btn btn-primary" data-dismiss="modal">??????</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<div class="inner_content">
				<div>
					<b>????????????</b>
				</div>
				<div>????????????</div>
				<div>????????????????????????</div>
				<div>????????????</div>
			</div>
			<h2 class="footer_main_wirte">Coding is too hard</h2>
			<p class="footer_sub_wirte">please make it complete within the
				time frame</p>
		</footer>
</body>
</html>