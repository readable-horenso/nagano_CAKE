class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_customer_path(params[:id])
    else
      flash[:danger] = "更新に失敗しました"
      render "edit"
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postcode, :address, :phone_number, :email, :is_deleted )
  end
  
end
