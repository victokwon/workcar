$(document).ready(function () {

    $(".inter_announcement").on("click", function () {
        $(".main_box_inter1").css({ "display": "flex" });
        $(".main_box_inter2").css({ "display": "none" });
    })
    $(".inter_enterprise").on("click", function () {
        $(".main_box_inter2").css({ "display": "flex" });
        $(".main_box_inter1").css({ "display": "none" });
    })

});