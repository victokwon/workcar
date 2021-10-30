$(function(){
	getIGrd()
  $("#staring").on("click", function () {
  	getIGrd()	
    $(".staring").css("display", "table");
    $(".stared").css("display", "none");
    $("#staring_paging_wrap").show()
    $("#stared_paging_wrap").hide()
  });
  
  $("#stared").on("click", function () {
	getDGrd()	
    $(".staring").css("display", "none");
    $(".stared").css("display", "table");
    $("#stared_paging_wrap").show()
    $("#staring_paging_wrap").hide()
  });

	
	
   $("#staring_paging_wrap").on("click","span",function(){
	 $("#Ipage").val($(this).attr("page"))
     getIGrd()
   })
	
   $("#stared_paging_wrap").on("click","span",function(){
	 $("#Dpage").val($(this).attr("page"))
     getDGrd()
   })
   
   $(".pop-container").on("click",".prcssBtn",function(){
   		
   		if($("#prcssGbn").val() == '0'){
			alert("미처리 상태로 처리할 수 없습니다.")
			return	   	
   		}else if($("#prcssGbn").val() == '2'){
   			if($("#gradeRefuse").val() ==""){
   				alert("거절내용이 누락되었습니다.")
   				$("#gradeRefuse").focus()
   				return
   			}
   		}
		GrdUpdate($(this).parent().parent().parent().parent().parent().parent().parent().attr("class"))
   		$(".pop_wrap").hide();
		$(".pop-container").html("")
   })
   
    
})   
    
/*이벤트 온 오프 처리*/

function getIGrd(){
	let params = $("#staringForm").serialize()
	let view = "ing"
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getGrdAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawGrdList(res.list, view, res.cnt)
     		$("#Ipage").val(res.page)
     		if(res.cnt != '0'){
     			drawPaging(res.pb, view)
     		}
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

function getDGrd(){
	let params = $("#staredForm").serialize()
	let view = "ed"
	
  $.ajax({
    type: "POST",
    data: params,
    url: "getGrdAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
     		drawGrdList(res.list, view)
     		$("#Dpage").val(res.page)
     		drawPaging(res.pb, view)
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

function drawGrdList(list, view, cnt) {
	let html = ""
	
	
	
	
	if(cnt == '0'){
 		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="zero">처리할 내용이 없습니다.</div>                                                          '	    
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '	    		
 		}
 		
	for (data of list){
	
		if(typeof data.PRCSS_DATE == "undefined"){
			data.PRCSS_DATE ="미처리"
		}
		
		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="staring_list">                                                                 '
	    html += '                              <div class="box_profile"></div>                                                          '
	    html += '                              <div class="dtl_box">                                                                    '
	    html += '                                  <div class="staring_dtl">                                                          '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">성명</div>                                           '
	    html += '                                              <div class="data">'+data.NAME+'</div>                                         '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">평점</div>                                         '
	    html += '                                              <div class="data title"> '
	    html+= '	<div class="star_rating" score="'+(data.WLB+ data.PROMO_POSS + data.C_CULT + data.WFARE_PAY + data.MGM)/5+'">                        '
		html+= '	</div>                                           '
	    html += '                                              </div>                              '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                      <div class="col">                                                                '
	    html += '                                          <div class="row ">                                                           '
	    html += '                                              <div class="text">기업</div>                                             '
	    html += '                                              <div class="data ">'+data.C_NAME+'</div>                                          '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">등록일</div>                                             '
	    html += '                                              <div class="data">'+data.REG_DATE, +'</div>                                             '
	    html += '                                          </div>                                                                       '
	    html += '                                          <div class="row">                                                            '
	    html += '                                              <div class="text">처리일</div>                                           '
	    html += '                                              <div class="data">'+data.PRCSS_DATE+'</div>                                      '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    
	    if(view =="ing"){
		    html += '                                  <div class="button_box">                                                             '
		    html += '                                      <button type="button" id="sPrcssBtn" class="b_hover" mNo="'+data.APLMEM_NO+'" cNo="'+data.CORP_NO+'" gNo="'+data.GRADE_NO+'">처리</button>             '
		    html += '                                  </div>                                                                               '
		}else if(view =="ed"){
			    html += '                                  <div class="button_box">                                                             '
			if(data.PRCSS_GBN =="0"){
				html += '                                      <button type="button" id="sPrcssBtn" class="b_hover" mNo="'+data.APLMEM_NO+'" cNo="'+data.CORP_NO+'" gNo="'+data.GRADE_NO+'">처리</button>             '
			}else{		    
			    html += '                                      <button type="button" id="sUpdateBtn" class="b_hover" mNo="'+data.APLMEM_NO+'" cNo="'+data.CORP_NO+'" gNo="'+data.GRADE_NO+'">수정</button>             '
		    }
		    html += '                                  </div>                                                                               '
	    }
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	
		
	
	
	
	}
	
	
	if(view =="ing"){
		$(".staring").html(html)
	}else if(view =="ed"){
		$(".stared").html(html)
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


function drawPaging(pb, view) {
	let pageName =""
	if(view =="ing"){  
		pageName = "Ipage"
	}else if(view =="ed"){
		pageName = "Dpage"
	}

      let html = ''
         /* 현재 페이지 굵은 글씨 적용*/
         html += '<span page="1">&lt;&lt;</span>'
         
         if($("#"+pageName+"").val() == 1){
            html +=   '<span page="1">&lt;</span>'   
         }else{
            html += '<span page="' + ($("#"+pageName+"").val()*1 - 1) + '">&lt;</span>'
         }
         
         for(var i = pb.startPcount; i <= pb.endPcount; i++){
            if($("#"+pageName+"").val() == i ){
               html += '<span page="' + i + '"><b>' + i + '</b></span>'   
            }else{
               html += '<span page="' + i + '">' + i + '</span>'   
            }
         }
         
         if($("#"+pageName+"").val() == pb.maxPcount){
            html += '<span page="' + pb.maxPcount + '">&gt;</span>'   
         }else{
            html += '<span page="' + ($("#"+pageName+"").val()*1 + 1) + '">&gt;</span>'
         }
         
         html += '<span page="' + pb.maxPcount + '">&gt;&gt;</span>'
         
   		if(view =="ing"){  
      		$("#staring_paging_wrap").html(html)
    	}else if(view =="ed"){
     		$("#stared_paging_wrap").html(html)
 		}
   }

function GrdUpdate(act){
	let params = $("#prcssForm").serialize()
	
	$.ajax({
    type: "POST",
    data: params,
    url: "updateGrdAjax",
    dataType: "json",
    success: function (res) {
     	if(res.result == "SUCCESS"){
			alert("처리에 성공했습니다.")
			if(act = 'staring'){
				getIGrd()
			}else if(act = 'staried'){
				getDGrd()
			}
     	}else if(res.result == "FAILED"){
     		alert("처리에 실패했습니다.")
     	}
     	console.log(res.result)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
  
}




