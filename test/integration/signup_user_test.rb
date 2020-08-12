require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get signup path" do
    get "/signup"
    assert_response :success
  end

  test "reject invalid signup" do
    get "/signup"
    assert_no_difference "User.count" do
      post users_path, params:{user: {username:"", email:"", password:"password"}}
    end
    assert_template :new
    assert_response :success
  end

  test "accept valid signup" do
    get "/signup"
    assert_difference "User.count", 1 do
      post users_path, params: {user: {username: "olivia", email:"olivia@example.com", password:"password"}}
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
  end
  
end
