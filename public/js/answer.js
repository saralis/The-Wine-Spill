// $(document).ready(function() {
//   $("#answer-form").click(function(e) {
//     e.preventDefault();

//     var data = $(e.target).serialize();
//     var url = e.target.action;
//     var type = e.target.method;

//     var ajaxRequest= $.ajax({
//       data: data,
//       type: type,
//       url: url,
//     });

//     ajaxRequest.done(function(response){
//       $("#answers-list").closest(response);
//     });

//   });
// });