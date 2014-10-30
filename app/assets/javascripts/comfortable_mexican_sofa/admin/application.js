// Overwrite this file in your application /app/assets/javascripts/comfortable_mexican_sofa/admin/application.js 
$(document).ready(function() {
  site_delete_btn = $(".btn.btn-small.btn-danger");
  if (site_delete_btn.data('confirm') == "Are you sure you want to delete this site?") {
    site_delete_btn.hide();
  }
});