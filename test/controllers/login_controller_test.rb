require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get verify" do
    get login_verify_url
    assert_response :success
  end

end
