class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart.item_id
        @order_detail.order_id = @order.id
        @order_detail.quantity = cart.quantity
        @order_detail.price = cart.item.with_tax_price
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)

    # 現在の住所の場合
    if params[:order][:address_option] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.given_name

    #　登録済み住所の場合
    elsif params[:order][:address_option] == "1"
      destination = Destination.find(params[:order][:destination_id])
      @order.postcode = destination.postcode
      @order.address = destination.address
      @order.name = destination.name

    #　新規住所入力の場合
    elsif params[:order][:address_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render "new"
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postage, :payment_method, :name, :address, :postcode ,:customer_id ,:total_amount ,:status)
  end

end
