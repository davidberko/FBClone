class PostsController < ApplicationController
  before_action :set_user, only: [:new, :index, :show]
  def index
    @user_posts = @user.posts

    @user.friends.each do |f|
    @posts = f.posts
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save!
      redirect_to user_posts_path(current_user.id)
    end
  end

  def edit
  end

  def like
    @post = Post.find(params[:id])
    @post.likes << current_user unless @post.likes.include?(current_user)
    redirect_to request.referrer
  end

  def unlike
    @post = Post.find(params[:id])
    if @post.likes.include?(current_user)
      @post.likes.delete(current_user)
    end
    redirect_to request.referrer
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.permit(:post, :user_id, :content)
  end
end
