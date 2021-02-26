class Picture < ApplicationRecord
  validates :content, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites
end
