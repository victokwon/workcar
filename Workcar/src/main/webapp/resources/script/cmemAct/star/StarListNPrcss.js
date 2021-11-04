$(function(){
	getGrd()
	
   $("#staring_paging_wrap").on("click","span",function(){
	 $("#page").val($(this).attr("page"))
     getGrd()
   })
   
    
})   
    
/*이벤트 온 오프 처리*/

function getGrd(){
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
     		$("#page").val(res.page)
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


function drawGrdList(list, cnt) {
	let html = ""
	
	
	
	
	if(cnt == '0'){
 		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="zero">등록한 내용이 없습니다.</div>                                                          '	    
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '	    		
 		}
 		
	for (data of list){
	
		
		html += '					<tr>																								'
	    html += '                      <td >                                                                                            '
	    html += '                          <div class="staring_list">                                                                 '
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
	    html += '                                              <div class="text">처리상태</div>                                           '
	    html += '                                              <div class="data">                                                       '
	    if(data.PRCSS_GBN == "0"){
			html += '미처리'
		}else if(data.PRCSS_GBN == "1"){
			html += '승인'
		}else if(data.PRCSS_GBN == "2"){
			html += '거절'
		}
	    html += '                                              </div>                                                                   '
	    html += '                                          </div>                                                                       '
	    html += '                                      </div>                                                                           '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                              <div class="button_container">                                                           '
	    html += '                                  <div class="button_box">                                                             '
			html += '                                      <button type="button" id="dtlBtn" class="b_hover" mNo="'+data.APLMEM_NO+'" cNo="'+data.CORP_NO+'" gNo="'+data.GRADE_NO+'">확인</button>             '
	    html += '                                  </div>                                                                               '
	    html += '                              </div>                                                                                   '
	    html += '                          </div>                                                                                       '
	    html += '                      </td>                                                                                            '
	    html += '                  </tr>                                                                                                '
	
		
	
	
	
	}
	
	
	$(".staring").html(html)
	
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

      let html = ''
         /* 현재 페이지 굵은 글씨 적용*/
         html += '<span page="1">&lt;&lt;</span>'
         
         if($("#page").val() == 1){
            html +=   '<span page="1">&lt;</span>'   
         }else{
            html += '<span page="' + ($("#page").val()*1 - 1) + '">&lt;</span>'
         }
         
         for(var i = pb.startPcount; i <= pb.endPcount; i++){
            if($("#page").val() == i ){
               html += '<span page="' + i + '"><b>' + i + '</b></span>'   
            }else{
               html += '<span page="' + i + '">' + i + '</span>'   
            }
         }
         
         if($("#page").val() == pb.maxPcount){
            html += '<span page="' + pb.maxPcount + '">&gt;</span>'   
         }else{
            html += '<span page="' + ($("#page").val()*1 + 1) + '">&gt;</span>'
         }
         
         html += '<span page="' + pb.maxPcount + '">&gt;&gt;</span>'
         
      		$("#staring_paging_wrap").html(html)
   }

  




