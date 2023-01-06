# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @post = posts(:one)
      @user = users(:one)
      @comment = post_comments(:one)
      @attrs = {
        content: Faker::Quote.matz
      }
      @nested_attrs = {
        content: Faker::Quote.matz,
        parent_id: @comment.id
      }
    end

    test 'not authorized should create comment in post' do
      count = PostComment.count
      post post_comments_path(@post), params: { post_comment: @attrs }
      assert count == PostComment.count
      assert_redirected_to new_user_session_path
    end

    test 'authorized should create comment in post' do
      sign_in @user
      post post_comments_path(@post), params: { post_comment: @attrs }
      found_comment = PostComment.find_by(@attrs)
      assert found_comment
      assert_redirected_to post_path(@post)
    end

    test 'authorized should create nested comment in post' do
      sign_in @user
      post post_comments_path(@post), params: { post_comment: @nested_attrs }
      found_comment = PostComment.find_by content: @nested_attrs[:content]
      assert found_comment.parent_id == @nested_attrs[:parent_id]
      assert_redirected_to post_path(@post)
    end
  end
end
