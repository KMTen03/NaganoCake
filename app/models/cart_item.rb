class CartItem < ApplicationRecord
  def subtotal
    (item.price*1.1).floor*amount
  end
  
  def create
    
  end
  
  belongs_to :customer
  belongs_to :item
end
