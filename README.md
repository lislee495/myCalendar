# README for My Cal

## Description
This site offers an intuitive, clean app for creating events, sharing them with friends, and viewing them on a calendar. First, users can sign up and quickly create an event. The app will organize the user's events by their relation to today's date and time, so it's easy to see the nearest events. The app also allows users to add other users as their friends, and see who's added them as a friend, so that person can be easily shared to an event. Once a user has been shared to an event, it'll appear in their upcoming events. Finally, the app offers dynamic calendars for day, week, and month views (using 's code as the basis), which will show and highlight the events that occur on each day and, in the case of the day calendar, each hour.

## Update

This branch has been updated with jQuery to autoload the index view for Category and Events. jQuery is also used to fetch each category's event information on the click of a button and load next/previous event views. Finally, jQuery updates the form view with information immediately posted by it. The app uses jQuery and AJAX to avoid refreshes, improving the app's UX. 

## Instructions

Download and open the folder from https://github.com/snickers495/myCalendar
```
$ bundle install
$ rails s
```
Open localhost:3000 on browser.

## Contributors Guide

To contribute, please create an issue at https://github.com/snickers495/myCalendar/issues.

## License

This project has been licensed under the MIT open source license. Visit it at: https://github.com/snickers495/myCalendar/blob/master/LICENSE.md

## Credits

Credits to:
  * https://richonrails.com/articles/building-a-basic-calendar-in-ruby-on-rails for the basis of my calendars: month, week, and day
  * http://railscasts.com/episodes/163-self-referential-association?view=asciicast for Friendship associations, self-referential joins
  * https://launchschool.com/blog/integrating-rails-and-bootstrap-part-2 for Bootstrap integration
  * https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
