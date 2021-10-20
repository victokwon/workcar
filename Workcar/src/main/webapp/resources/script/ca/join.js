$(function () {
  $("#IM").on("change", function () {
    if ($("#IM").is(":checked")) {
      $("#CM").prop("checked", false);
      
    }
    $("#type").val($(this).attr("name"));
  });
  $("#CM").on("change", function () {
    if ($("#CM").is(":checked")) {
      $("#IM").prop("checked", false);
    }
    $("#type").val($(this).attr("name"));
  });
});
