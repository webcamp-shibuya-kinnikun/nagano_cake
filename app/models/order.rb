class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :postal_code, :address, :name, presence: true
  validates :postal_code,    length: { in: 7..7 }

	enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送待ち": 3, "発送済み": 4}
end
