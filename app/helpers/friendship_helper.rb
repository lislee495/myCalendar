module FriendshipHelper

  def added_me
    friendships = Friendship.users_who_added(current_user)
    friendships.select {|friendship| !current_user.friends.include?(User.find(friendship.user_id))}
  end

  def not_added_back
    added_me.map do |friendship|
      User.find(friendship.user_id)
    end
  end


end
