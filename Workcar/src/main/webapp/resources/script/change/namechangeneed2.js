$(function(){
	drawAttndPage()
	
	$(".main_info").on("click", "#attndDelBtn",function(){
		let target = $(this).parent().parent().parent().parent().parent()
		attentionDel(target)
	})
})

function attentionDel(target){

  $.ajax({
    type: "POST",
    data: "target=" + target.attr("no"),
    url: "delAttentionAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
	     	alert("해제 완료")
	     	target.remove()
     	}
     	console.log(res.result)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
  
}

function drawAttndPage(){

  $.ajax({
    type: "POST",
    url: "drawAttndPageAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawAttndList(res.LIST)
     	}
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
  
}


function drawAttndList(list){
	html = ""
	
	for(data of list){
		html += '                                                                                                                              '
		html += '					<tr no="'+data.ATTND_NO +'">                                                                          '
		html += '						<td >                                                                                                 '
		html += '							<div class="emp_attention_list">                                                                  '
		html += '								<div class="box_profile"></div>                                                               '
		html += '								<div class="dtl_box">                                                                         '
		html += '									<div class="emp_attention_dtl">                                                           '
		html += '										<div class="col">                                                                     '
		html += '											<div class="row">                                                                 '
		html += '												<div class="text">이름</div>                                                  '
		html += '												<div class="data">'+data.NAME +'</div>                                         '
		html += '												<!-- 이름 링크 -->                                                            '
		html += '											</div>                                                                            '
		html += '											<div class="row">                                                                 '
		html += '												<div class="text"></div>                                                      '
		html += '												<div class="data null"></div>                                                 '
		html += '											</div>                                                                            '
		html += '											<div class="row">                                                                 '
		html += '												<div class="text">등록일</div>                                                '
		html += '												<div class="data">'+data.CHN_DATE +'</div>                                     '
		html += '											</div>                                                                            '
		html += '										</div>                                                                                '
		html += '										<div class="col">                                                                     '
		html += '											<div class="row">                                                                 '
		html += '												<div class="text">업종</div>                                                  '
		html += '												<!-- 공통코드 조인 -->                                                        '
		html += '												<div class="data">'+data.SECTOR_NAME +'</div>                                  '
		html += '											</div>                                                                            '
		html += '											<div class="row">                                                                 '
		html += '												<div class="text">경력</div>                                                  '
		html += '												<div class="data">'+data.CARR +' / '+data.CARR_PER +'</div>                     '
		html += '											</div>                                                                            '
		html += '											<div class="row">                                                                 '
		html += '												<div class="text">지역</div>                                                  '
		html += '												<div class="data">'+data.CITY_NAME +' / '+data.REGION_NAME +'</div>             '
		html += '											</div>                                                                            '
		html += '										</div>                                                                                '
		html += '									</div>                                                                                    '
		html += '								</div>                                                                                        '
		html += '								<div class="button_container b">                                                                '
		html += '									<div class="button_box">                                                                  '
		html += '										<button type="button" class="b_hover" id="attndDelBtn">삭제</button>                  '
		html += '									</div>                                                                                    '
		html += '									<div class="button_box b">                                                                  '
		html += '										<button type="button" class="b_hover" id="JCBtn" >입사요청</button>            '
		html += '									</div>                                                                                    '
		html += '								</div>                                                                                        '
		html += '							</div>                                                                                            '
		html += '						</td>                                                                                                 '
		html += '					</tr>                                                                                                     '
	}
	
	$(".emp_attention").html(html)

}

































function JCReq(target){

}