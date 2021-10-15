$(function () {
  $("#iM").on("change", function () {
    if ($("#iM").is(":checked")) {
      $("#cM").prop("checked", false);
    }
    $("#type").val($(this).attr("name"));
  });
  $("#cM").on("change", function () {
    if ($("#cM").is(":checked")) {
      $("#iM").prop("checked", false);
    }
    $("#type").val($(this).attr("name"));
  });
});
