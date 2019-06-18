class ContestantsController < ApplicationController


  def new
    @contestant = Contestant.new

  end


  def create
    @contestant = Contestant.create(contestant_params)
    session[:user_id] = @contestant.id
    redirect_to root_path
  end


  private

  def contestant_params
    params.require(:contestant).permit(:username, :password, :password_confirmation)
  end
end
