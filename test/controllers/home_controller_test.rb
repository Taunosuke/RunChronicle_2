require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.delete_all
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end
end
