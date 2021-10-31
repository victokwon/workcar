$(function(){
	$(".pop-container").on('keydown', function(event) {
		if (event.keyCode === 13) {
		event.preventDefault();
		}
	});
	
	$("#cancelBtn").on("click", function(){
		$(".pop-container").hide();
	});
	
	$("#sectorBtn").on("click", function () {
	$(".pop-container").attr("btn","s")
	    $(".pop-text-header").children("h1").html("직종 검색")
	    $("#qualList").html("");
	    $("#schCName").val("");
	    $(".pop-container").show();
	    $("#schSectorBtn").show()
		$("#schQualBtn").hide()
		

	});
	$("#schSectorBtn").on("click", function () {
		schSector()
  	});
  	$("#resetBtn").on("click", function(){
  		$("#sectorInput").val("직종검색");
  		$("#sectorInput").attr("sNo","");
  	});

 	
}); 
function schSector() {
   let params = $("#qualSchForm").serialize();
   
  $.ajax({
    type: "POST",
    data: params,
    url: "getSectorList",
    dataType: "json",
    success: function (res) {
    console.log(res.list);
     SectorList(res.list);
     popdrawPaging(res.pb)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}
function SectorList(list) {
  let html = "";
  
      for(let data of list){
      html += "<tr "
      
      html += "sNo="
      
      html += "'" + data.SECTOR_NO + "'"
      
      html += "sName="
      
      html += "'" + data.SECTOR_NAME + "'>"
      
      html += "    <td>" + data.SECTOR_NO + "</td>"
      
      html += "    <td>" + data.SECTOR_NAME + "</td>"
      
      html += "</tr>"
      }
  

  $("#qualList").html(html);
}
function popdrawPaging(pb) {
	let html = ""
		/* 현재 페이지 굵은 글씨 적용*/
		html += "<span pop_page=\"1\">처음</span>"
		
		if($("#pop_page").val() == 1){
			html +=	"	<span pop_page=\"1\">이전</span>"	
		}else{
			html += "	<span pop_page=\"" + ($("#pop_page").val()*1 - 1) + "\">이전</span>	"
		}
		
		for(var i = pb.startPcount; i <= pb.endPcount; i++){
			if($("#pop_page").val() == i ){
				html += "	<span pop_page=\"" + i + "\"><b>" + i + "</b></span>"	
			}else{
				html += "	<span pop_page=\"" + i + "\">" + i + "</span>"	
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

