$(function () {
  $("#jobPost").on("click", function () {
    $(".job_post_tab").css("display", "table");
    $(".job_post_resume").css("display", "none");
  });
  $("#jobResume").on("click", function () {
    $(".job_post_tab").css("display", "none");
    $(".job_post_resume").css("display", "table");
  });
});
