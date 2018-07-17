class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    @locations = Artwork.pluck(:location).uniq
  end
end
