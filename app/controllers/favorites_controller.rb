class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @jif = Jif.find(params[:jif_id])
    @favorite = @user.favorites.new(jif_id: params[:jif_id])
    if @favorite.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "You've already favorited!"
      redirect_to category_jif_path(@jif.category_id, @jif)
    end
  end
end
