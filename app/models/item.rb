class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
end
