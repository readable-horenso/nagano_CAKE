class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # def update_cart_item(quantity)
  #   cart_item = cart_items.find_by(item_id: params[:cart_item][:item_id])
  #   self.quantity += quantity[:quantity].to_i
  #   update(quantity: self.quantity)
  # end

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * quantity
  end

end
