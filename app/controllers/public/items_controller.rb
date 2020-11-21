class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @price = (@item.tax_out_price * 1.1).floor
    @cart_item = CartItem.new
  end

end
