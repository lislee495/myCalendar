$(document).ready(function(){

    if (document.location.pathname == "/user/event") {
      $.get('/user/event.json', (result)=>{
        var events = result
        if (events.length > 0) {
          events.forEach(event => {
            var eventLink = '<a href="' + '/user/event/' + event.id + '">'
            var eventInfo = "<li>" + eventLink + event.short_description + "</a>" + "</li>"
            $('#events-list').append(eventInfo)
          })
        } else {
          $('#events-list').text("No events to show!")
        }
      })
    }



    $(".js-next").on("click", function() {
        var nextId = parseInt($(".js-next").attr("data-id")) + 1;
        $.get("/user/event/" + nextId + ".json", function(data) {
          var event = data;
          $("#short_descriptor").text(event["short_descriptor"]);
          $("#start_time").text(event["start_time"]);
          $("#end_time").text(event["end_time"]);
          $("#date").text(event["date"]);
          $("#add_info").text(event["additional_info"]);
          $("#owner").text(event["user_ids"].first);
          $(".js-next").attr("data-id", nextId);
          $(".js-prev").attr("data-id", nextId);
          history.replaceState(null, null, 'http://localhost:3000/user/event/' + nextId);
        });
      });

      $(".js-prev").on("click", function() {
        var prevId = parseInt($(".js-prev").attr("data-id")) - 1;
        $.get("/user/event/" + prevId + ".json", function(data) {
          var event = data;
          $("#short_descriptor").text(event["short_descriptor"]);
          $("#start_time").text(event["start_time"]);
          $("#end_time").text(event["end_time"]);
          $("#date").text(event.date);
          $("#add_info").text(event["additional_info"]);
          $("#owner").text(event["user_ids"].first);
          $(".js-prev").attr("data-id", prevId);
          $(".js-next").attr("data-id", prevId);
          history.replaceState(null, null, 'http://localhost:3000/user/event/' + prevId);
        });
      });

    $('#event_form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post('/user/event', values);
      posting.done(function(data) {
        var event = data;
        $("#eventName").text(event["short_description"]);
        $("#eventDate").text(event["date"]);
        $("#eventStart").text(event["start_time"]);
        $("#eventEnd").text(event["end_time"]);
        $("#eventDescription").text(event["additional_info"]);
      });
    });
})
