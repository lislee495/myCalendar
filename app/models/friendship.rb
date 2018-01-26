class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', foreign_key: 'friend_id'

  def self.users_who_added(user)
    where("friend_id = ?", user.id)
  end

  def self.all_except(user)
  where.not(id: user)
  end
end
