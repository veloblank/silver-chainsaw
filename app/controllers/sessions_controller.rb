class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login user
      if user_has_selected_pick?
        redirect_to add_prop_to_user_entry_path(:params => params)
      else
        redirect_to root_path
      end
    else
      flash.now[:danger] = "The username/password combination you entered are incorrect."
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end
end
