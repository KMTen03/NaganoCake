class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment, :carriage, :total_amount, :post_code, :address, :home_address)
  end
end
