class User::FriendshipController < ApplicationController
  before_action :authenticate_user!
  helper FriendshipHelper
  def new
    @friendship = current_user.friendships.build
  end

  def index

  end

  def create
    if find_friend
      @friendship = current_user.friendships.build(friend_id: friend_params[:user_id])
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
    @friendship = current_user.friendships.find_by(friend_id: friend_params[:user_id])
    @friendship.delete
    redirect_to root_url
  end

  private

  def find_friend
    user = User.find_by(id: friend_params[:user_id])
    user
  end

  def friend_params
    params.require(:friendship).permit(:user_id)
  end
end
