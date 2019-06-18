class SessionsController < ApplicationController
  def new
    @contestant = Contestant.new
  end

  def create
  end

  def destroy
    session.delete :user_id
  end
end
