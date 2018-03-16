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
  return newStart.toTimeString()
}

Event.prototype.formatEndTime = function(){
  var endTime = new Date(this.end_time)
  return endTime.toTimeString()
}
$(document).ready(function(){
    //list events on Events Index 
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

    if (document.location.pathname == "/user/category") {
      $.get('/user/category.json', (result) => {
        var categories = result
        if (categories.length > 0) {
          categories.forEach(category => {
            var categoryLink = '<a href="' + '/user/category/' + category.id + '">'
            var button = `<button class="category-${category.id}" data-id="${category.id}" onclick="loadEvents(${category.id})">See Events</button>`
            var categoryInfo = `<ul><li class="cat-li-${category.id}">` + categoryLink + category.name + "</a>" + button + "</li></ul>"
            $('.categories-list').append(categoryInfo)
          })
        } else {
          $('#events-list').text("No events to show!")
        }
      })
    }
    //show next event for Show Event 
    $(".js-change").on("click", function() {
        var newClass = $(this).attr("class").split(" ")[1]
        if (newClass === "prev") {
          var newId = parseInt($(".js-change").attr("data-id")) - 1;
        } else {
          var newId = parseInt($(".js-change").attr("data-id")) + 1;
        }
        $.get("/user/event/" + newId + ".json", function(data) {
          var event = new Event(data)
          $("#short_descriptor").text(event.short_description);
          $("#start_time").text(event.formatStartTime());
          $("#end_time").text(event.formatEndTime());
          $("#date").text(event.formatDate());
          $("#add_info").text(event.additional_info);
          $("#owner").text(event.owner);
          $(".next").attr("data-id", newId);
          $(".prev").attr("data-id", newId);
          history.replaceState(null, null, 'http://localhost:3000/user/event/' + newId);
        });
      });

    //adds event preview on Form page 
    $('#event_form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post('/user/event', values);
      posting.done(function(data) {
        var event = new Event(data)
        $("#eventName").text(event["short_description"]);
        $("#eventDate").text(event.formatDate());
        $("#eventStart").text(event.formatStartTime());
        $("#eventEnd").text(event.formatEndTime());
        $("#eventDescription").text(event["additional_info"]);
      });
    });
})

function loadEvents(id) {
    // var id = event.target.dataset.id
    $.get("/user/category/" + id + ".json", function(data){
      $(`.cat-li-${id}`).append(`<ul class="cat-ul-${id}" ></ul>`)
      var catEvents = data.events;
      console.log(catEvents)
      catEvents.forEach(event => {
        var eventLink = '<a href="' + '/user/event/' + event.id + '">'
        var eventInfo = "<li>" + eventLink + event.short_description + "</a></li>"
        $(`.cat-ul-${id}`).append(eventInfo)
      })
    })
}
