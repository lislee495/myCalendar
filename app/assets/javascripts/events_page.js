//loads events list  
$(document).on("turbolinks:load", function(){
    if ($('#events-list').is(':visible')) {
      $.get('/user/event.json', (result)=>{
        var events = result
        if (events.length > 0) {
          let sortedEvents = events.sort((a, b) => {
            if (a.short_description < b.short_description) {
              return -1
            } else if (a.short_description > b.short_description) {
              return 1
            } else {
              return 0
            }
          })
          sortedEvents.forEach(event => {
            let updatedEvent = new Event(event)
            console.log(updatedEvent)
            $('#events-list').append(updatedEvent.formatBulletPoint())
          })
        } else {
          $('#events-list').text("No events to show!")
        }
      })
  }
})
