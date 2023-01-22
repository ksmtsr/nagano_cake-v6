class Admin::HomesController < ApplicationController

  def top
    @orders = Order.order("created_at DESC").page(params[:page]).per(10)
    @orders = Order.page(params[:page]).per(10)
  end



private

end