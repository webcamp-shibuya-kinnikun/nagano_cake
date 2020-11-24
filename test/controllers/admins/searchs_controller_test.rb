require 'test_helper'

class Admins::SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get searchs_search_url
    assert_response :success
  end

end
