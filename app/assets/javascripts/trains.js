document.addEventListener("turbolinks:load", function() {
  $(".dbclick").dblclick(function(e) {
    e.preventDefault();
    $(".toggle_val_" + $(this).data('resourceId')).toggle();
  });
  $(".cancel").click(function () {
    $(".toggle_val_" + $(this).parent().prev().data('resourceId')).toggle();
  });
});
