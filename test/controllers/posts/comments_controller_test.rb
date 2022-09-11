require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get posts_comments_create_url
    assert_response :success
  end
end
