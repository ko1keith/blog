require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.create(username:"newuser", email:"newuser@example.com", password:"password")
  end
  

  test "should reject article path without login" do
    get "/articles/new"
    assert_response :redirect
  end

  test "should get path while logged in" do
    sign_in_as(@user)
    get "/articles/new"
    assert_response :success
  end

  test "reject invalid article" do
    sign_in_as(@user)
    get "/articles/new"
    assert_no_difference 'Article.count' do
      post articles_url, params: {article: {title: "", description: "", category:[]}}
    end
    assert_template :new
    assert_response :success
  end

  test "accept valid article" do
    sign_in_as(@user)
    get "/articles/new"
    assert_template 'articles/new'
    assert_difference("Article.count",1) do
      post articles_path, params: {article: {title: "title new", description: "random description", category:[1]}}
    end
    follow_redirect!
    assert_response :success
    assert_match "title new", response.body
  end

end
