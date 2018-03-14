class User::CategoryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
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

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to user_category_path(@category)
    else
      render :edit
    end
  end

  def destroy

    @category.delete
    redirect_to user_category_index_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
