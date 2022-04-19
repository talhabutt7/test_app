class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :destroy, :update]

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
    render json: 'Record not found', status: :unproccessable_entity unless @album
    if @album.update(album_params)
      render json: @album, status: :ok
    else
      render json: @album.errors, status: :unproccessable_entity
    end
  end

  def destroy
    if @album&.destroy
      render json: 'Record Deleted ', status: :ok
    else
      render json: 'Something went wrong', status: :unproccessable_entity
    end
  end

  def show
    render json: @album, status: :ok
  end

  private

  def album_params
    params.permit(:name, photos_attributes: [:id, :name, :image])
  end

  def set_album
    unless @album ||= ::Album.find_by(id: params[:id])
      render_not_found(:appointment, I18n.t('render.errors.auth.appointment_id'), :id)
    end
  end


end