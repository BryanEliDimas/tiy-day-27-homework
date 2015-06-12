class PostsController < ApplicationController
  before_action :check_auth, only: [:new, :create]

  def check_auth
    @signed_in_user = User.find_by id: session[:current_user_id]
    if @signed_in_user.nil?
      redirect_to sign_in_path
    end
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
