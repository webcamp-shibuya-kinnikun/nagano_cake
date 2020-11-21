class Item < ApplicationRecord

  has_many :customers, through: :cart_items
  has_many :cart_items
  has_many :order_details
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
