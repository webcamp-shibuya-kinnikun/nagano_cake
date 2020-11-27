class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id], is_sale: true).page(params[:page])
    else
      @items = Item.where(is_sale: true).page(params[:page])
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
