require 'test_helper'

class Admins::OrdersDatalsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_orders_datals_update_url
    assert_response :success
  end

end
