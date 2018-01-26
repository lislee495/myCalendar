$(document).ready(function() {
  // Make table rows clickable
  $(".table td").on('click', function(event) {
    var target = $(event.target);
    if (target.is(":not(a)")) {
      var href = $(this).find("a").first().attr("href");
      if(href) {
        window.location.href = href;
      } else {
        window.location.href = "/user/event/new"
      }
    }
  });
});
