class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  validates :postal_code, :address, :name, presence: true
  validates :postal_code,    length: { in: 7..7 }
  
end
