require "test_helper"

class SignupTest < ActionDispatch::IntegrationTest
  test "get signup form and create new user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "test_profile", email: "test@example.com", password: "password" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "test_profile", response.body
  end

  test "get signup form and reject invalid sign up submission" do
    get "/signup"
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username: " ", email: "test@example.com", password: "password" } }
    end
    assert_match "error", response.body
    assert_select "div.alert"
    assert_select "h4.alert-heading"
  end
end
