class Public::OrdersController < ApplicationController
  def new
    @order = Order.new()
    # ユーザーの配送先住所の全てを取得
    @customer_addresses = Address.where(customer_id: current_customer.id)
    @adresses = Address.new()
    @address = Customer.find(current_customer.id)
    common()
  end

  def common
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @postage = POSTAGE
    item_price=0
    @cart_item.each do |cart_item|
      # 消費税のみ
      tax = TAX * cart_item.item.tax_out_price * cart_item.quantity
      # 税込み価格
      item_price +=  (cart_item.item.tax_out_price * cart_item.quantity) + tax
    end

    # 全ての税込み合計金額
    @total_price = (item_price + POSTAGE).to_i
  end


  def confirm
    common()
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    render :new if @order.invalid?
  end



  def create
    common()
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_price =  @total_price
    @order.order_status = 0

      if params[:back]
        # 戻るボタンを押した時

        render :new
      elsif @order.save
        # セーブ成功
        @cart_item.each do |cart_item|
          @order_detail = OrderDetail.new()
          @order_detail.item_id = cart_item.item_id
          @order_detail.order_id = @order.id
          @order_detail.quantity = cart_item.quantity
          tax = TAX * cart_item.item.tax_out_price
          @order_detail.tax_in_price = (cart_item.item.tax_out_price + tax).to_i
          @order_detail.production_status = 0
          @order_detail.save
          cart_item.destroy
       end
        # カートの削除
        render :thanks
      else
        # セーブに失敗
        common()
        render :new
      end
  end


  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @PAYMENT_METHOD = PAYMENT_METHOD
    @PRODUCTION_STATUS = PRODUCTION_STATUS
    @ORDER_STATUS = ORDER_STATUS
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code ,:address ,:name ,:payment_method)
  end

end
