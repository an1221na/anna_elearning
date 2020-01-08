class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Welcome to E-learning page!!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end
end
