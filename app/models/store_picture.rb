class StorePicture < ApplicationRecord
  belongs_to :store
  has_one_attached :picture
  validates :picture, attached: true, content_type: [:png, :jpg, :jpeg]
end
