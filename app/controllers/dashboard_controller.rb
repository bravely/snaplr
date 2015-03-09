class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.limit(10)
  end
end
