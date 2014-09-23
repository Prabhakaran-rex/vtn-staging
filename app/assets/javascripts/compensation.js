$(document).ready(function() {
  Compensation.handle_checkbox_is_over();


  $("#compensation_is_over").on('click', function() {
    Compensation.handle_checkbox_is_over();
  })

});

var Compensation = {
  handle_checkbox_is_over : function() {

    if ($("#compensation_is_over").length > 0 && $("#compensation_is_over")[0].checked) {
      $("#compensation_max_range").attr("disabled", true);
      $("#compensation_max_range")[0].value = "";
    }
    else {
      $("#compensation_max_range").attr("disabled", false);
    }
  }
}