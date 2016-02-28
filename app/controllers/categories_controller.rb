class CategoriesController < ApplicationController
  before_action :find_categories
  def show
    find_category
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    jifs = search_jifs(@category.name)
    if jifs.empty?
      flash[:notice] = "Hey, there's no jifs for this category name.  ABORT. ABORT. ABORT."
      redirect_to admin_user_path(current_user)
    elsif @category.save
      generate_jifs(@category, jifs)
      flash[:notice] = "Jifs have been created."
      redirect_to admin_user_path(current_user)
    else
      flash[:notice] = "Hey, this categroy already exists."
      redirect_to admin_user_path(current_user)
    end
  end

private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
