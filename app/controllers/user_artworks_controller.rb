class UserArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end
end
