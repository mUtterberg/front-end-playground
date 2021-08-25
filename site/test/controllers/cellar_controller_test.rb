require "test_helper"

class CellarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cellar_index_url
    assert_response :success
  end
end
