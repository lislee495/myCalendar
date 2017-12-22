class User::FriendshipController < ApplicationController
  def new
    @friendship = current_user.friendships.build
  end

  def create
    if find_friend
      @friendship = current_user.friendships.build(friend_id: user.id)
      if @friendship.save
        flash[:notice] = "Added friend."
        redirect_to root_url
      else
        flash[:notice] = "Unable to add friend."
        redirect_to root_url
      end
    else
      flash[:notice] = "Unable to find friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: User.find_by(username: friend_params[:username]))
    @friendship.delete
    redirect_to root_url
  end

  private

  def find_friend
    if params[:username]
      user = User.find_by(username: params[:username])
    else
      user = User.find_by(username: params[:email])
    end
    user
  end
end
