class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all
    render json: @photos
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: @photo, status: :ok
    else
      render json: @photo, status: :unproccessable_entity
    end
  end

  def update
    @photo = Photo.find_by(id: params[:id])
    render json: 'Record not found', status: :unproccessable_entity unless @photo
    if @photo.update(photo_params)
      render json: @photo, status: :ok
    else
      render json: @photo.errors, status: :unproccessable_entity
    end
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    if @photo&.destroy
      render json: 'Record Deleted ', status: :ok
    else
      render json: 'Something went wrong', status: :unproccessable_entity
    end
  end

  private

  def photo_params
    params.permit(:name, :image, :album_id)
  end


end