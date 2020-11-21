class Public::AddressesController < ApplicationController
  def index
  end

  def create
    @adresses = Address.new(params_adresses)
    @adresses.customer_id = current_customer.id
    @adresses.save
    redirect_to orders_new_path()
  end

  # 住所登録非同期
  def create2
      @Address = Address.new(params_adresses)
      @Address.customer_id = current_customer.id
      if @Address.save
        # ユーザーの配送先住所の全てを取得
        @customer_addresses = Address.where(customer_id: current_customer.id)
      else
        flash[:alert] = "登録に失敗しました。"
        redirect_to orders_new_path(current_customer)
      end
  end

  # 住所選択非同期
  def create3
      # /addresses/:address_id/create3(.:format)  
      @order = Order.new()
      @address = Address.find(params[:address_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def params_adresses
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
