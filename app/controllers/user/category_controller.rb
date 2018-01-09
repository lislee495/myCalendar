class User::CategoryController < ApplicationController
  before_action :authenticate_user!
  helper CategoryHelper
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end



end
