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
    
    $(".pop-container").on('click', ".fa-star",function(event) {
    	if($(this).parent().next().attr("id")!="star0"){
	    	let star =$(this).attr("no")
	   		$(this).parent().next().val(star)
	   			html = ''
			for(let i = 1; i<=Math.round(star); i++){
				html+= '	    <span class="fa fa-star checked" no="'+i+'"></span>             '
			}
			for(let i = 1; i<=5-Math.round(star); i++){
				html+= '	    <span class="fa fa-star" no="'+(Math.round(star)+i)+'"></span>             '
			}
			$(this).parent().html(html)
			
			let target = $("#star0")
			let star1 = Number($("#star1").val()) 
			let star2 = Number($("#star2").val())
			let star3 = Number($("#star3").val())
			let star4 = Number($("#star4").val())
			let star5 = Number($("#star5").val())
			let star0 = Math.round((star1 + star2 + star3 + star4 + star5 )/5)
			html = ''
			for(let i = 1; i<=Math.round(star0); i++){
				html+= '	    <span class="fa fa-star checked" no="'+i+'"></span>             '
			}
			for(let i = 1; i<=5-Math.round(star0); i++){
				html+= '	    <span class="fa fa-star" no="'+(Math.round(star0)+i)+'"></span>             '
			}
			target.parent().children("div").html(html)
		}
    })
    
	
	/*처리*/
	$(".main_info").on("click","#sUpdateBtn", function(){
		let act = "u"
		let target = $(this)
		getGrdDtl(target, act) 
		$(".pop_wrap").show();
	})
	
	
	/*내용*/
	$(".main_info").on("click","#sDtlBtn", function(){
		let act = "v"
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
	html += '							<input type="hidden" name="gradeNo" id="gradeNo" value="'+gradeNo+'">                                                               '	
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
		if(act =="u"){
			html+= '	<div class="star_rating update-star" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'" >   </div>                      '
			html+= '	<input type="hidden" id="star0" name="star0" value="'+Math.round((data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5)+'">                        '
		}else if(act == "v"){
			html+= '	<div class="star_rating" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'">          </div>               '
		}
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">업무와 삶의 균형</div>           '
		html +=	'        <div class="body">                                      '
		if(act =="u"){
			html+= '	<div class="star_rating update_star"  score="'+data.WLB+'">  </div>                       '
			html+= '	<input type="hidden" class="star_score" id="star1" name="star1" value="'+data.WLB+'">                        '
		}else if(act == "v"){
			html+= '	<div class="star_rating"  score="'+data.WLB+'">        </div>                 '
		}
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">승진기회 및 가능성</div>         '
		html +=	'        <div class="body">                                      '
		if(act =="u"){
			html+= '	<div class="star_rating update_star" score="'+data.PROMO_POSS+'">  </div>                       '
			html+= '	<input type="hidden" class="star_score" id="star2" name="star2" value="'+data.PROMO_POSS+'">                        '
		}else if(act == "v"){
			html+= '	<div class="star_rating" score="'+data.PROMO_POSS+'">        </div>                 '
		}
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">사내문화</div>                   '
		html +=	'        <div class="body">                                      '
		if(act =="u"){
			html+= '	<div class="star_rating update_star" score="'+data.C_CULT+'">    </div>                     '
			html+= '	<input type="hidden" class="star_score" id="star3" name="star3" value="'+data.C_CULT+'">                        '
		}else if(act == "v"){
			html+= '	<div class="star_rating" score="'+data.C_CULT+'">      </div>                   '
		}
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">복지 및 급여</div>               '
		html +=	'        <div class="body">                                      '
		if(act =="u"){
			html+= '	<div class="star_rating update_star" score="'+data.WFARE_PAY+'">   </div>                      '
			html+= '	<input type="hidden" class="star_score" id="star4" name="star4" value="'+data.WFARE_PAY+'">                        '
		}else if(act == "v"){
			html+= '	<div class="star_rating" score="'+data.WFARE_PAY+'">         </div>                '
		}
		html +=	'        </div>                                                  '
		html +=	'    </div>                                                      '
		
		html +=	'    <div class="text_box">                                      '
		html +=	'        <div class="head long">경영진</div>                     '
		html +=	'        <div class="body">                                      '
		if(act =="u"){
			html+= '	<div class="star_rating update_star" score="'+data.MGM+'"> </div>                       '
			html+= '	<input type="hidden" class="star_score" id="star5" name="star5" value="'+data.MGM+'">                        '
		}else if(act == "v"){
			html+= '	<div class="star_rating" score="'+data.MGM+'">      </div>                   '
		}
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

	if(act =="v"){
		html += '		        <div class="button_box">                                                                                                                      '
		html += '		            <button type="button" class="pop-close-btn" id="prcssCancBtn">확인</button>                                                                                     '
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
   
	
	$(".star_rating").each(function(idx){
		let star = $(this).attr("score")
			html = ''
		for(let i = 1; i<=Math.round(star); i++){
			html+= '	    <span class="fa fa-star checked" no="'+i+'"></span>             '
		}
		for(let i = 1; i<=5-Math.round(star); i++){
			html+= '	    <span class="fa fa-star" no="'+(Math.round(star)+i)+'"></span>             '
		}
		$(this).html(html)
	})

	
}








