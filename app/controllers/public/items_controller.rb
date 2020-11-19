class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price = (@item.tax_out_price * 1.1).floor
  end

def create
  @cart_item = current_customer.cart_items.new(params_cart_item)

  @update_cart_item =  CartItem.find_by(item: @cart_item.item)
  if @update_cart_item.present? && @cart_item.valid?
    @cart_item.quantity += @update_cart_item.quantity
    @update_cart_item.destroy
  end

  if @cart_item.save
    flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
    redirect_to cart_items_path
  else
    @product = Item.find(params[:cart_item][:item_id])
    @cart_item = CartItem.new
    flash[:alert] = "個数を選択してください"
    render ("customer/items/show")
  end
end

private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
