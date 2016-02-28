class JifsController < ApplicationController
  before_action :find_categories
  before_action :find_category
  before_action :find_jif
  def show
  end

private
  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_jif
    @jif = Jif.find(params[:id])
  end
end
