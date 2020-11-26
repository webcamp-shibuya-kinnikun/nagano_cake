class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@orders = Order.all.page(params[:page]).per(10)
  end

  def applicable_customer_index
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render "index"
  end

  def today_order_index
    now = Time.current
    @orders = Order.where(created_at: now.all_day).page(params[:page]).per(10)
    render "index"
  end

	def show
		@PAYMENT_METHOD = PAYMENT_METHOD
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    # 注文ステータスが入金確認だったら、製作ステータスを製作待ちに変更
    if order_params[:order_status] == "入金確認"
			@order.order_details.each do |order_detail|
				order_detail.update(production_status: "製作待ち")
			end
			flash[:success] = "注文ステータスを変更しました。製作ステータスを製作待ちに変更しました。"
			redirect_to admins_order_path(@order)
		else
			flash[:success] = "注文ステータスを変更しました"
			redirect_to admins_order_path(@order)
    end
  end

	private
	def order_params
		  params.require(:order).permit(:order_status)
	end

end
