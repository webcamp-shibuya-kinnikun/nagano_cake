class Admins::OrdersDatailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:success] = "制作ステータスを変更しました"
      redirect_to admins_orders_path
    else
      render "order/show"
    end
  end

  private

  def order_detail_params
  	params.require(:order_detail).permit(:production_status)
  end
end