class FriendshipsController < ApplicationController

  def show
      @friendship = Friendship.find(params[:id])
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.user.remove_friend(@friendship.friend)
      redirect_to profile_path(@friendship.friend)
    end
  end
end
