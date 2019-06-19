class SessionsController < ApplicationController
  def new
    @contestant = Contestant.new
  end

  def create
    contestant = Contestant.find_by(username: params[:session][:username])
    if contestant && contestant.authenticate(params[:session][:password])
      log_in contestant
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
