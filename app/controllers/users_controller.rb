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

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.paginate(page: params[:page], per_page: 10)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(users_params)
      flash[:success] = "Successfully Updated!"
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def following
    @user = User.find(params[:id])
    @title = "Following"
    @users = @user.following.paginate(page: params[:page])
    render "users/follow"
  end

  def followers
    @user = User.find(params[:id])
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render "users/follow"
  end

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_digest, :image)
  end

end
