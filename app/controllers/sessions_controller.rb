class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = "The username/password combination you entered are incorrect."
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
