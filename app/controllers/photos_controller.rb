class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy, :update]

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: @photo, status: :ok
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @photo.update(photo_params)
      render json: @photo, status: :ok
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @photo&.destroy
      render json: 'Record Deleted ', status: :ok
    else
      render json: 'Something went wrong', status: :unprocessable_entity
    end
  end

  def show; end

  private

  def photo_params
    params.permit(:name, :image, :album_id)
  end

  def set_photo
    unless @photo ||= ::Photo.find_by(id: params[:id])
      render json: 'No such record exist', status: :unprocessable_entity
    end
  end

end