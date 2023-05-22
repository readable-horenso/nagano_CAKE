class Admin::ItemsController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      flash[:success] = '商品が新規登録されました'
      redirect_to admin_items_path
    else
      flash.now[:danger] = "画像ファイルを選択してください"
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
    @item = Item.find(params[:id])
    if  @item.update(item_params)
        flash[:warning] = '商品が更新されました'
        redirect_to admin_item_path(@item)
    else
        flash.now[:danger] = "全て入力してください"
        render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :is_valid)
  end

end
