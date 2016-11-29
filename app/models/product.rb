class Product < ApplicationRecord
  belongs_to :type

  mount_uploader :image, ImageUploader
end
