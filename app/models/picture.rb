class Picture < ApplicationRecord
  validates :content, length: { maximum: 600 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites
end
