$(document).ready(function () {
    $(".regi_update").on("click", function () {
        $(".main_box1").css({ "display": "none" });
        $(".main_box2").css({ "display": "flex" });
        // $(".main_box2").css({"justify-content": "flex-start"});
    })
    $(".regi_info").on("click", function () {
        $(".main_box2").css({ "display": "none" });
        $(".main_box1").css({ "display": "flex" });
    })
})