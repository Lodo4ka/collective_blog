class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /posts
  def index
    @posts = Post.all
  end

  # POST /posts
  def create
    post_prop = post_params.merge(creator_id: current_user.id)
    @post = Post.new(post_prop)
    if @post.save
      redirect_to posts_path, notice: 'Post was created successfully!'
    else
      render :new, alert: 'Unprocessable entity!'
    end
  end

  def show
    @post = Post.find(params[:id])
    @current_comment = @post.comments.build
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
