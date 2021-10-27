$(document).ready(function () {
    $(".regi_update").on("click", function () {
        $(".main_box_regi1").css({ "display": "none" });
        $(".main_box_regi2").css({ "display": "flex" });
        // $(".main_box_regi2").css({"justify-content": "flex-start"});
    })
    $(".regi_info").on("click", function () {
        $(".main_box_regi2").css({ "display": "none" });
        $(".main_box_regi1").css({ "display": "flex" });
    })
})