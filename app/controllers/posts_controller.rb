class PostsController < ApplicationController
  before_action do
    # @signed_in_user = 
  end

  def index
    @posts = Post.all.order("created_at desc").page(params[:page]).per(6)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :photo)

    if @post.save
      redirect_to root_path, notice: "It saved!"
    else
      render :new
    end
  end
end
