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
	     	$("#suggetEmpForm").append('<input type="hidden" name="suggetEmpNo" value="'+res.data.EMP_NO+'">')
     	}else if(res.result == "FAILED"){
     		alert("추천할 채용이 없습니다.")
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
	html +=     '    							<div class="text">공고</div>         '
	html +=     '    							<div class="data">'+data.EMP_TITLE+'</div>      '
	html +=     '    							<!-- 이름 링크 -->                    '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">업종</div>            '
	html +=     '    							<div class="data">'+data.SECTOR_NAME+'</div>            '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">공고일</div>        '
	html +=     '    							<div class="data">'+data.REG_DATE+'</div> '
	html +=     '    						</div>                                  '
	html +=     '    					</div>                                      '
	html +=     '    					<div class="col">                           '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">기업</div>         '
	html +=     '    							<div class="data">'+data.C_NAME+'</div>      '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">평점</div>         '
	html +=     '    							<div class="data">'
	html+= '	<div class="star_rating" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'">          </div>               '
	html +=     ' </div>         '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">마감일</div>         '
	html +=     '    							<div class="data">'+data.DLINE+'</div>         '
	html +=     '    						</div>                                  '
	html +=     '    					</div>                                      '
	html +=     '    				</div>                                          '
	html +=     '    			</div>                                              '
	html +=     '    			<div class="button_container">                      '
	html +=     '    				<div class="button_box b">                        '
	html +=     '    					<button type="button" class="b_hover" id="attnedAddBtn" eNo="'+data.EMP_NO+'">관심</button>          '
	html +=     '    					<button type="button" class="b_hover" id="suggetDelBtn" >삭제</button>          '
	html +=     '    				</div>   '
    html +=     '					<div class="button_box b">                                              '
	html +=     '    					<button type="button" class="b_hover JA_btn" id="JABtn" eNo="'+data.EMP_NO+'">지원하기</button>           '
    html +=     '					</div>                                               '
	html +=     '    			</div>                                              '
	html +=     '    		</div>                                                  '
	html +=     '    	</td>                                                       '
	html +=		'	</tr>                                                           '

	target.prepend(html)
	
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
		
}	


function addAttned(target){

let params ="empNo=" + target.attr("eno") +"&memNo=" + $("#userNo").attr("no")
  $.ajax({
    type: "POST",
    data: params,
    url: "addIAttnedAjax",
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











