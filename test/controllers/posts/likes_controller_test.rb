# frozen_string_literal: true

require 'test_helper'

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    test 'should get create' do
      get posts_likes_create_url
      assert_response :success
    end

    test 'should get destroy' do
      get posts_likes_destroy_url
      assert_response :success
    end
  end
end
