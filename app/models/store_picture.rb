class StorePicture < ApplicationRecord
  belongs_to :store
  has_one_attached :picture
end
