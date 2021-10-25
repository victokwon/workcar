$(function () {
   $(".pop-container").on('keydown', function(event) {
     if (event.keyCode === 13) {
       event.preventDefault();
     }
     })
     
/* js에서 api 데이터 호출해서 활용하는 방법 =?= controller에서 api데이터 호출해서 활용하는 방법*/
  $("#sectorBtn").on("click", function () {
    $(".pop-container").show();
  });
  
    $("#schBtn").on("click", function () {
      schSector()
  });
  
  $("tbody").on("click", "tr", function () {
    $("#sectorInput").html($(this).attr("sName"));
    $(".pop-container").hide();
  });
  
   $(".paging_wrap").on("click","span",function(){
      $("#page").val($(this).attr("page"))
      schSector()
   })
});

function schSector() {
   let params = $("#sectorSchForm").serialize();
   
  $.ajax({
    type: "POST",
    data: params,
    url: "getSectorAjax",
    dataType: "json",
    success: function (res) {
     SectorList(res.list);
     drawPaging(res.pb)
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
      
      html += "sCode="
      
      html += "'" + data.S_CODE + "'"
      
      html += "sName="
      
      html += "'" + data.S_NAME + "'>"
      
      html += "    <td>" + data.S_CODE + "</td>"
      
      html += "    <td>" + data.S_NAME + "</td>"
      
      html += "</tr>"
      }
  

  $("#sectorList").html(html);
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
            html += "   <span page=\"" + pb.maxPcoung + "\">다음</span>"   
         }else{
            html += "   <span page=\"" + ($("#page").val()*1 + 1) + "\">다음</span>   "
         }
         
         html += "<span page=\"" + pb.maxPcount + "\">끝</span>"
         
      $(".paging_wrap").html(html)
   }