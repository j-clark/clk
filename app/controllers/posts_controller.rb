require "enumerator"

class PostsController < ApplicationController

  def index
    @posts = Post.all(limit: 5)
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post[:user])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post[:user] = current_user.id
    if @post.save!
      redirect_to post_url(@post[:id])
    end
  end

end