class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      # cart_itemの数量にプラス
      cart_item.quantity += params[:cart_item][:quantity].to_i
      # cart_itemの情報をアップデート
      cart_item.update(quantity: cart_item.quantity)
      # cart_item.update_cart_item(quantity: params[:cart_item][:quantity])
      flash[:success] = "カート内商品の個数が変更されました"
      redirect_to cart_items_path
    else
      @cart_item.save
      flash[:success] = "商品がカートに入りました"
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:success] = "カート内商品の個数が変更されました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)

    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
