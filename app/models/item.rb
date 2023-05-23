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

# def get_image(width, height)
#   unless image.attached?
#     file_path = Rails.root.join('app/assets/images/no_image.jpg')
#     image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
#   end
#   image.variant(resize_to_limit: [width, height])
# end

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
  
  def self.looks(word)
    @item = Item.where('name LIKE?', "#{word}" )
  end
  
end
