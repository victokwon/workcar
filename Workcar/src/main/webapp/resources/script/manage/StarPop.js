$(function(){
	$(".pop-container").on('keydown', function(event) {
	     if (event.keyCode === 13) {
	       event.preventDefault();
	     }
  	     if (event.keyCode === 27) {
    		$(".pop_wrap").hide();
   			$(".pop-container").html("")
	     }
    })
    
    $(".pop-container").on('click', ".pop-close-btn",function(event) {
   		$(".pop_wrap").hide();
   		$(".pop-container").html("")
    })
    
    $(".pop-container").on('change', "#prcssGbn",function(event) {
    	if($("#prcssGbn").val() == 2){
    		$("#refuseReasn").attr("disabled",false)
    	}else{
    		$("#refuseReasn").attr("disabled",true)
    	}
    })
    
	/*처리*/
	$(".main_info").on("click","#sPrcssBtn", function(){
		let act = "p"
		let target = $(this)
		getGrdDtl(target, act) 
		$(".pop_wrap").show();
	})
	
	
	/*내용*/
	$(".main_info").on("click","#sUpdateBtn", function(){
		let act = "u"
		let target = $(this)
		getGrdDtl(target, act) 
		$(".pop_wrap").show();
	})
})

function getGrdDtl(target, act){
	
	 $.ajax({
   		 type: "POST",
	    data: "gradeNo=" + target.attr("gNo"),
	    url: "getGrdDtlAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     	drawDclDtl(res.data ,target, act)
	     	}else if(res.result == "FAILED"){
	     		alert("요청에 완료할 수 없습니다.")
	     	}
	    },
	    error: function (request, status, error) {
	      console.log(request);
	      console.log(error);
	    }
  });
}

function drawDclDtl(data, target, act){
	console.log(act)
	let html = ""
	
	let corpNo = target.attr("cNo")
	let memNo = target.attr("mNo")
	let gradeNo = target.attr("gNo")
	let manageNo = $("#userNo").attr("no")

		if(typeof data.REFUSE_REASN == "undefined"){
			data.REFUSE_REASN =""
		}
	
	html += '		 <div class="pop-out-container">                                                                                                                      '
	html += '		    <div class="pop-in-container">                                                                                                                    '
	html += '		        <div class="pop-text-header">                                                                                                                 '
	html += '		            <h1 class="modal-title" id="process_title">평점 등록 승인</h1>                                                                        '
	html += '		        </div>                                                                                                                                        '
	html += '		        <div class="content">                                                                                                                                        '
	html += '		            <div >                                                                                                                                    '
	html += '		            	<form action="#" id="prcssForm">                                                                                                      '
	html += '		            		<input type="hidden" name="corpNo" id="corpNo" value="'+corpNo+'">                                                                                     '
	html += '							<input type="hidden" name="memNo" id="memNo" value="'+memNo+'">                                                                                     '
	html += '							<input type="hidden" name="manageNo" id="manageNo" value="'+manageNo+'">                                                               '
	html += '							<input type="hidden" name="gradeNo" id="gradeNo" value="'+gradeNo+'">                                                               '	
	html += '			                <div class="star_prcss_box">                                                                                                    '
	html += '			                 	<div class="text_box">                                                                                                        '
	html += '			                        <div class="head">처리                                                                                             '
	html += '			                        </div>                                                                                              '
	html += '			                         <select name="prcssGbn" id="prcssGbn" class="body" selValue="'+data.PRCSS_GBN+'">                                                                      '
	html += '			                            <option value="0">미처리</option>                                                                                       '	
	html += '			                            <option value="1">승인</option>                                                                                       '        
	html += '			                            <option value="2">거절</option>                                                                                       '
	html += '			                        </select>                                                                                                                 '
	html += '			                    </div>                                                                                                                        '
	html += '			                </div>                                                                                                                            '
	html += '			                <div class="star_info_box">                                                                                                     '
	html += '			                 	<div class="text_box">                                                                                                        '
	html += '			                        <div class="head">등록회원</div>                                                                                  '
	html += '			                        <div class="body">'+data.NAME+'</div>                                                                                  '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div class="head">기업명</div>                                                                                  '
	html += '			                        <div class="body">'+data.C_NAME+'</div>                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                     <div class="text_box">                                                                                                       '
	html += '			                        <div class="head">등록일</div>                                                                                            '
	html += '			                        <div class="body">'+data.REG_DATE+'</div>                                                                                       '
	html += '			                    </div>                                                                                                                        '
	html += '			                </div>                                                                                                                            '
	html += '			                <div class="star_content_box">                                                                                                  '
html +=	'    <div class="text_box">                                      '
html +=	'        <div class="head">평균평점</div>                        '
html +=	'        <div class="body">                                      '
html+= '	<div class="star_rating" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'">                        '
html+= '	</div>                                           '
html +=	'        </div>                                                  '
html +=	'    </div>                                                      '

html +=	'    <div class="text_box">                                      '
html +=	'        <div class="head long">업무와 삶의 균형</div>           '
html +=	'        <div class="body">                                      '
html+= '	<div class="star_rating" score="'+data.WLB+'">                        '
html+= '	</div>                                           '
html +=	'        </div>                                                  '
html +=	'    </div>                                                      '

html +=	'    <div class="text_box">                                      '
html +=	'        <div class="head long">승진기회 및 가능성</div>         '
html +=	'        <div class="body">                                      '
html+= '	<div class="star_rating" score="'+data.PROMO_POSS+'">                        '
html+= '	</div>                                           '
html +=	'        </div>                                                  '
html +=	'    </div>                                                      '

html +=	'    <div class="text_box">                                      '
html +=	'        <div class="head long">사내문화</div>                   '
html +=	'        <div class="body">                                      '
html+= '	<div class="star_rating" score="'+data.C_CULT+'">                        '
html+= '	</div>                                           '
html +=	'        </div>                                                  '
html +=	'    </div>                                                      '

html +=	'    <div class="text_box">                                      '
html +=	'        <div class="head long">복지 및 급여</div>               '
html +=	'        <div class="body">                                      '
html+= '	<div class="star_rating" score="'+data.WFARE_PAY+'">                        '
html+= '	</div>                                           '
html +=	'        </div>                                                  '
html +=	'    </div>                                                      '

html +=	'    <div class="text_box">                                      '
html +=	'        <div class="head long">경영진</div>                     '
html +=	'        <div class="body">                                      '
html+= '	<div class="star_rating" score="'+data.MGM+'">                        '
html+= '	</div>                                           '
html +=	'        </div>                                                  '
html +=	'    </div>                                                      '
	html += '			                     <div class="text">                                                                                                           '
	html += '			                        <div>한줄평가</div>                                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="eval" id="eval" cols="60" rows="2" spellcheck="false" placeholder="신고사유" >'+data.EVAL+'</textarea>        '
	html += '		                    </div>                                                                                                                            '
	html += '			                <div class="refuse">                                                                                                              '
	html += '			                    <div class="text">                                                                                                            '
	html += '			                        <div>거절사유</div>                                                                                                       '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="refuseReasn" id="refuseReasn" cols="60" rows="2" spellcheck="false" disabled>'+ data.REFUSE_REASN +'</textarea>                             '
	html += '			                </div>                                                                                                                            '
	html += '		                </form>                                                                                                                               '
	html += '		            </div>                                                                                                                                    '
	html += '		        </div>                                                                                                                                        '
	html += '		        <hr>                                                                                                                                          '
	
	if(act =="p"){
		html += '		        <div class="button_box">                                                                                                                      '
		html += '		            <button type="button" class="prcssBtn" >처리</button>                                                                                         '
		html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">취소</button>                                                                                     '
		html += '		        </div>                                                                                                                                        '
	}else if(act == "u"){
		html += '		        <div class="button_box">                                                                                                                      '
		html += '		            <button type="button" class="prcssBtn">수정</button>                                                                                         '
		html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">확인</button>                                                                                     '
		html += '		        </div>                                                                                                                                        '	
	}
		html += '	        </div>                                                                                                                                            '
		html += '	    </div>'
	 
	$(".pop-container").html(html)
	
	  $("select").each(function(idx) {
		   if($(this).attr("selValue") != "") {
			   $(this).val($(this).attr("selValue"));
		   }
	   });
   
	if($("#prcssGbn").val() == 2){
		$("#refuseReasn").attr("disabled",false)
	}else{
		$("#refuseReasn").attr("disabled",true)
	}
	
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








