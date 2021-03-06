class CommentsController < ApplicationController
  before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new comment_params
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to request.referrer, notice: 'Your comment was successfully posted!'
      else
        redirect_to request.referrer, notice: "Your comment wasn't posted!"
      end
    end

    def like
      @commentable = Comment.find(params[:id])
      @commentable.likes << current_user unless @commentable.likes.include?(current_user)
      redirect_to request.referrer
    end

    def unlike
      @commentable = Comment.find(params[:id])
      if @commentable.likes.include?(current_user)
        @commentable.likes.delete(current_user)
      end
      redirect_to request.referrer
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
  end
