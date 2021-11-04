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
    
	$(".main_info").on("click","#dtlBtn", function(){
		let target = $(this)
		getGrdDtl(target) 
		$(".pop_wrap").show();
	})
    
})

function getGrdDtl(target){
	
	 $.ajax({
   		 type: "POST",
	    data: "gradeNo=" + target.attr("gNo"),
	    url: "getGrdDtlAjax",
	    dataType: "json",
	    success: function (res) {
	     	if(res.result == "SUCCESS"){
	     	drawGrdDtl(res.data)
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

function drawGrdDtl(data){
	let html = ""
	
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
	html += '			                <div class="star_prcss_box">                                                                                                    '
	html += '			                 	<div class="text_box">                                                                                                        '
	html += '			                        <div class="head">처리상태                                                                                             '
	html += '			                        </div>                                                                                              '
	html += '			                        <div class="body">'
		    if(data.PRCSS_GBN == "0"){
			html += '미처리'
		}else if(data.PRCSS_GBN == "1"){
			html += '승인'
		}else if(data.PRCSS_GBN == "2"){
			html += '거절'
		}
	html += '</div>'
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
			html+= '	<div class="star_rating" act="v" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'">          </div>               '
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">업무와 삶의 균형</div>           '
		html +=	'        <div class="body">                                      '
			html+= '	<div class="star_rating" act="v" score="'+data.WLB+'">        </div>                 '
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">승진기회 및 가능성</div>         '
		html +=	'        <div class="body">                                      '
			html+= '	<div class="star_rating" act="v" score="'+data.PROMO_POSS+'">        </div>                 '
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">사내문화</div>                   '
		html +=	'        <div class="body">                                      '
			html+= '	<div class="star_rating" act="v" score="'+data.C_CULT+'">      </div>                   '
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">복지 및 급여</div>               '
		html +=	'        <div class="body">                                      '
			html+= '	<div class="star_rating" act="v" score="'+data.WFARE_PAY+'">         </div>                '
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">경영진</div>                     '
		html +=	'        <div class="body">                                      '
			html+= '	<div class="star_rating" act="v" score="'+data.MGM+'">      </div>                   '
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		
	html += '			                     <div class="text">                                                                                                           '
	html += '			                        <div>한줄평가</div>                                                                                                           '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="eval" id="eval" cols="60" rows="2" spellcheck="false" placeholder="한줄평가" disabled>'+data.EVAL+'</textarea>        '
	html += '		                    </div>                                                                                                                            '
	html += '			                <div class="refuse">                                                                                                              '
	html += '			                    <div class="text">                                                                                                            '
	html += '			                        <div>거절사유</div>                                                                                                       '
	html += '			                    </div>                                                                                                                        '
	html += '			                    <textarea name="refuseReasn" id="refuseReasn" cols="60" rows="2" spellcheck="false" disabled>'+ data.REFUSE_REASN +'</textarea>                             '
	html += '			                </div>                                                                                                                            '
	html += '		            </div>                                                                                                                                    '
	html += '		        </div>                                                                                                                                        '
	html += '		        <hr>                                                                                                                                          '

		html += '		        <div class="button_box">                                                                                                                      '
		html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">확인</button>                                                                                     '
		html += '		        </div>                                                                                                                                        '
		html += '	        </div>                                                                                                                                            '
		html += '	    </div>'
	 
	$(".pop-container").html(html)
	
	  $("select").each(function(idx) {
		   if($(this).attr("selValue") != "") {
			   $(this).val($(this).attr("selValue"));
		   }
	   });
   
	
	$(".star_rating").each(function(idx){
		let star = $(this).attr("score")
			html = ''
		if($(this).attr("act") == "u"){
			for(let i = 1; i<=Math.round(star); i++){
				html+= '	    <span class="fa fa-star checked u" no="'+i+'"></span>             '
			}
			for(let i = 1; i<=5-Math.round(star); i++){
				html+= '	    <span class="fa fa-star u" no="'+(Math.round(star)+i)+'"></span>             '
			}
		}else if($(this).attr("act") == "v"){
			for(let i = 1; i<=Math.round(star); i++){
				html+= '	    <span class="fa fa-star checked v"  no="'+i+'"></span>             '
			}
			for(let i = 1; i<=5-Math.round(star); i++){
				html+= '	    <span class="fa fa-star v" no="'+(Math.round(star)+i)+'"></span>             '
			}
		}
		$(this).html(html)
	})

	
}








