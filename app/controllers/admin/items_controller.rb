class Admin::ItemsController < ApplicationController

  # before_action :authenticate_admin!
  
  def index
    @items = Item.all
    # .page(params[:page]).per(10)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
        flash[:notice] = "商品が新規登録されました"
        redirect_to admin_items_path
    else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if  @item.update(item_params)
        flash[:notice] = "商品が更新されました"
        redirect_to admin_item_path(@item)
    else
        render :edit
    end
  end

  private

  def item_params
    # 後にジャンルも許可する
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :is_valid)
  end

end
