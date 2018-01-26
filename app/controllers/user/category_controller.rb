class User::CategoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.uniq if current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end
end
