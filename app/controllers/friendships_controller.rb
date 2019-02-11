class FriendshipsController < ApplicationController

  def show
      @friendship = Friendship.find(params[:id])
      @friend_posts = @friendship.friend.posts
      @user_posts = @friendship.user.posts
      @post = Post.new
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.user.remove_friend(@friendship.friend)
      redirect_to profile_path(@friendship.friend)
    end
  end
end
