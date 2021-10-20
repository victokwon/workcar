$(document).ready(function () {
    $(".member_client_per").on("click", function () {
        $(".main_box_member1").css({ "display": "flex" });
        $(".main_box_member2").css({ "display": "none" });
    })
    $(".member_client_enter").on("click", function () {
        $(".main_box_member2").css({ "display": "flex" });
        $(".main_box_member1").css({ "display": "none" });
    })
})