class User::CategoryController < ApplicationController
  before_action :authenticate_user!
  helper CategoryHelper
  def index
    @categories = current_user.categories.uniq 
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @category }
    end
  end
end
