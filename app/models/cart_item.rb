class CartItem < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :item, optional: true

    validates :customer_id, :item_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }



end
