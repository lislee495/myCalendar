module ApplicationHelper

  def any_events?
    if current_user
      current_user.events.any? ? true : false
    end
  end

  def any_friends?
      current_user.friends.any? ? true : false
  end
end
