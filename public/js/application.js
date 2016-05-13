$(document).ready(function() {

  var ids = ["#view-sort", "#vote-sort", "#recent-sort"] //Array for sort tab ids on home page

  function removeShow(){ // Function which removes the show class from each tab, which hides the content inside of it
    ids.forEach(function(id){
      $(id).removeClass('show');
    });
  }

  $(".filter-link").on("click", function(event){  //When a tab is clicked, color of tab changes, question container slides up and down
    var $target = $(event.target);
    $("#question-container").slideUp();
    $(".filter-tabs").removeClass("active");
    $target.parent().addClass("active");
    $("#question-container").slideDown();
  });

// Sort logic for each tab

  $("#viewed a").on("click", function(event) { // Adds the show class to the first element in the ids array
    setTimeout(function(){ // Function inside will wait 1/2 second before firing
      removeShow();
      $(ids[0]).addClass('show');
    }, 500);

  });

  $("#voted a").on("click", function(event) { // Adds the show class to the second element in the ids array
    setTimeout(function(){  // Function inside will wait 1/2 second before firing
      removeShow();
      $(ids[1]).addClass('show');
    }, 500);
  });

  $("#recent a").on("click", function(event) { // Adds the show class to the third element in the ids array
    setTimeout(function(){  // Function inside will wait 1/2 second before firing
      removeShow();
      $(ids[2]).addClass('show');
    }, 500);
  });


  $('.upvote').on('click', function(event){ //Change color of voting grapes
  	var $target = $(event.target);
  	$(this).css('background-color', '#8e44ad');

  });
// AJAX for votes

  $('#question-up').on('submit', function(event){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('action'),
      type: $target.attr('method'),
      // dataType: 'json'
    }).done(function(response){
      $('#question-votes').html(response);
    });
  });










});



