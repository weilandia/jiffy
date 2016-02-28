class CategoriesController < ApplicationController
  before_action :find_category
  before_action :find_categories
  def show
  end

private
  def find_category
    @category = Category.find(params[:id])
  end
end
