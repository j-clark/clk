class UsersController < ApplicationController

  def update
    current_user.update_attributes(params[:user])
    redirect_to user_url(current_user.username)
  end

  def edit
    @user = current_user if current_user.username == params[:id]
  end

  def show
    @user_to_show = User.find_by_username(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to user_url(@user.username), :notice => "Signed up!"
    else
      render "new"
    end
  end
end