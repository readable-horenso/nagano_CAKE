class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
    @items_counts = Item.page(1).total_count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
