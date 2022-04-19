class AlbumsController < ApplicationController

  def index
    @albums = Album.all.includes(:photos)
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      render json: @album, status: :ok
    else
      render json: @album.errors, status: :unproccessable_entity
    end
  end 

  def update
    @album = Album.find_by(id: params[:id])
    render json: 'Record not found', status: :unproccessable_entity unless @album
    if @album.update(album_params)
      render json: @album, status: :ok
    else
      render json: @album.errors, status: :unproccessable_entity
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album&.destroy
      render json: 'Record Deleted ', status: :ok
    else
      render json: 'Something went wrong', status: :unproccessable_entity
    end
  end

  private

  def album_params
    params.permit(:name, photos_attributes: [:id, :name, :image])
  end


end