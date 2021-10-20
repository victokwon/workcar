$(document).ready(function(){
    $(".regi_info").on("click",function () {
       $(".main_box_regi1").css({"display":"flex"});
       $(".main_box_regi2").css({"display":"none"});
       $(".main_box_regi3").css({"display":"none"});
       
    })
    $(".regi_corpoation").on("click",function () {
        $(".main_box_regi2").css({"display":"flex"});
        $(".main_box_regi1").css({"display":"none"});
        $(".main_box_regi3").css({"display":"none"});
     })
     $(".regi_update").on("click",function () {
        $(".main_box_regi3").css({"display":"flex"});
        $(".main_box_regi1").css({"display":"none"});
        $(".main_box_regi2").css({"display":"none"});
     })
})