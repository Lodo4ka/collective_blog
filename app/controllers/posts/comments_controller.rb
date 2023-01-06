# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :search_post, only: [:create]

    def create
      @comment = @post.comments.build comment_params
      @comment.user = current_user

      if @comment.save
        redirect_to post_path(@post)
      else
        redirect_to post_path(@post), alert: @comment.errors.objects.first.full_message
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end

    def search_post
      @post = Post.find params[:post_id]
    end
  end
end
