class Message < ApplicationRecord
  belongs_to :user
  validates :user_id,presence: true
  validates :select_user,presence: true
  validates :title,presence: true,length: {maximum: 200}
  validates :content,presence: true,length: {maximum: 2000}
  
end
