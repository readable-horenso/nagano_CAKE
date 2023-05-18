class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "更新が成功しました。"
    else
      render 'edit'
    end
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postcode, :address, :phone_number, :email )
  end
end
