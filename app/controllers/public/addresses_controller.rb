class Public::AddressesController < ApplicationController
  def index
  end

  def create
    @adresses = Address.new(params_adresses)
    @adresses.customer_id = current_customer.id
    @adresses.save

      redirect_to orders_new_path()
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
