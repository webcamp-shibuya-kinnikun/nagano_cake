class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
  	@address = Address.new
  end

  def create
    @adresses = Address.new(params_adresses)
    @adresses.customer_id = current_customer.id
    @adresses.save
    redirect_to request.referer
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
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
	  if @address.update(address_params)
  	 flash[:success] = "配送先を変更しました"
     redirect_to addresses_path
	  else
	   render "edit"
	  end
  end

  def destroy
    @address = Address.find(params[:id])
	  @address.destroy
    @addresses = current_customer.address
    flash.now[:alert] = "配送先を削除しました"
	  # redirect_to addresses_path
  end

  def params_adresses
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
