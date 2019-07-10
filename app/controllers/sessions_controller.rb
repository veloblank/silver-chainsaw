class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:provider]
      user = User.create_by_google_omniauth(auth)
      user.create_pick_history
      login user
      redirect_to root_path
    else
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        login user
        redirect_to root_path
      else
        flash.now[:danger] = "The username and password combination you entered is incorrect."
        render :new
      end
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
