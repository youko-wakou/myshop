class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :user_id, presence: true
  validates :image,presence: true
  
 
end
