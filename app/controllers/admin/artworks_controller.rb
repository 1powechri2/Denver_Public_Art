class Admin::ArtworksController < Admin::BaseController
  def index
    @arts = Artwork.all
  end

  def new
    @art = Artwork.new
  end

  def create
    Artwork.create(artwork_params)
    redirect_to admin_artworks_path
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist, :material, :location, :detailed_location, :notes)
  end
end
