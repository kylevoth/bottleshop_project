class Product < ApplicationRecord
  belongs_to :type
  has_many :order_items

  paginates_per 3

  mount_uploader :image, ImageUploader
end
