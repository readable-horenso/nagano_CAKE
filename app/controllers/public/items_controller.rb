class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def params_cart_item
    params.reqire(:cart_item).permit(:quantity)
  end
end
