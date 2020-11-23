class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @price = (@item.tax_out_price * 1.1).floor
    @cart_item = CartItem.new
  end

end
