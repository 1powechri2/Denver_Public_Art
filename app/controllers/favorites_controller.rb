class FavoritesController < ApplicationController
  def new
    @favorite  = Favorite.new
    @user      = User.find(params[:user_id])
    @artwork   = Artwork.find(params[:artwork_id])
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
      @artwork  = Artwork.find(params[:artwork_id])
      flash[:success] = "You Have Favorited #{@artwork.title}"
      redirect_to user_path(current_user)
  end

  def edit
    @favorite = Favorite.find(params[:id])
    @user     = User.find(params[:user_id])
    @artwork  = Artwork.find(params[:artwork_id])
  end

  def update
    favorite = Favorite.find(params[:id])
    favorite.update(favorite_params)
    redirect_to user_path(current_user)
  end

  private

  def favorite_params
    {rating: params[:rating], comment: params[:favorite][:comment],
    user_id: params[:user_id], artwork_id: params[:artwork_id]}
  end
end
