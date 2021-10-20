$(document).ready(function(){
    $(".member_report_ing").on("click",function () {
       $(".main_box_report1").css({"display":"flex"});
       $(".main_box_report2").css({"display":"none"});
    })
    $(".member_report_ed").on("click",function () {
       $(".main_box_report2").css({"display":"flex"});
       $(".main_box_report1").css({"display":"none"});
    })
})