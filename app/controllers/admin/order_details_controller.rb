class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all
    
    # 制作ステータスが全て「製作完了」かを確認する変数
    all_is_updated = true
    
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.status == 'in_production'
    end
    
    @order_details.each do |order_detail|
      if order_detail.status != 'production_complete'
        all_is_updated = false
      end
    end
    
    @order.update(status: 3) if all_is_updated
    
  end
  
  redirect_to admin_order_path(@order)
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:status)
  end
  
end