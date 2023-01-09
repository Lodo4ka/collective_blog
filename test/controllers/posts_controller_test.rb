# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @attrs = {
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph_by_chars(number: 200),
      post_category_id: post_categories(:one).id
    }
  end

  test 'should get index' do
    get posts_path
    assert_response :success
  end

  test 'should get show' do
    get post_path @post
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_post_path
    assert_response :success
  end

  test 'should get new raise error unauthorized' do
    get new_post_path
    assert_redirected_to new_user_session_path
  end

  test 'not authorized create post' do
    post_count = Post.count
    post posts_path, params: { post: @attrs }
    assert Post.count == post_count
    assert_redirected_to new_user_session_path
  end

  test 'authorized create post' do
    sign_in @user
    post posts_path, params: { post: @attrs }
    found_post = Post.find_by @attrs
    assert found_post
    assert_redirected_to posts_path
  end
end
