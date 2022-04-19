class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :image, ImageUploader

  validates_presence_of :name
end
