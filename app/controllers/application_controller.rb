class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:last_name, :first_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email]
      )
    devise_parameter_sanitizer.permit(
      :update, keys: [:last_name, :first_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email]
      )
  end


  POSTAGE = 800

  # 0入金待ち,1入金確認,2製作中,3発送準備中,4発送済み
  ORDER_STATUS = ["入金待ち","入金確認","製作中","発送準備中","発送済み"]

  # 0クレジットカード,1銀行振り込み
  PAYMENT_METHOD = ["クレジットカード","銀行振り込み"]

  # 0着手不可,1製作待ち,2製作中,3製作完了
  PRODUCTION_STATUS= ["着手不可","製作待ち","製作中","製作完了"]
  TAX = 0.1



  private
    def after_sign_up_path_for(resource)
      items_path
    end

  # sign_in後のAdminとCustomerの遷移先の記述
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_top_path
    when Customer
      items_path
    end
  end
  
  # 会員用
  def after_sign_out_path_for(resource)
    new_customer_session_path
  end
  # 管理者用
  def after_sign_out_path_for(resource)
      new_admin_session_path
  end
  
end
