class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.where(user: current_user.followed).order(created_at: :desc).includes(:user) if current_user
  end

  def public
    @posts = Post.all.order(created_at: :desc).includes(:user)
  end
end
