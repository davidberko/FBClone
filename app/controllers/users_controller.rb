class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit_profile_pic
    @user = User.find(params[:id])
  end

  def update_profile_pic
    @user = User.find(params[:id])
    @user.update(profile_pic_params)
    if @user.save
      redirect_to profile_path(@user.id)
    end
  end

  def edit_cover_photo
    @user = User.find(params[:id])
  end

  def update_cover_photo
    @user = User.find(params[:id])
    @user.update(cover_photo_params)
    if @user.save
      redirect_to profile_path(@user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_picture, :cover_photo, :first_name, :last_name, :male, :female, :birthday, :password, :email)
  end
  def profile_pic_params
      params.permit(:user, :profile_picture)
  end
  def cover_photo_params
    params.permit(:user, :cover_photo)
  end
end
