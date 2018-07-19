class ArtController < ApplicationController
  def index
    @artworks = Artwork.all
  end
end
