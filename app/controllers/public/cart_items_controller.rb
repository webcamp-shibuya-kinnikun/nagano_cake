class Public::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart_item, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @cart_items = current_cart
  end

  def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    flash.now[:success] = "#{@cart_item.item.name}の数量を変更しました"
    @price = tax_out_price(@cart_item).to_s(:delimited)
    @cart_items = current_cart
    @total = total_price(@cart_items).to_s(:delimited)
  end

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    　# カートの中に同じ商品が重複しないようにして　もともとあった商品と新しく数量を追加商品の数量を合わせる
  　@update_cart_item =  CartItem.find_by(item: @cart_item.item)
    if @update_cart_item.present? && @cart_item.valid?
      @cart_item.quantity += @update_cart_item.quantity
      @update_cart_item.destroy
    end

    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください"
      render ("customer/items/show")
    end
  end

  def destroy
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
    @cart_items = current_cart
    @total = total_price(@cart_items).to_s(:delimited)
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_item_path
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
