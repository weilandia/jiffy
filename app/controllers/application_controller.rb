class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_categories
    @categories = Category.all
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def search_jifs(category)
    Giphy.search(category, {limit: 500})
  end

  def generate_jifs(category, jifs)
    random_count = (jifs.count * 2)
    random_count.times do
      jif = Giphy.random(@category.name)
      @category.jifs.create(jif_path: jif.image_url.to_s, static_path: JSON.parse(jif.to_json)["hash"]["fixed_height_small_still_url"], width: jif.image_width, height: jif.image_height)
    end
  end
end
