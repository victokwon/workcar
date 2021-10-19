$(document).ready(function () {

    $(".act_apply").on("click", function () {
        $(".main_box_act1").css({ "display": "flex" });
        $(".main_box_act2").css({ "display": "none" });
        $(".main_box_act3").css({ "display": "none" });
    })
    $(".act_submit").on("click", function () {
        $(".main_box_act2").css({ "display": "flex" });
        $(".main_box_act1").css({ "display": "none" });
        $(".main_box_act3").css({ "display": "none" });
    })
    $(".act_evaluate").on("click", function () {
        $(".main_box_act3").css({ "display": "flex" });
        $(".main_box_act1").css({ "display": "none" });
        $(".main_box_act2").css({ "display": "none" });
    })

});