require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  test "should get index" do
    get posts_path
    assert_response :success
  end


  test "should get show" do
    sign_in @user
    get post_path @post
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get post_new_path
    assert_response :success
  end
end
