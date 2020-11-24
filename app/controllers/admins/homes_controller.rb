class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    now = Time.current
    @orders = Order.where(created_at: now.all_day).page(params[:page]).per(10)
  end
end
