class UsersController < ApplicationController
  before_action :find_user, only: [:show, :follow, :unfollow]

  def show
    @posts = @user.ordered_posts
    @relationship = current_user.follows?(@user)
  end

  def follow
    current_user.follow!(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    current_user.unfollow!(@user)
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
