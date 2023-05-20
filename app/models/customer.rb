class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  with_options presence: true do
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :postcode
    validates :address
    validates :phone_number
    validates :email
  end
  
  # 会員フルネーム
  def full_name
    self.family_name + "　" + self.given_name
  end
  
  # 会員フルネーム（カナ）
  def full_name_kana
    self.family_name_kana + "　" + self.given_name_kana
  end
end
