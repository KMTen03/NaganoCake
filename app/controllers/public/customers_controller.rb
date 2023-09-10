class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def update
    
  end

  def confirm
    
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
end
