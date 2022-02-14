class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])
    arts = user.artworks
    shared = user.artwork_shares
    render json: [arts, shared]
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
        redirect_to '/artworks/'+artwork.id.to_s
    else
        render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
        render json: artwork
    else
        render json: artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
  
end
