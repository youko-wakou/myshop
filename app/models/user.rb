class User < ApplicationRecord
  # .downcase= 文字の大文字小文字をアスキー文字のアルファベットを小文字に変換する
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :supports
  has_many :images
  has_many :profiles
  has_many :historys ,class_name: 'History'
  has_many :items
  has_many :favorites
  has_many :supports
  has_many :receives,class_name: 'Receive'
  has_many :shopping_carts,class_name: 'ShoppingCart'
  has_many :shopping_item, through: :shopping_carts,source: :item
  has_many :messages
  has_many :user_message, through: :messages,source: :message
  has_many :user_favorite,through: :favorites, source: :item
  has_one :item,dependent: :destroy
  has_one :profile,dependent: :destroy
  has_many :user_support ,through: :supports ,source: :support
end
