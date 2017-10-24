class Item < ApplicationRecord
  belongs_to :user
  
  has_many :shopping_carts,class_name: 'ShoppingCart'
  validates :user_id, presence: true
  validates :image,presence: true
  validates :category,presence: true
  validates :price,presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :view, presence: true
  validates :history,presence: true
  mount_uploader :image, ItemUploader
end