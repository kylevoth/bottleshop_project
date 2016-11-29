class Product < ApplicationRecord
  belongs_to :type

  paginates_per 3

  mount_uploader :image, ImageUploader
end
