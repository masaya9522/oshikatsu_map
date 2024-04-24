require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get searches_admin_url
    assert_response :success
  end
end
