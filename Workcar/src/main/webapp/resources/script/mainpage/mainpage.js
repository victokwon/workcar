/* openBtn */ function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("sdienav_ul").style.fontSize = "1em";
  document.getElementById("side_bcc").style.width = "100%";
  
}

/* closeBtn */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("sdienav_ul").style.fontSize = "0em";
  document.getElementById("side_bcc").style.width = "0";
}
$(function () {
  $("#iMBtn").on("click", function () {
    $(".iM").css("display", "flex");
    $(".cM").css("display", "none");
    $(".mM").css("display", "none");
  });
  $("#cMBtn").on("click", function () {
    $(".iM").css("display", "none");
    $(".cM").css("display", "flex");
    $(".mM").css("display", "none");
  });
  $("#mMBtn").on("click", function () {
    $(".iM").css("display", "none");
    $(".cM").css("display", "none");
    $(".mM").css("display", "flex");
  });
});
