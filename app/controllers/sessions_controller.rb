class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:success] = "Successfully Signed-In!!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password...Try again!"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
