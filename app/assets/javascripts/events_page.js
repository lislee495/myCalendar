$(document).on("turbolinks:load", function(){

    if ($('#events-list').is(':visible')) {
      console.log("true")
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
})