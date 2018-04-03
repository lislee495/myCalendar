//loads categories list 
$(document).on("turbolinks:load", function(){
    if ($('.categories-list').is(':visible')) {
    $.get('/user/category.json', (result) => {
      var categories = result
      if (categories.length > 0) {
        categories.forEach(category => {
          var categoryLink = '<a href="' + '/user/category/' + category.id + '">'
          var button = `<button class="category-${category.id} button" data-id="${category.id}" onclick="loadEvents(${category.id}); this.disabled=true;">See Events</button>`
          var categoryInfo = `<ul><li class="cat-li-${category.id}">` + categoryLink + category.name + "</a>  " + button + "</li></ul>"
          $('.categories-list').append(categoryInfo)
        })
      } else {
        $('#events-list').text("No events to show!")
      }
    })
}})
//loads events for each category 
function loadEvents(id) {
    $.get("/user/category/" + id + ".json", function(data){
    $(`.cat-li-${id}`).append(`<ul class="cat-ul-${id}" ></ul>`)
    var catEvents = data.events;
    catEvents.forEach(event => {
        var eventLink = '<a href="' + '/user/event/' + event.id + '">'
        var eventInfo = "<li>" + eventLink + event.short_description + "</a></li>"
        $(`.cat-ul-${id}`).append(eventInfo)
    })
    })
}