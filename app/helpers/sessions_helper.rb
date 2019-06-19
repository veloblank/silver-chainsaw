module SessionsHelper

  def log_in(contestant)
    session[:user_id] = contestant.id
  end

  def logged_in?
    !!current_user
  end

  def current_user
    #Contestant.find_by(id: session[:user_id]) refactor to not hit DB everytime
    @current_user ||= Contestant.find_by(id: session[:user_id])
  end
end
