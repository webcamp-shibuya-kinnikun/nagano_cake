require 'test_helper'

class Public::CustemersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_custemers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_custemers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_custemers_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_custemers_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get public_custemers_withdraw_url
    assert_response :success
  end

end
