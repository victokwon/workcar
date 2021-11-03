$(function(){
	drawAttndPage()
	
	$(".main_info").on("click", "#attndDelBtn",function(){
		let targetANo = $(this).attr("aNo")
		let targetRe = $(this).parent().parent().parent().parent().parent()
		attndDel(targetRe, targetANo)
	})
})

function attndDel(targetRe, targetANo){

  $.ajax({
    type: "POST",
    data: "target=" + targetANo,
    url: "delIAttndAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
	     	alert("해제 완료")
	     	targetRe.remove()
	     	drawAttndPage()
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
    url: "drawIAttndPageAjax",
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
	html =""
		html += '                                                                                                                              '
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
	html += 	'	<div class="star_rating" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'"></div>    '
	html +=     '                               </div>         '
	html +=     '    						</div>                                  '
	html +=     '    						<div class="row">                       '
	html +=     '    							<div class="text">마감일</div>         '
	html +=     '    							<div class="data">'+data.DLINE+'</div>         '
	html +=     '    						</div>                                  '
	html +=     '    					</div>                                      '
	html +=     '    				</div>                                          '
	html +=     '    			</div>                                              '
		html += '								<div class="button_container b">                                                                '
		html += '									<div class="button_box">                                                                  '
		html += '										<button type="button" class="b_hover" id="attndDelBtn" aNo="'+data.ATTND_NO+'">삭제</button>                  '
		html += '									</div>                                                                                    '
		html += '									<div class="button_box b">                                                                  '
		html += '										<button type="button" class="b_hover JA_btn" id="JABtn" eNo="'+data.EMP_NO+'">지원하기</button>            '
		html += '									</div>                                                                                    '
		html += '								</div>                                                                                        '
		html += '							</div>                                                                                            '
		html += '						</td>                                                                                                 '
		html += '					</tr>                                                                                                     '
	}
	
	$(".emp_attention").html(html)
	
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

































