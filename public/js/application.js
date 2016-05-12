$(document).ready(function() {
  $(".filter-link").on("click", function(event){
    var $target = $(event.target);
    $("#question-container").slideUp(500);
    $(".filter-tabs").removeClass("active");
    $target.parent().addClass("active");
    $("#question-container").slideDown(500);
  });
});
