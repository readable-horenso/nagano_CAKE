class Public::DestinationsController < ApplicationController

  def index
    @destinations = current_customer.destinations
    @destination = Destination.new
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    destination = Destination.new(destination_params)
    destination.customer_id = current_customer.id
    if destination.save
       flash[:success] = "配送先が新規登録されました"
       redirect_to destinations_path
    else
      flash[:danger] = "全て入力してください"
      render :index
    end
  end

  def update
    @destination = Destination.find(params[:id])
    if  @destination.update(destination_params)
        flash[:warning] = "配送先が更新されました"
        redirect_to destinations_path
    else
        flash.now[:danger] = "全て入力してください"
        render :edit
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    flash[:danger] = "削除しました"
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :postcode, :address)
  end

end
