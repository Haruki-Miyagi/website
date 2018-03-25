class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profileposts = User.find_by(user_name: params[:user_name]).posts.order(created_at: :desc)
    @user = User.find_by(user_name: params[:user_name])
  end

  def edit
    @user = User.find_by(user_name: params[:user_name])
  end

  def update
    @user = User.find_by(user_name: params[:user_name])
    if @user.update(params.require(:user).permit(:avatar, :bio))
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end　
  end

  end
end
