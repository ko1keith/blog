require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
     @category = Category.create(name: "Sports")
     @category2 = Category.create(name: "Technology")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "h5.card-subtitle", string: @category.name
    assert_select "h5.card-subtitle", string: @category2.name

  end
end
