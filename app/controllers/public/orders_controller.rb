class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        order_detail.price = cart.price
      end
      redirect_to confirm_orders_path
      cart_items.desrtoy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    
    # 現在の住所の場合
    if params[:order][:address_option] == "0"
      @order.destination_post_code = current_customer.post_code
      @order.destination_address = current_customer.address
      @order.destination_name = current_customer.family_name + current_customer.given_name
      
    #　登録した配送先の場合
    elsif params[:order][:address_option] == "1"
      destination = Address.find(params[:order][:customer_id])
      @order.destination_post_code = destination.post_code
      @order.destination_address = destination.address
      @order.destination_name = destination.name
      
    #　新規住所入力の場合
    elsif params[:order][:address_option] = "2"
      @order.destination_post_code = params[:order][:destination_post_code]
      @order.destination_address = params[:order][:destination_address]
      @order.destination_name = params[:order][:destination_name]
    else
      render "new"
    end
  end

  def complete
  end

end
