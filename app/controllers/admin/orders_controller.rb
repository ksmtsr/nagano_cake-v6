class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirmation"
       @order.order_details.each do |order_detail|
         order_detail.update(making_status:1)
    end
    end
    redirect_to admin_order_path
  end

  def order_params
    params.require(:order).permit(:customer_id, :item_id, :tax_included_price, :amount, :making_status, :payment_method, :status )
  end

end
