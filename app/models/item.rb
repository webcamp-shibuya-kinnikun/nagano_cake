class Item < ApplicationRecord
  
  has_many :cart_items
  belongs_to :genre
  attachment :image
  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :tax_out_price, presence: true
  validates :explanation, presence: true
  validates :is_sale, presence: true,
  inclusion: { in: [true, false] }

end
