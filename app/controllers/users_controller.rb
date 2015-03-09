class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    @posts = @user.ordered_posts
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
