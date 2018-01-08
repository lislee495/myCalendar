module ApplicationHelper

  def any_events?
    current_user.events.any? ? true : false 
  end

  def any_friends?
    current_user.friends.any? ? true : false
  end
end
