class UserLocationController < ApplicationController
  def show_art
    @artworks = Artwork.find_all_by_location(params[:location])
    @location = params[:location]
  end
end
