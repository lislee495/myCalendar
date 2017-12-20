class User::FriendshipController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def friend_params
    params.require(:user).permit(:email)
  end
end
