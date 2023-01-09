# frozen_string_literal: true

require 'test_helper'

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @post = posts(:one)
      @user = users(:one)
      @post_like = post_likes(:one)

      sign_in @user
    end

    test 'should set like' do
      post post_likes_path(@post)
      assert_redirected_to post_path(@post)
    end

    test 'should delete like' do
      delete post_like_path(@post_like.post, @post_like)
      assert_redirected_to post_path(@post_like.post)
    end
  end
end
