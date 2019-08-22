document.addEventListener("turbolinks:load", function() {
  $(".class_type").selectedIndex = 0;
  if ($(".class_type")) {
    toggleFields();
    $(".class_type").change(function () {
        toggleFields();
    });
  }
});

function toggleFields() {
  var value = $('.class_type>option:selected').text()
  console.log(value)
  if (value) {
    $("." + value.toLowerCase()).show()
    $(".field").not("." + value.toLowerCase()).hide();
  }
}
