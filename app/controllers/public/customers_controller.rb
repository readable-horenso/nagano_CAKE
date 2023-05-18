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
    @customer = current_customer
    # is_deletedカラムをtrueにupdate
    @customer.update(is_deleted: true)
    #セッション情報を全て削除（セキュリティ面のリスク回避のため）
    reset_session
    redirect_to root_path, notice: "退会処理を実行いたしました。"
  end

  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postcode, :address, :phone_number, :email )
  end
end
