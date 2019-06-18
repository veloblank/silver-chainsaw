class SessionsController < ApplicationController
  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.find_by(username: params[:username])
    return head(:forbidden) unless @contestant.authenticate(params[:password])
    session[:user_id] = @contestant.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
  end
end
