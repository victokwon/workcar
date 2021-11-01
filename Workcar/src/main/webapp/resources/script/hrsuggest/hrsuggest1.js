$(function(){
	$(".main_info").on("click", "#suggetDelBtn",function(){
		$(this).parent().parent().parent().parent().parent().remove()
	})
	
	$("#addEmpBtn").on("click", function(){
	let target = $(".emp_suggest")
		addEmp(target)
	})
	
	$(".main_info").on("click", "#attnedAddBtn",function(){
		if($(this).attr("class") == "n_hover"){
			alert("이미 추가된 관심정보입니다.")
		}else{
		let target = $(this)
		addAttned(target)
		}
	})
})


function addEmp(target){
	let params = $("#suggetEmpForm").serialize()
	
  $.ajax({
    type: "POST",
    data: "memNo=" + $("#userNo").attr("no") +"&" + params,
    url: "getSuggetEmpAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
	     	drawEmpBox(res.data, target)
	     	$("#suggetEmpForm").append('<input type="hidden" name="suggetEmpNo" value="'+res.data.RESUM_NO+'">')
     	}else if(res.result == "FAILED"){
     		alert("추천할 인재가 없습니다.")
     	}
     	console.log(res.result)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}

function drawEmpBox(data,target) {

	html = ''
	html +=    	'	<tr >                                                            '
	html +=     '    	<td >                                          '
	html +=     '    		<div class="emp_suggest_list">                          '
	html +=     '    			<div class="box_profile"></div>                     '
	html +=     '    			<div class="dtl_box">                               '
	html +=     '    				<div class="emp_suggest_dtl">                   '
	html +=     '    					<div class="col">                           '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">이름</div>         '
	html +=     '    							<div class="data">'+data.NAME+'</div>      '
	html +=     '    							<!-- 이름 링크 -->                    '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text"></div>            '
	html +=     '    							<div class="data null"></div>            '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">등록일</div>        '
	html +=     '    							<div class="data">'+data.CHN_DATE+'</div> '
	html +=     '    						</div>                                  '
	html +=     '    					</div>                                      '
	html +=     '    					<div class="col">                           '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">업종</div>         '
	html +=     '    							<div class="data">'+data.SECTOR_NAME+'</div>      '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">경력</div>         '
	html +=     '    							<div class="data">'+data.CARR+' / '+data.CARR_PER+'</div>         '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">지역</div>         '
	html +=     '    							<div class="data">'+data.CITY_NAME+' / '+data.REGION_NAME+'</div>         '
	html +=     '    						</div>                                  '
	html +=     '    					</div>                                      '
	html +=     '    				</div>                                          '
	html +=     '    			</div>                                              '
	html +=     '    			<div class="button_container">                      '
	html +=     '    				<div class="button_box b">                        '
	html +=     '    					<button type="button" class="b_hover" id="attnedAddBtn" no="'+data.RESUM_NO+'">관심</button>          '
	html +=     '    					<button type="button" class="b_hover" id="suggetDelBtn">삭제</button>          '
	html +=     '    				</div>   '
    html +=     '					<div class="button_box b">                                              '
	html +=     '    					<button type="button" class="b_hover" id="JCBtn">입사요청</button>           '
    html +=     '					</div>                                               '
	html +=     '    			</div>                                              '
	html +=     '    		</div>                                                  '
	html +=     '    	</td>                                                       '
	html +=		'	</tr>                                                           '

	target.prepend(html)
}	


function addAttned(target){

let params ="resumeNo=" + target.attr("no") +"&memNo=" + $("#userNo").attr("no")
  $.ajax({
    type: "POST",
    data: params,
    url: "addAttnedAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		alert("관심추가 완료")
     		drawAttndPage()
     		target.attr("class","n_hover")
     	}else if(res.result == "FAILED"){
     	}
     	console.log(res.result)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}











