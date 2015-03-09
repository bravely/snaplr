class PostsController < ApplicationController
  before_action :find_user, only: [:new, :create]

  def new
    @post = current_user.posts.new
    render 'posts/form'
  end

  def create
    @post = current_user.posts.create! post_params
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit([
      :title,
      :body
    ])
  end
end
