class Profile < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :place, presence: true, length: {maximum: 250}
  validates :hp ,presence: true,length: { maximum: 250}
  validates :twitter, presence: true,length: {maximum: 100}
  validates :pr, presence: true,length: {maximum: 500 }
  
end