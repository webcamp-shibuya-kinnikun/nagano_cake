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
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"
		   redirect_to admins_orders_path(@order)
		else
		   render "show"
		end
	end

	private
	def order_params
		  params.require(:order).permit(:order_status)
	end

end
