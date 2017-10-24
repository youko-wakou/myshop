class Support < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length:{ maximum: 2000 }
  validates :title, presence: true, length:{ maximum: 255 }
  
end
