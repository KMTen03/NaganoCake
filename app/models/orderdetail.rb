class Orderdetail < ApplicationRecord
  def subtotal
    (item.price*1.1).floor*quantity
  end
  
  belongs_to :order
  belongs_to :item
end
