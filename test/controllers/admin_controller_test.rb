require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get score_props" do
    get admin_score_props_url
    assert_response :success
  end

end
