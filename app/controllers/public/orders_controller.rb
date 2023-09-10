class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @total = 0
    @order.carriage = 800
    @customer = current_customer
    @cart_items = current_customer.cart_items
    if params[:order][:home_address] = "0"
      @order.post_code = current_customer.postal_code
      @order.home_address = current_customer.address
      @order.address = current_customer.first_name + current_customer.last_name
    elsif params[:order][:home_address] = "1"
      @order.post_code = params[:order][:post_code]
      @order.home_address = params[:order][:home_address]
      @order.address = params[:order][:address]
    else
      render 'new'
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @orderdetails = Orderdetail.new
      @orderdetails.item_id = cart_item.item_id
      @orderdetails.quantity = cart_item.amount
      @orderdetails.tax_price = (cart_item.item.price*1.1).floor
      @orderdetails.order_id = @order.id
      @orderdetails.save
    end
    redirect_to complete_path
  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment, :carriage, :total_amount, :post_code, :address, :home_address)
  end
end
