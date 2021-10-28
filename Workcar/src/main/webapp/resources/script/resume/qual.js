$(function () {
   $(".pop-container").on('keydown', function(event) {
     if (event.keyCode === 13) {
       event.preventDefault();
     }
     })

     $(".pop-close-btn").on('click', function(event) {
   		  $(".pop-container").hide();
     })
     
/* js에서 api 데이터 호출해서 활용하는 방법 =?= controller에서 api데이터 호출해서 활용하는 방법*/
	$("#resumeLisence").on("click", "#qualBtn",function () {
		$(".pop-container").attr("btn",$(this).attr("btn"))
		$("#list_box").attr("no", $(this).attr("no"))
		$(".pop-text-header").children("h1").html("자격증 검색")
		$("#list_box").html("");
	    $(".pop-container").show();
	    $("#schQualBtn").show()
	    $("#schSectorBtn").hide()
	});
  
    $("#schQualBtn").on("click", function () {
      schQual()
  });
  
  
   $(".paging_wrap").on("click","span",function(){
      $("#page").val($(this).attr("page"))
      schQual()
   })
});

function schQual() {
   let params = $("#schForm").serialize();
   
  $.ajax({
    type: "POST",
    data: params,
    url: "getQualAjax",
    dataType: "json",
    success: function (res) {
     QualList(res.list);
     drawPaging(res.pb)
    },
    error: function (request, status, error) {
      console.log(request);
      console.log(error);
    }
  });
}

function QualList(list) {
  let html = "";
  
      for(let data of list){
      html += "<tr "
      
      html += "qNo="
      
      html += "'" + data.QUAL_NO + "'"
      
      html += "qName="
      
      html += "'" + data.QUAL_NAME + "'>"
      
      html += "    <td class='td_no'>" + data.QUAL_NO + "</td>"
      
      html += "    <td class='td_name'>" + data.QUAL_NAME + "</td>"
      
      html += "</tr>"
      }
  

  $("#list_box").html(html);
}

function drawPaging(pb) {
      let html = ""
         /* 현재 페이지 굵은 글씨 적용*/
         html += "<span page=\"1\">처음</span>"
         
         if($("#page").val() == 1){
            html +=   "   <span page=\"1\">이전</span>"   
         }else{
            html += "   <span page=\"" + ($("#page").val()*1 - 1) + "\">이전</span>   "
         }
         
         for(var i = pb.startPcount; i <= pb.endPcount; i++){
            if($("#page").val() == i ){
               html += "   <span page=\"" + i + "\"><b>" + i + "</b></span>"   
            }else{
               html += "   <span page=\"" + i + "\">" + i + "</span>"   
            }
         }
         
         if($("#page").val() == pb.maxPcount){
            html += "   <span page=\"" + pb.maxPcount + "\">다음</span>"   
         }else{
            html += "   <span page=\"" + ($("#page").val()*1 + 1) + "\">다음</span>   "
         }
         
         html += "<span page=\"" + pb.maxPcount + "\">끝</span>"
         
      $(".paging_wrap").html(html)
   }