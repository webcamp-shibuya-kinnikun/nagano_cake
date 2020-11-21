class Public::DelivaryAddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
  	@delivary_addresses = current_customer.delivery_address
  	@delivery_address = DeliveryAddress.new
  end

	def create
	  @delivery_address = DeliveryAddress.new(delivery_address_params)
	  @delivery_address.customer_id = current_customer.id
    @delivery_addresses = current_customer.delivery_address
	  if @delivery_address.save
      #flash.now[:notice] = "新規配送先を登録しました"
	    #redirect_to delivery_addresses_path
	  #else
	   	#@delivery_addresses = current_customer.delivery_address
	    #render 'index'
	  end
	end

	def edit
    @delivery_address = DeliveryAddress.find(params[:id])
	end

	def update
	  @delivery_address = DeliveryAddress.find(params[:id])
	  if @delivery_address.update(delivery_address_params)
  	  flash[:success] = "配送先を変更しました"
      redirect_to delivery_addresses_path
	  else
	    render "edit"
	  end
	end

	def destroy
	  @delivery_address = DeliveryAddress.find(params[:id])
	  @delivery_address.destroy
    @delivery_addresses = current_customer.delivery_address
    flash.now[:alert] = "配送先を削除しました"
	  #redirect_to delivery_addresses_path
	end

	private

  def delivery_address_params
  	params.require(:delivery_address).permit(:postal_code, :address, :name)
  end

end
