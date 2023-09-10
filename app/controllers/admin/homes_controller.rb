class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
    @orders = Order.page(params[:page])
    @order_details = Orderdetail.all
  end
end
