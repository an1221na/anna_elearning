class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    @user.save
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end
end
