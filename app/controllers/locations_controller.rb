class LocationsController < ApplicationController
  def index
    @locations = Artwork.uniq_locations
  end
end
