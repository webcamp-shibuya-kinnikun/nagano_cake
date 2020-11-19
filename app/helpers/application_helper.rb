module ApplicationHelper
  def current_cart
    @cart_items = current_customer.cart_items
  end

  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def sub_price(sub)
    (tax_price(sub.item.tax_out_price) * sub.quantity)
  end

  # 合計金額の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  tax_out_price(total)
    end
    return price
  end

end
