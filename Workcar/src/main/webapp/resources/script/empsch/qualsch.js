$(function () {
	$(".pop-container").on('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  }
	  })
	  
/* js에서 api 데이터 호출해서 활용하는 방법 =?= controller에서 api데이터 호출해서 활용하는 방법*/
  $("#qualSchBtn").on("click", function () {
    $(".pop-container").show();
  });
  
  $("#cancleBtn").on("click", function(){
	$(".pop-container").hide();
  });
  
    $("#schBtn").on("click", function () {
//  	 schCInfo()
  });
  
  
	$(".paging_wrap").on("click","span",function(){
		$("#pop_page").val($(this).attr("pop_page"))
		schCInfo()
	})
});



function popdrawPaging(pb) {
		let html = ""
			/* 현재 페이지 굵은 글씨 적용*/
			html += "<span page=\"1\">처음</span>"
			
			if($("#pop_page").val() == 1){
				html +=	"	<span page=\"1\">이전</span>"	
			}else{
				html += "	<span page=\"" + ($("#pop_page").val()*1 - 1) + "\">이전</span>	"
			}
			
			for(var i = pb.startPcount; i <= pb.endPcount; i++){
				if($("#pop_page").val() == i ){
					html += "	<span page=\"" + i + "\"><b>" + i + "</b></span>"	
				}else{
					html += "	<span page=\"" + i + "\">" + i + "</span>"	
				}
			}
			
			if($("#page").val() == pb.maxPcount){
				html += "	<span pop_page=\"" + pb.maxPcount + "\">다음</span>"	
			}else{
				html += "	<span pop_page=\"" + ($("#pop_page").val()*1 + 1) + "\">다음</span>	"
			}
			
			html += "<span pop_page=\"" + pb.maxPcount + "\">끝</span>"
			
		$(".paging_wrap").html(html)
	}
