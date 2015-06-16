class TagsController < ApplicationController
  def show
    @posts = Post.tagged_with(params[:tag]).order("created_at desc").page(params[:page]).per(6)
  end
end
