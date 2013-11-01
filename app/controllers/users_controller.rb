class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @products = @user.products
  end

  def profile
    @user = User.find(params[:id])
    @comments = @user.comments
    @comment = @user.comments.build
  end

  def comment
    # raise params.inspect
    @user = User.find(params[:user])
    @comment = @user.comments.create(params[:comment])
    redirect_to profile_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end
end
