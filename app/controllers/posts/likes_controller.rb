# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      post = Post.find_by id: params[:post_id]
      post.likes.find_or_create_by user_id: current_user&.id
      redirect_to post_path(post)
    end

    def destroy
      @like = current_user.likes.find(params[:id])
      post = @like.post
      @like.destroy
      redirect_to post
    end
  end
end
