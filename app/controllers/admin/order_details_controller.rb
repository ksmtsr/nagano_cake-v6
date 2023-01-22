class Admin::OrderDetailsController < ApplicationController


  def update
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "making"
       @order.update(status:2)
    elsif @order.order_details.complete.count == @order.order_details.count
          @order.update(status:3)
    end

    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :tax_included_price, :amount, :making_status)
  end

end
