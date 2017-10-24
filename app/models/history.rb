class History < ApplicationRecord
  belongs_to :user
  
  validates :user_id,presence: true
  validates :item_id,presence: true
  validates :total,presence: true
end
