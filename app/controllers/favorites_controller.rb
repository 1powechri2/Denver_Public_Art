class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
    @user     = User.find(params[:user_id])
    @artwork  = Artwork.find(params[:user_artwork_id])
  end

  def create
    @favorite = Favorite.new(favorite_params)
      if @favorite.save
        @artwork  = Artwork.find(params[:format])
        flash[:success] = "You Have Favorited #{@artwork.title}"
        redirect_to user_path(current_user)
      else
        render :new
      end
    end

  private

  def favorite_params
    {rating: params[:rating], comment: params[:favorite][:comment],
    user_id: params[:user_id], artwork_id: params[:format]}
  end
end
