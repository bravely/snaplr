class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
    render 'posts/form'
  end

  def create
    @post = current_user.posts.create! post_params
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit([
      :title,
      :body
    ])
  end
end
