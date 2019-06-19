class ContestantsController < ApplicationController
  layout "signup"

  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.new(contestant_params)
    if @contestant.save
      login @contestant
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def contestant_params
    params.require(:contestant).permit(:username, :email, :password, :password_confirmation)
  end
end
