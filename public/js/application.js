$(document).ready(function() {
  $(".filter-link").on("click", function(event){
    var $target = $(event.target);
    $(".filter-tabs").removeClass("active");
    $target.parent().addClass("active");
  });
});
