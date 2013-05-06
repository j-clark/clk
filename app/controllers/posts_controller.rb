require "enumerator"

class PostsController < ApplicationController

  def index
    @posts = Post.all(limit: 5)
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post[:user_id])
  end

  def new
    if current_user.nil?
      redirect_to '/login'
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save!
      redirect_to post_url(@post[:id])
    end
  end

end