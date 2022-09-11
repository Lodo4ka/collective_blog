class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build comment_params
    @comment.user = current_user

    if @comment.save
      redirect_to @post
    else
      redirect_to @post, alert: @comment.errors.objects.first.full_message
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
