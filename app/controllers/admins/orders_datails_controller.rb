class Admins::OrdersDatailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    # 製作ステータスが製作中だったら、注文ステータスも製作中に変更
    if order_detail_params[:production_status] == "製作中"
      @order_detail.order.update(order_status: "製作中")
      flash[:success] = "注文ステータスと製作ステータスを製作中に変更しました。"
      redirect_to admins_orders_path
    # 製作ステータスが全て製作完了だったら、注文ステータスを発送待ちに変更
    elsif @order_detail.order.order_details.where(production_status: "製作完了").count == @order_detail.order.order_details.count
      @order_detail.order.update(order_status: "発送待ち")
      flash[:success] = "製作ステータスを変更しました。注文ステータスを発送待ちに変更しました。"
      redirect_to admins_orders_path
    else
      flash[:success] = "製作ステータスを変更しました。"
      redirect_to admins_orders_path
    end
  end

  private

  def order_detail_params
  	params.require(:order_detail).permit(:production_status)
  end
end