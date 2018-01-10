class User::FriendshipController < ApplicationController
  before_action :authenticate_user!
  helper FriendshipHelper

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :owner_id)
  end
end
