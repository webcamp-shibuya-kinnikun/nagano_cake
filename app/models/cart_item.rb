class CartItem < ApplicationRecord
    belongs_to :customers
    belongs_to :items

    validates :customer_id, :product_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

end
