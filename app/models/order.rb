class Order < ApplicationRecord
  enum payment: { credit_card: 0, transfer: 1 }


  belongs_to :customer
  has_many :orderdetails
end
