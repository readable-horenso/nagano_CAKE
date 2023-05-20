class Public::DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
    @destination = Destination.new
  end

  def edit
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
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :postcode, :address)
  end

end
