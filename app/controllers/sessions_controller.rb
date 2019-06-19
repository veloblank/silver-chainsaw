class SessionsController < ApplicationController
  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.find_by(username: params[:username])
    if @contestant && @contestant.authenticate(params[:password])
      session[:user_id] = @contestant.id
      redirect_to root_path
    else
      flash[:notice] = "The username and password you entered are incorrect."
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
