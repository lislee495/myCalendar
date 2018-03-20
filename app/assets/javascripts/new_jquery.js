function Event(attributes) {
  this.date = attributes.date
  this.start_time = attributes.start_time
  this.end_time = attributes.end_time
  this.short_description = attributes.short_description
  this.additional_info = attributes.additional_info
  this.id = attributes.id 
  this.owner = attributes.user_ids.first
}

Event.prototype.formatDate = function(){
  var newDate = new Date(this.date)
  return newDate.toDateString() 
}

Event.prototype.formatStartTime = function(){
  var newStart = new Date(this.start_time)
  return newStart.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
}

Event.prototype.formatEndTime = function(){
  var endTime = new Date(this.end_time)
  return endTime.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
}

$(document).on("turbolinks:load", function(){
  $(".js-change").on("click", function() {
        var firstEventId;
        var lastEventId;
        var usersEventIds;
        var newId;
        var newClass = $(this).attr("class").split(" ")[1]
        $.get("/user/event.json", function(events){
          firstEventId=events[0].id
          lastEventId=events[(events.length - 1)].id
          usersEventIds=events.map(ele => ele.id)
          var eventInd = usersEventIds.indexOf(parseInt($(".js-change").attr("data-id")))
          if (newClass === "prev") {
            newId = usersEventIds[eventInd - 1]
          } else {
            newId = usersEventIds[eventInd + 1]
          }
          $.get("/user/event/" + newId + ".json", function(data) {
            var event = new Event(data)
            $("#short_descriptor").text(event.short_description);
            $("#start_time").text(event.formatStartTime());
            $("#end_time").text(event.formatEndTime());
            $("#date").text(event.formatDate());
            $("#add_info").text(event.additional_info);
            $("#owner").text(event.owner);
            if (newId === lastEventId) {
              $(".next").hide()
            } else if (newId === firstEventId) {
              $(".prev").hide()
            } else {
              $(".next").attr("data-id", newId).show();
              $(".prev").attr("data-id", newId).show();
            } 
            history.replaceState(null, null, 'http://localhost:3000/user/event/' + newId);
        })
      })
    })

    //adds event preview on Form page 
    $('#event_form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post('/user/event', values);
      posting.done(function(data) {
        var event = new Event(data)
        $("#eventName").text("New event: " + event["short_description"]);
        var info = `<p>Date: ${event.formatDate()}</p>` +
        `<p>Start Time: ${event.formatStartTime()}</p>`+
        `<p>End Time: ${event.formatEndTime()}</p>` +
        `<p>Event Description: ${event.additional_info}</p>`
        $("#event-info").append(info)
      });
    });
})
    // //show next event for Show Event 
    // //enables user to only see their events
    // //also updates the next/prev buttons dynamically 
    


