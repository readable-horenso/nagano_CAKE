class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  
  has_one_attached :image
  
  ## 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
end